// Usage: dart check_gradle_version.dart

import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print
void main(List<String> args) async {
  final version = await _getVersion();
  print('Installed version: $version');

  final requiredVersion = await _getRequiredVersion();
  print('Required version: $requiredVersion');

  if (version != requiredVersion) {
    print('Invalid Gradle version: $version != $requiredVersion');
    exitCode = 1;
    throw InvalidGradleException();
  } else {
    exitCode = 0;
  }
}

Future<String> _getVersion() async {
  final versionResult = await Process.run('./gradlew', ['--version']);
  final versionString = versionResult.stdout as String;
  final versionLine = versionString
      .split("\n")
      .where((element) => element.contains("Gradle"))
      .first;
  return versionLine.split(' ').map((e) => e.trim()).last.replaceAll("!", "");
}

Future<String> _getRequiredVersion() async {
  final file = File('gradle/wrapper/gradle-wrapper.properties');
  final lines = await file
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();

  final distributionUrl = lines
      .where((element) => element.contains("distributionUrl"))
      .first
      .split("=")[1];

  return distributionUrl.split("-")[1];
}

class InvalidGradleException implements Exception {}
