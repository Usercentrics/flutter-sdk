import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'build_your_own_ui.dart';

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
      loggerLevel: UsercentricsLoggerLevel.debug,
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
        _showFirstLayer();
      } else {
        applyConsent(status.consents);
      }
    } catch (error) {
      // Handle non-localized error
    }
  }

  void _showFirstLayer() async {
    try {
      final response = await Usercentrics.showFirstLayer(
        layout: UsercentricsLayout.sheet,
        logo: const UsercentricsImage(assetPath: 'images/flutter-logo.png'),
        // font: const UsercentricsFont(
        //   fontAssetPath: 'fonts/Lora-VariableFont_wght.ttf',
        //   fontSize: 15,
        // ),
      );

      _handleUserResponse(response);
    } catch (error) {
      // Handle error
    }
  }

  void _showSecondLayer() async {
    try {
      final response = await Usercentrics.showSecondLayer(
        showCloseButton: true,
        logo: const UsercentricsImage(assetPath: 'images/flutter-logo.png'),
        // font: const UsercentricsFont(
        //   fontAssetPath: 'fonts/Lora-VariableFont_wght.ttf',
        //   fontSize: 15,
        // ),
      );

      _handleUserResponse(response);
    } catch (error) {
      // Handle error
    }
  }

  void _handleUserResponse(UsercentricsConsentUserResponse? response) {
    print("Consents -> ${response?.consents}");
    print("User Interaction -> ${response?.userInteraction}");
    print("Controller Id -> ${response?.controllerId}");

    applyConsent(response?.consents);
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
              onPressed: () => _showFirstLayer(),
              child: const Text("Show First Layer"),
            ),
            ElevatedButton(
              onPressed: () => _showSecondLayer(),
              child: const Text("Show Second Layer"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomUIPage()),
              ),
              child: const Text("Custom UI"),
            ),
          ],
        ),
      ),
    );
  }
}

void applyConsent(List<UsercentricsServiceConsent>? consents) {
  // https://docs.usercentrics.com/cmp_in_app_sdk/latest/apply_consent/apply-consent/#apply-consent-to-each-service
}
