import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _showCMPIfNeeded();
  }

  void _showCMPIfNeeded() async {
    try {
      final status = await Usercentrics.status;

      if (status.shouldShowCMP) {
        _showCMP(showCloseButton: false);
      } else {
        _applyConsent(status.consents);
      }
    } catch (error) {
      // Handle error
    }
  }

  void _applyConsent(List<UsercentricsServiceConsent>? consents) {
    // https://docs.usercentrics.com/cmp_in_app_sdk/latest/apply_consent/apply-consent/#apply-consent-to-each-service
  }

  void _showCMP({required bool showCloseButton}) async {
    try {
      final response = await Usercentrics.showCMP(
        showCloseButton: showCloseButton,
        customLogo:
            const UsercentricsImage(assetPath: 'images/flutter-logo.png'),
        // customFont: const UsercentricsFont(
        //   fontAssetPath: 'fonts/Lora-VariableFont_wght.ttf',
        //   fontSize: 15,
        // ),
      );

      print("Consents -> ${response?.consents}");
      print("User Interaction -> ${response?.userInteraction}");
      print("Controller Id -> ${response?.controllerId}");

      _applyConsent(response?.consents);
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usercentrics Flutter Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showCMP(showCloseButton: true),
              child: const Text("Show Usercentrics UI"),
            ),
          ],
        ),
      ),
    );
  }
}
