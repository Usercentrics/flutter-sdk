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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

enum _SdkStatus { idle, loading, ready, error }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  _SdkStatus _sdkStatus = _SdkStatus.idle;
  String? _statusMessage;

  void _initializeUsercentrics() async {
    setState(() {
      _sdkStatus = _SdkStatus.loading;
      _statusMessage = null;
    });

    try {
      Usercentrics.initialize(
        settingsId: 'Yi9N3aXia',
        loggerLevel: UsercentricsLoggerLevel.debug,
      );

      final status = await Usercentrics.status;

      setState(() {
        _sdkStatus = _SdkStatus.ready;
        _statusMessage = 'SDK ready. shouldCollectConsent: ${status.shouldCollectConsent}';
      });

      if (status.shouldCollectConsent) {
        _showFirstLayer();
      } else {
        applyConsent(status.consents);
      }
    } catch (error) {
      setState(() {
        _sdkStatus = _SdkStatus.error;
        _statusMessage = error.toString();
      });
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
  }

  @override
  Widget build(BuildContext context) {
    final bool isSdkReady = _sdkStatus == _SdkStatus.ready;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usercentrics Flutter Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: _statusColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'SDK status: ${_sdkStatus.name.toUpperCase()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (_statusMessage != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        _statusMessage!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _sdkStatus == _SdkStatus.loading
                          ? null
                          : _initializeUsercentrics,
                      child: _sdkStatus == _SdkStatus.loading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Initialize SDK'),
                    ),
                  ],
                ),
              ),
            ),
            // ── END TEMPORARY ──────────────────────────────────────────────
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isSdkReady ? () => _showFirstLayer() : null,
              child: const Text("Show First Layer"),
            ),
            ElevatedButton(
              onPressed: isSdkReady ? () => _showSecondLayer() : null,
              child: const Text("Show Second Layer"),
            ),
            ElevatedButton(
              onPressed: isSdkReady
                  ? () => _showFirstLayer(
                        settings: bannerSettingsCustomizationExample1,
                      )
                  : null,
              child: const Text("Customization Example 1"),
            ),
            ElevatedButton(
              onPressed: isSdkReady
                  ? () => _showFirstLayer(
                        settings: bannerSettingsCustomizationExample2,
                      )
                  : null,
              child: const Text("Customization Example 2"),
            ),
            ElevatedButton(
              onPressed: isSdkReady
                  ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomUIPage()),
                      )
                  : null,
              child: const Text("Custom UI"),
            ),
            ElevatedButton(
              onPressed: isSdkReady
                  ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WebViewIntegrationPage()),
                      )
                  : null,
              child: const Text("Webview Integration"),
            ),
          ],
        ),
      ),
    );
  }

  Color get _statusColor {
    switch (_sdkStatus) {
      case _SdkStatus.idle:
        return Colors.grey.shade200;
      case _SdkStatus.loading:
        return Colors.blue.shade50;
      case _SdkStatus.ready:
        return Colors.green.shade100;
      case _SdkStatus.error:
        return Colors.red.shade100;
    }
  }
}

void applyConsent(List<UsercentricsServiceConsent>? consents) {
  // https://docs.usercentrics.com/cmp_in_app_sdk/latest/apply_consent/apply-consent/#apply-consent-to-each-service
}
