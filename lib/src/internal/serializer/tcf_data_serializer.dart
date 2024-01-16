import 'package:usercentrics_sdk/src/internal/serializer/consent_disclosure_object_serializer.dart';
import 'package:usercentrics_sdk/src/model/tcf_data.dart';

class TCFDataSerializer {
  static TCFData deserialize(dynamic value) {
    return TCFData(
        features: (value['features'] as List)
            .map((e) => _deserializeFeature(e))
            .toList(),
        purposes: (value['purposes'] as List)
            .map((e) => _deserializePurpose(e))
            .toList(),
        specialFeatures: (value['specialFeatures'] as List)
            .map((e) => _deserializeSpecialFeature(e))
            .toList(),
        specialPurposes: (value['specialPurposes'] as List)
            .map((e) => _deserializeSpecialPurpose(e))
            .toList(),
        stacks:
            (value['stacks'] as List).map((e) => _deserializeStack(e)).toList(),
        vendors: (value['vendors'] as List)
            .map((e) => _deserializeVendor(e))
            .toList(),
        tcString: value['tcString'],
        thirdPartyCount: value['thirdPartyCount']);
  }

  static TCFFeature _deserializeFeature(dynamic value) {
    return TCFFeature(
      purposeDescription: value['purposeDescription'],
      illustrations: value['illustrations']?.cast<String>(),
      id: value['id'],
      name: value['name'],
    );
  }

  static TCFPurpose _deserializePurpose(dynamic value) {
    return TCFPurpose(
      purposeDescription: value['purposeDescription'],
      illustrations: value['illustrations']?.cast<String>(),
      id: value['id'],
      name: value['name'],
      consent: value['consent'],
      isPartOfASelectedStack: value['isPartOfASelectedStack'],
      legitimateInterestConsent: value['legitimateInterestConsent'],
      showConsentToggle: value['showConsentToggle'],
      showLegitimateInterestToggle: value['showLegitimateInterestToggle'],
      stackId: value['stackId'],
      numberOfVendors: value['numberOfVendors'],
    );
  }

  static TCFSpecialFeature _deserializeSpecialFeature(dynamic value) {
    return TCFSpecialFeature(
      purposeDescription: value['purposeDescription'],
      illustrations: value['illustrations']?.cast<String>(),
      id: value['id'],
      name: value['name'],
      consent: value['consent'],
      isPartOfASelectedStack: value['isPartOfASelectedStack'],
      stackId: value['stackId'],
      showConsentToggle: value['showConsentToggle'],
    );
  }

  static TCFSpecialPurpose _deserializeSpecialPurpose(dynamic value) {
    return TCFSpecialPurpose(
      purposeDescription: value['purposeDescription'],
      illustrations: value['illustrations']?.cast<String>(),
      id: value['id'],
      name: value['name'],
    );
  }

  static TCFStack _deserializeStack(dynamic value) {
    return TCFStack(
      description: value['description'],
      id: value['id'],
      name: value['name'],
      purposeIds: value['purposeIds']?.cast<int>() ?? [],
      specialFeatureIds: value['specialFeatureIds']?.cast<int>() ?? [],
    );
  }

  static TCFVendor _deserializeVendor(dynamic value) {
    return TCFVendor(
        consent: value['consent'],
        features: value['features']?.cast<int>() ?? [],
        flexiblePurposes: value['flexiblePurposes']?.cast<int>() ?? [],
        id: value['id'],
        legitimateInterestConsent: value['legitimateInterestConsent'],
        legitimateInterestPurposes:
            value['legitimateInterestPurposes']?.cast<int>() ?? [],
        name: value['name'],
        policyUrl: value['policyUrl'],
        purposes: value['purposes']?.cast<int>() ?? [],
        specialFeatures: value['specialFeatures']?.cast<int>() ?? [],
        specialPurposes: value['specialPurposes']?.cast<int>() ?? [],
        showConsentToggle: value['showConsentToggle'],
        showLegitimateInterestToggle: value['showLegitimateInterestToggle'],
        cookieMaxAgeSeconds: value['cookieMaxAgeSeconds'],
        usesNonCookieAccess: value['usesNonCookieAccess'],
        deviceStorageDisclosureUrl: value['deviceStorageDisclosureUrl'],
        usesCookies: value['usesCookies'],
        cookieRefresh: value['cookieRefresh'],
        dataSharedOutsideEU: value['dataSharedOutsideEU'],
        dataCategories: value['dataCategories']?.cast<int>() ?? [],
        dataRetention: _deserializeDataRetention(value['dataRetention']),
        vendorUrls: _deserializeVendorUrlList(value['vendorUrls']),
        deviceStorage: ConsentDisclosureObjectSerializer.deserialize(
            value['deviceStorage']),
        restrictions: _deserializeRestrictions(value['restrictions']));
  }

  static DataRetention? _deserializeDataRetention(dynamic dataRetention) {
    if (dataRetention == null) {
      return null;
    }
    return DataRetention(
      stdRetention: dataRetention['stdRetention'],
      specialPurposes:
          _deserializeRetentionPeriod(dataRetention['specialPurposes']),
      purposes: _deserializeRetentionPeriod(dataRetention['purposes']),
    );
  }

  static RetentionPeriod _deserializeRetentionPeriod(dynamic retentionPeriod) {
    final Map<int, int> idAndPeriod = {};

    var map = (retentionPeriod as Map);
    for (var key in map.keys) {
      idAndPeriod[key] = map[key];
    }
    return RetentionPeriod(idAndPeriod: idAndPeriod);
  }

  static List<VendorUrl> _deserializeVendorUrlList(dynamic vendorUrls) {
    final List<VendorUrl> list = [];

    for (var i = 0; i < vendorUrls.length; i++) {
      list.add(_deserializeVendorUrl(vendorUrls[i]));
    }

    return list;
  }

  static VendorUrl _deserializeVendorUrl(dynamic value) {
    return VendorUrl(
        langId: value['langId'],
        privacy: value['privacy'],
        legIntClaim: value['legIntClaim']);
  }

  static List<TCFVendorRestriction> _deserializeRestrictions(
      dynamic restrictions) {
    final List<TCFVendorRestriction> list = [];

    for (var i = 0; i < restrictions.length; i++) {
      list.add(_deserializeTCFVendorRestriction(restrictions[i]));
    }
    return list;
  }

  static TCFVendorRestriction _deserializeTCFVendorRestriction(dynamic value) {
    return TCFVendorRestriction(
        purposeId: value['purposeId'],
        restrictionType:
            _deserialiazeRestrictionType(value['restrictionType'])!);
  }

  static RestrictionType? _deserialiazeRestrictionType(dynamic value) {
    switch (value) {
      case 'NOT_ALLOWED':
        return RestrictionType.notAllowed;
      case 'REQUIRE_CONSENT':
        return RestrictionType.requireConsent;
      case 'REQUIRE_LI':
        return RestrictionType.requireLi;
    }
    return null;
  }
}
