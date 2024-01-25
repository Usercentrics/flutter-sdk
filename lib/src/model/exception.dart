class FailedInitializationException implements Exception {
  final String message;

  const FailedInitializationException(this.message);

  @override
  String toString() => "$FailedInitializationException: $message";
}

class NotInitializedException implements Exception {
  static const message =
      "Usercentrics was not initialized, please ensure that you invoke 'Usercentrics.initialize()' before you start using it";

  const NotInitializedException();

  @override
  String toString() => "$NotInitializedException: $message";
}
