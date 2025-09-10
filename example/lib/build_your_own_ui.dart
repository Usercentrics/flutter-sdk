import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'main.dart';

class CustomUIPage extends StatelessWidget {
  const CustomUIPage({super.key});

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
                        style: Theme.of(context).textTheme.headlineSmall,
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
                      onPressed: () => _acceptAll(cmpData.activeVariant),
                      child: const Text("Accept All"),
                    ),
                    ElevatedButton(
                      onPressed: () => _denyAll(cmpData.activeVariant),
                      child: const Text("Deny All"),
                    ),
                    ElevatedButton(
                      onPressed: () => _saveServices(cmpData.activeVariant),
                      child: const Text("Save Services"),
                    ),
                    ElevatedButton(
                      onPressed: () => _changeLanguage(cmpData),
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
    final legalBasis = data.legalBasis;

    print("Title: ${settings.labels.firstLayerTitle}");
    print("Description: ${settings.firstLayerDescriptionHtml}");

    print("data.settings: $settings");
    print("data.services: ${data.services}");
    print("data.categories: ${data.categories}");
    print("data.legalBasis labelsAria: ${legalBasis.labelsAria}");
    print("data.legalBasis data: ${legalBasis.data}");

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

  void _printTCF(UsercentricsCMPData data) async {
    print("Set your CMP ID");
    // Usercentrics.cmpId = 0; TODO

    final tcf2 = data.settings.tcf2;

    print("First layer title: ${tcf2?.firstLayerTitle}");
    print("First layer description: ${tcf2?.firstLayerDescription}");

    print("Second layer title: ${tcf2?.secondLayerTitle}");
    print("Second layer description: ${tcf2?.secondLayerDescription}");

    final tcfData = await Usercentrics.tcfData;
    final acmData = await Usercentrics.additionalConsentModeData;

    print("TCString ${tcfData.tcString}");

    for (var purpose in tcfData.purposes) {
      print("Purpose: ${purpose.name}");
    }

    for (var specialPurpose in tcfData.specialPurposes) {
      print("Special Purpose: ${specialPurpose.name}");
    }

    for (var feature in tcfData.features) {
      print("Feature: ${feature.name}");
    }

    for (var specialFeature in tcfData.specialFeatures) {
      print("Special Feature: ${specialFeature.name}");
    }

    for (var stack in tcfData.stacks) {
      print("Stack: ${stack.name}");
    }

    for (var vendor in tcfData.vendors) {
      print("Vendor: ${vendor.name}");
    }

    // Non-IAB data
    for (var category in data.categories) {
      print("Category name: ${category.label}");
    }

    for (var service in data.services) {
      print("Data processor: ${service.dataProcessor} with "
          "Template Id: ${service.templateId}");
    }

    print("Additional Consent Mode V2 enabled: ${tcf2?.acmV2Enabled}");

    print("AC String: ${acmData.acString}");
    for (var atp in acmData.adTechProviders) {
      print("Ad Tech Provider: ${atp.name}");
    }

    var selectedIds = tcf2?.selectedATPIds;
    for (var selectedATP in selectedIds!) {
      print("Selected ATP id: $selectedATP");
    }

    print("Accept All button: ${tcf2?.buttonsAcceptAllLabel}");
    print("Deny button: ${tcf2?.buttonsDenyAllLabel}");
    print("Save button: ${tcf2?.buttonsSaveLabel}");
  }

  void _changeLanguage(UsercentricsCMPData data) async {
    try {
      await Usercentrics.changeLanguage(language: "de");
      _printUiElements(data);
    } catch (error) {
      // Handle non-localized error
    }
  }

  void _acceptAll(UsercentricsVariant activeVariant) async {
    List<UsercentricsServiceConsent> consents;
    switch (activeVariant) {
      case UsercentricsVariant.default_:
        consents = await Usercentrics.acceptAll(
          consentType: UsercentricsConsentType.explicit,
        );
        break;
      case UsercentricsVariant.ccpa:
        consents = await Usercentrics.saveOptOutForCCPA(
          isOptedOut: false,
          consentType: UsercentricsConsentType.explicit,
        );
        break;
      case UsercentricsVariant.tcf:
        consents = await Usercentrics.acceptAllForTCF(
          consentType: UsercentricsConsentType.explicit,
          fromLayer: TCFDecisionUILayer.firstLayer,
        );
        break;
    }
    applyConsent(consents);
  }

  void _denyAll(UsercentricsVariant activeVariant) async {
    List<UsercentricsServiceConsent> consents;
    switch (activeVariant) {
      case UsercentricsVariant.default_:
        consents = await Usercentrics.denyAll(
          consentType: UsercentricsConsentType.explicit,
        );
        break;
      case UsercentricsVariant.ccpa:
        consents = await Usercentrics.saveOptOutForCCPA(
          isOptedOut: true,
          consentType: UsercentricsConsentType.explicit,
        );
        break;
      case UsercentricsVariant.tcf:
        consents = await Usercentrics.denyAllForTCF(
          consentType: UsercentricsConsentType.explicit,
          fromLayer: TCFDecisionUILayer.firstLayer,
        );
        break;
    }
    applyConsent(consents);
  }

  void _saveServices(UsercentricsVariant activeVariant) async {
    List<UsercentricsServiceConsent>? consents;
    switch (activeVariant) {
      case UsercentricsVariant.default_:
        consents = await Usercentrics.saveDecisions(
          decisions: _decisionsExample(),
          consentType: UsercentricsConsentType.explicit,
        );
        break;
      case UsercentricsVariant.ccpa:
        print(
            "NO ACTION FOR CCPA - This legal framework has no granular choices");
        break;
      case UsercentricsVariant.tcf:
        consents = await Usercentrics.saveDecisionsForTCF(
          tcfDecisions: TCFUserDecisions(
              purposes: _purposesExample(),
              specialFeatures: _specialFeaturesExample(),
              vendors: _vendorsExample(),
              adTechProviders: _adTechProviderExample()),
          fromLayer: TCFDecisionUILayer.firstLayer,
          serviceDecisions: _decisionsExample(),
          consentType: UsercentricsConsentType.explicit,
        );
        break;
    }
    applyConsent(consents);
  }

  List<UserDecision> _decisionsExample() {
    return [
      const UserDecision(
        serviceId: "SJKM9Ns_ibQ",
        consent: false,
      ),
    ];
  }

  List<TCFUserDecisionOnPurpose> _purposesExample() {
    return [
      const TCFUserDecisionOnPurpose(
        id: 123,
        consent: false,
        legitimateInterestConsent: true,
      ),
    ];
  }

  List<TCFUserDecisionOnSpecialFeature> _specialFeaturesExample() {
    return [
      const TCFUserDecisionOnSpecialFeature(
        id: 222,
        consent: false,
      ),
    ];
  }

  List<TCFUserDecisionOnVendor> _vendorsExample() {
    return [
      const TCFUserDecisionOnVendor(
          id: 111, consent: false, legitimateInterestConsent: true),
    ];
  }

  List<AdTechProviderDecision> _adTechProviderExample() {
    return [
      const AdTechProviderDecision(
        id: 61,
        consent: false,
      ),
    ];
  }
}
