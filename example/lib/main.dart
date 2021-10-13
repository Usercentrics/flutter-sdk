import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:usercentrics_example/home_page.dart';
import 'package:usercentrics_sdk/all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _initializeUsercentrics();
  }

  void _initializeUsercentrics() {
    /// Initialize Usercentrics with your configuration only once.
    /// We should not call `initialize` directly inside [build].
    Usercentrics.initialize(
      settingsId: 'Yi9N3aXia',
      // loggerLevel: UsercentricsLoggerLevel.debug,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
