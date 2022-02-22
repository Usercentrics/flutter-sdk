import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'build_your_own_ui.dart';
import 'first_layer_customization_example_1.dart';
import 'first_layer_customization_example_2.dart';

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

      if (status.shouldCollectConsent) {
        _showFirstLayer();
      } else {
        applyConsent(status.consents);
      }
    } catch (error) {
      // Handle non-localized error
    }
  }

  void _showFirstLayer({
    UsercentricsLayout? layout,
    FirstLayerStyleSettings? settings,
  }) async {
    try {
      final response = await Usercentrics.showFirstLayer(
        layout: layout ?? UsercentricsLayout.popupBottom,
        logo: const BannerImage(assetPath: 'images/flutter-logo.png'),
        // font: const BannerFont(
        //   regularFontAssetPath: 'fonts/Lora-Regular.ttf',
        //   boldFontAssetPath: 'fonts/Lora-Bold.ttf',
        //   fontSize: 15,
        // ),
        settings: settings,
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
        logo: const BannerImage(assetPath: 'images/flutter-logo.png'),
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              onPressed: () => _showFirstLayer(
                layout: UsercentricsLayout.popupBottom,
                settings: firstLayerCustomizationExample1,
              ),
              child: const Text("Customization Example 1"),
            ),
            ElevatedButton(
              onPressed: () => _showFirstLayer(
                layout: UsercentricsLayout.full,
                settings: firstLayerCustomizationExample2,
              ),
              child: const Text("Customization Example 2"),
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
