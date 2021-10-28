import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

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
        _showCMP(showCloseButton: false);
      } else {
        _applyConsent(status.consents);
      }
    } catch (error) {
      // Handle non-localized error
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

class CustomUIPage extends StatelessWidget {
  const CustomUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom UI'),
      ),
      body: FutureBuilder<UsercentricsCMPData>(
          future: Usercentrics.cmpData,
          builder: (context, snapshot) {
            final cmpData = snapshot.data;
            if (cmpData == null) return const SizedBox();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "The label below shows what Legal Framework has been set according to your Settings ID"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _getVariantName(cmpData.activeVariant),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Text(
                        "Those buttons represents APIs that you need to call in order to replicate user actions to Usercentrics"),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _printUiElements(cmpData),
                      child: const Text("Print UI Elements"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Accept All"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Deny All"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Save Services"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Change Language"),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  String _getVariantName(UsercentricsVariant variant) {
    switch (variant) {
      case UsercentricsVariant.default_:
        return "GDPR";
      case UsercentricsVariant.ccpa:
        return "CCPA";
      case UsercentricsVariant.tcf:
        return "TCF";
    }
  }

  void _printUiElements(UsercentricsCMPData data) {
    switch (data.activeVariant) {
      case UsercentricsVariant.default_:
        _printGDPR(data);
        break;
      case UsercentricsVariant.ccpa:
        _printCCPA(data);
        break;
      case UsercentricsVariant.tcf:
        _printTCF(data);
        break;
    }
  }

  void _printGDPR(UsercentricsCMPData data) {
    final settings = data.settings;

    print("Title: ${settings.labels.firstLayerTitle}");
    print("Description: ${settings.bannerMessage}");

    print("data.settings: $settings");
    print("data.services: ${data.services}");
    print("data.categories: ${data.categories}");

    print("Accept All button: ${settings.labels.btnAcceptAll}");
    print("Deny button: ${settings.labels.btnDeny}");
    print("Save button: ${settings.labels.btnSave}");
  }

  void _printCCPA(UsercentricsCMPData data) {
    final ccpa = data.settings.ccpa;

    print("Title: ${ccpa?.firstLayerTitle}");
    print("Description: ${ccpa?.appFirstLayerDescription}");

    for (var category in data.categories) {
      print("Category name: ${category.label}");
    }

    for (var service in data.services) {
      print("Data processor: ${service.dataProcessor} with "
          "Template Id: ${service.templateId}");
    }

    print("Do not sell my info: ${ccpa?.optOutNoticeLabel}");
    print("Save: ${ccpa?.btnSave}");
  }

  void _printTCF(UsercentricsCMPData data) {
    print("Set your CMP ID");
    // Usercentrics.cmpId = 0; TODO

    final tcf2 = data.settings.tcf2;

    print("First layer title: ${tcf2?.firstLayerTitle}");
    print("First layer description: ${tcf2?.firstLayerDescription}");

    print("Second layer title: ${tcf2?.secondLayerTitle}");
    print("Second layer description: ${tcf2?.secondLayerDescription}");

    // TCF Data
    // final tcfData = Usercentrics.tcfData; TODO
    // for (var purpose in tcfData.purposes) {
    //   print("Purpose: ${purpose.name}");
    // }
    //
    // for (var specialPurpose in tcfData.specialPurposes) {
    //   print("Special Purpose: ${specialPurpose.name}");
    // }
    //
    // for (var feature in tcfData.features) {
    //   print("Feature: ${feature.name}");
    // }
    //
    // for (var specialFeature in tcfData.specialFeatures) {
    //   print("Special Feature: ${specialFeature.name}");
    // }
    //
    // for (var stack in tcfData.stacks) {
    //   print("Stack: ${stack.name}");
    // }
    //
    // for (var vendor in tcfData.vendors) {
    //   print("Vendor: ${vendor.name}");
    // }

    // Non-IAB data
    for (var category in data.categories) {
      print("Category name: ${category.label}");
    }

    for (var service in data.services) {
      print(
          "Data processor: ${service.dataProcessor} with Template Id: ${service.templateId}");
    }

    print("Accept All button: ${tcf2?.buttonsAcceptAllLabel}");
    print("Deny button: ${tcf2?.buttonsDenyAllLabel}");
    print("Save button: ${tcf2?.buttonsSaveLabel}");

    print("TCString ${Usercentrics.getTCString()}");
  }
}
