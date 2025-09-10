import 'package:flutter/material.dart';
import 'package:usercentrics_example/webview_integration.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'build_your_own_ui.dart';
import 'customization_example_1.dart';
import 'customization_example_2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    BannerSettings? settings,
  }) async {
    try {
      final response = await Usercentrics.showFirstLayer(
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
        settings: BannerSettings(
          secondLayer: SecondLayerStyleSettings(
            showCloseButton: true,
            buttonLayout: ButtonLayout.row(
              buttons: [
                const ButtonSettings(type: ButtonType.save),
                const ButtonSettings(type: ButtonType.acceptAll),
              ],
            ),
          ),
        ),
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

  static Future<BannerSettings> get abTestingBannerSettings async {
    // 'Activate with Usercentrics' option
    final variant = await Usercentrics.aBTestingVariant;
    switch (variant) {
      case "variantA":
        return const BannerSettings(/* variantA Settings */);
      case "variantB":
        return const BannerSettings(/* variantB Settings */);
      default:
        return const BannerSettings(/* Default Settings */);
    }

    // 'Activate with third-party tool' option
    // final selectedVariant = WhateverTool.getABTestingVariant();
    // switch (variant) {
    //   case "variantA":
    //     return const BannerSettings(variantName: "variantA");
    //   case "variantB":
    //     return const BannerSettings(variantName: "variantB");
    //   default:
    //     return const BannerSettings();
    // }
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
                settings: bannerSettingsCustomizationExample1,
              ),
              child: const Text("Customization Example 1"),
            ),
            ElevatedButton(
              onPressed: () => _showFirstLayer(
                settings: bannerSettingsCustomizationExample2,
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
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WebViewIntegrationPage()),
              ),
              child: const Text("Webview Integration"),
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
