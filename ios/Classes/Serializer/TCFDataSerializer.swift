import Usercentrics

extension TCFData {
    func serialize()-> Any {
        return[
            "features" : features.map { $0.serialize() },
            "purposes" : purposes.map { $0.serialize() },
            "specialFeatures" : specialFeatures.map { $0.serialize() },
            "specialPurposes" : specialPurposes.map { $0.serialize() },
            "stacks" : stacks.map { $0.serialize() },
            "vendors" : vendors.map { $0.serialize() }
        ]
    }
}

extension TCFFeature {
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "descriptionLegal" : descriptionLegal,
            "id" : id,
            "name" : name,
        ]
    }
}

extension TCFPurpose {
    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "descriptionLegal" : descriptionLegal,
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
            "descriptionLegal" : descriptionLegal,
            "id" : id,
            "name" : name,
        ]
    }
}


extension TCFSpecialFeature {

    func serialize()-> Any {
        return[
            "purposeDescription" : purposeDescription,
            "descriptionLegal" : descriptionLegal,
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
        return[
            "description" : description,
            "id" : id,
            "name" : name,
            "purposeIds" : purposeIds,
            "specialFeatureIds" : specialFeatureIds,
        ]
    }
}

extension TCFVendor {
    func serialize()-> Any {
        return[
            "consent" : Bool(from: self.consent) as Any ,
            "features" : features.map { $0.id },
            "flexiblePurposes" : flexiblePurposes.map { $0.id },
            "id" : id,
            "legitimateInterestConsent" : Bool(from: self.legitimateInterestConsent) as Any ,
            "legitimateInterestPurposes" : legitimateInterestPurposes.map { $0.id },
            "name" : name,
            "policyUrl" : policyUrl,
            "purposes" : purposes.map { $0.id },
            //        "restrictions" : restrictions.map { restrictions.serialize() },
            "specialFeatures" : specialFeatures.map { $0.id },
            "specialPurposes" : specialPurposes.map { $0.id },
            "showConsentToggle" : showConsentToggle,
            "showLegitimateInterestToggle" : showLegitimateInterestToggle,
            "cookieMaxAgeSeconds" :  cookieMaxAgeSeconds as Any,
            "usesNonCookieAccess" : usesNonCookieAccess,
            "deviceStorageDisclosureUrl" : deviceStorageDisclosureUrl  as Any,
            //        "deviceStorage" : deviceStorage.serialize(),
            "usesCookies" : usesCookies,
            "cookieRefresh" : Bool(from: self.cookieRefresh) as Any ,
        ]
    }

}
