// Usage: dart check_coverage.dart path/to/lcov.info

import 'dart:io';

const minCoverage = 70;

// ignore_for_file: avoid_print
void main(List<String> args) async {
  final lcovFilePath = args[0];

  final coverage = await _computeCoverage(lcovFilePath);
  final coverageString = coverage.toStringAsFixed(2);
  print('Total test coverage: $coverageString%');

  if (coverage < minCoverage) {
    print('Invalid coverage: $coverageString% < $minCoverage% (minimum)');
    exitCode = 1;
    throw InvalidCoverageException();
  } else {
    exitCode = 0;
  }
}

Future<double> _computeCoverage(String lcovFilePath) async {
  final lcovResult = await Process.run('lcov', ['--summary', lcovFilePath]);
  final lcovSummary = lcovResult.stdout as String;
  final lcovLinesLine = lcovSummary
      .split("\n")
      .firstWhere((element) => element.contains("lines)"));
  final linesCoveragePercentage = lcovLinesLine
      .split(' ')
      .map((e) => e.trim())
      .firstWhere((e) => e.contains("%"));
  return double.parse(linesCoveragePercentage.replaceAll("%", ""));
}

class InvalidCoverageException implements Exception {}
