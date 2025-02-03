class FailedInitializationException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const FailedInitializationException(this.message, [this.stackTrace]);

  @override
  String toString() => 'FailedInitializationException: $message\nStackTrace: $stackTrace';
}

class NotInitializedException implements Exception {
  static const message =
      "Usercentrics was not initialized, please ensure that you invoke 'Usercentrics.initialize()' before you start using it";

  const NotInitializedException();

  @override
  String toString() => "$NotInitializedException: $message";
}
