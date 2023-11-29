import Usercentrics

extension TCFData {
    func serialize()-> Any {
        return[
            "tcString" : tcString,
            "features" : features.map { $0.serialize() },
            "purposes" : purposes.map { $0.serialize() },
            "specialFeatures" : specialFeatures.map { $0.serialize() },
            "specialPurposes" : specialPurposes.map { $0.serialize() },
            "stacks" : stacks.map { $0.serialize() },
            "vendors" : vendors.map { $0.serialize() },
            "thirdPartyCount": thirdPartyCount
        ]
    }
}

extension TCFFeature {
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "illustrations" : illustrations,
            "id" : id,
            "name" : name,
        ]
    }
}

extension TCFPurpose {
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "illustrations" : illustrations,
            "id" : id,
            "name" : name,
            "consent" : Bool(from: self.consent) as Any,
            "isPartOfASelectedStack" : isPartOfASelectedStack,
            "legitimateInterestConsent" : Bool(from: self.legitimateInterestConsent) as Any,
            "showConsentToggle" : showConsentToggle,
            "showLegitimateInterestToggle" : showLegitimateInterestToggle,
            "stackId" : stackId as Any,
        ]
    }
}

extension TCFSpecialPurpose {
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "illustrations" : illustrations,
            "id" : id,
            "name" : name,
        ]
    }
}


extension TCFSpecialFeature {
    
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "illustrations" : illustrations,
            "id" : id,
            "name" : name,
            "consent" : Bool(from: self.consent) as Any ,
            "isPartOfASelectedStack" : isPartOfASelectedStack,
            "stackId" : stackId as Any,
            "showConsentToggle" : showConsentToggle,
        ]
    }
}

extension TCFStack {
    func serialize()-> Any {
        return [
            "description" : self.description,
            "id" : self.id,
            "name" : self.name,
            "purposeIds" : self.purposeIds,
            "specialFeatureIds" : self.specialFeatureIds,
        ]
    }
}

extension TCFVendor {
    func serialize()-> Any {
        return [
            "consent" : Bool(from: self.consent) as Any ,
            "features" : features.map { $0.id },
            "flexiblePurposes" : flexiblePurposes.map { $0.id },
            "id" : id,
            "legitimateInterestConsent" : Bool(from: self.legitimateInterestConsent) as Any ,
            "legitimateInterestPurposes" : legitimateInterestPurposes.map { $0.id },
            "name" : name,
            "policyUrl" : policyUrl,
            "purposes" : purposes.map { $0.id },
            "specialFeatures" : specialFeatures.map { $0.id },
            "specialPurposes" : specialPurposes.map { $0.id },
            "showConsentToggle" : showConsentToggle,
            "showLegitimateInterestToggle" : showLegitimateInterestToggle,
            "cookieMaxAgeSeconds" :  cookieMaxAgeSeconds as Any,
            "usesNonCookieAccess" : usesNonCookieAccess,
            "deviceStorageDisclosureUrl" : deviceStorageDisclosureUrl  as Any,
            "usesCookies" : usesCookies,
            "cookieRefresh" : Bool(from: self.cookieRefresh) as Any ,
            "dataSharedOutsideEU" : Bool(from: self.dataSharedOutsideEU) as Any,
            "dataRetention": (dataRetention?.serialize() ?? nil) as Any,
            "dataCategories" : dataCategories.map { $0.id },
            "vendorUrls" : vendorUrls.map { $0.serialize() },
            "deviceStorage" : self.deviceStorage?.serialize() as Any,
            "restrictions": self.restrictions.map { $0.serialize() }
        ]
    }
}

extension DataRetention {

    func serialize() -> Any {
        return [
            "stdRetention" : stdRetention?.intValue as? Any,
            "purposes" : purposes.idAndPeriod,
            "specialPurposes" : specialPurposes.idAndPeriod
        ]
    }
}

extension VendorUrl {

    func serialize() -> Any {
        return [
            "langId" : self.langId,
            "privacy" : self.privacy,
            "legIntClaim" : self.legIntClaim
        ]
    }
}

extension TCFVendorRestriction {

    func serialize() -> Any {
        return [
            "purposeId" : self.purposeId,
            "restrictionType" : self.restrictionType.name
        ] as [String : Any]
    }
}
