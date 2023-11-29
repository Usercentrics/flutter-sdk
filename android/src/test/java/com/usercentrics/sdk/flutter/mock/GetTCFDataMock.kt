package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall
import com.usercentrics.sdk.services.tcf.interfaces.*
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosure
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosureObject
import com.usercentrics.sdk.v2.settings.data.ConsentDisclosureType
import com.usercentrics.tcf.core.model.RestrictionType
import com.usercentrics.tcf.core.model.gvl.DataRetention
import com.usercentrics.tcf.core.model.gvl.VendorUrl

internal object GetTCFDataMock {

    val fake = TCFData(
        thirdPartyCount = 2,
        tcString = "abc",
        features = listOf(
            TCFFeature(
                purposeDescription = "Data from offline data sources can be combined with your online activity in support of one or more purposes",
                illustrations = listOf(),
                id = 2,
                name = "Link different devices",
            )
        ),
        purposes = listOf(
            TCFPurpose(
                purposeDescription = "Cookies, device identifiers, or other information can be stored or accessed on your device for the purposes presented to you.",
                illustrations = listOf("Most purposes explained in this notice rely on the storage or accessing of information from your device when you use an app or visit a website. For example, a vendor or publisher might need to store a cookie on your device during your first visit on a website, to be able to recognise your device during your next visits (by accessing this cookie each time)."),
                id = 1,
                name = "Store and/or access information on a device",
                consent = null,
                isPartOfASelectedStack = true,
                legitimateInterestConsent = null,
                showConsentToggle = false,
                showLegitimateInterestToggle = false,
                stackId = null,
            )
        ),
        specialFeatures = listOf(
            TCFSpecialFeature(
                purposeDescription = "Your precise geolocation data can be used in support of one or more purposes. This means your location can be accurate to within several meters.",
                illustrations = listOf(),
                id = 1,
                name = "Use precise geolocation data",
                consent = null,
                isPartOfASelectedStack = false,
                stackId = null,
                showConsentToggle = false,
            )
        ),
        specialPurposes = listOf(
            TCFSpecialPurpose(
                purposeDescription = "Your data can be used to monitor for and prevent fraudulent activity, and ensure systems and processes work properly and securely.",
                illustrations = listOf("An advertising intermediary delivers ads from various advertisers to its network of partnering websites. It notices a large increase in clicks on ads relating to one advertiser, and uses data regarding the source of the clicks to determine that 80% of the clicks come from bots rather than humans."),
                id = 1,
                name = "Ensure security, prevent fraud, and debug",
            )
        ),
        stacks = listOf(
            TCFStack(
                description = "Ads can be personalised based on a profile. More data can be added to better personalise ads.",

                id = 3,
                name = "Personalised ads",

                purposeIds = listOf(
                    2,
                    3,
                    4
                ),
                specialFeatureIds = listOf(),
            )
        ),
        vendors = listOf(
            TCFVendor(
                consent = null,
                features = listOf(IdAndName(3, "")),
                flexiblePurposes = listOf(),
                id = 7,
                legitimateInterestConsent = null,
                legitimateInterestPurposes = listOf(),
                name = "Vibrant Media Limited",
                policyUrl = "https://www.vibrantmedia.com/en/privacy-policy/",
                purposes = listOf(
                    IdAndName(1, ""),
                    IdAndName(3, ""),
                    IdAndName(4, ""),
                    IdAndName(5, ""),
                    IdAndName(6, ""),
                    IdAndName(7, ""),
                    IdAndName(8, "")
                ),
                specialFeatures = listOf(IdAndName(1, "")),
                specialPurposes = listOf(),
                showConsentToggle = true,
                showLegitimateInterestToggle = true,
                cookieMaxAgeSeconds = null,
                usesNonCookieAccess = false,
                deviceStorageDisclosureUrl = null,
                usesCookies = false,
                cookieRefresh = null,
                dataSharedOutsideEU = true,
                dataRetention = null,
                dataCategories = listOf(IdAndName(1, "")),
                vendorUrls = listOf(),
                deviceStorage = ConsentDisclosureObject(
                    disclosures = listOf(
                        ConsentDisclosure(
                            identifier = "identifier",
                            type = ConsentDisclosureType.APP,
                            name = "name",
                            maxAgeSeconds = 123123L,
                            cookieRefresh = true,
                            purposes = listOf(1, 2, 3),
                            domain = "domain",
                            description = "description",
                        )
                    )
                ),
                restrictions = listOf(
                    TCFVendorRestriction(purposeId = 1, restrictionType = RestrictionType.REQUIRE_LI)
                ),
            )
        ),
    )

    // From the debugger
    val call = FakeFlutterMethodCall(method = "getTCFData", arguments = null)
    val expected = mapOf(
        "thirdPartyCount" to 2,
        "tcString" to "abc",
        "features" to listOf(
            mapOf(
                "purposeDescription" to "Data from offline data sources can be combined with your online activity in support of one or more purposes",
                "illustrations" to listOf<String>(),
                "id" to 2,
                "name" to "Link different devices",
            )
        ),
        "purposes" to listOf(
            mapOf(
                "purposeDescription" to "Cookies, device identifiers, or other information can be stored or accessed on your device for the purposes presented to you.",
                "illustrations" to listOf("Most purposes explained in this notice rely on the storage or accessing of information from your device when you use an app or visit a website. For example, a vendor or publisher might need to store a cookie on your device during your first visit on a website, to be able to recognise your device during your next visits (by accessing this cookie each time)."),
                "id" to 1,
                "name" to "Store and/or access information on a device",
                "consent" to null,
                "isPartOfASelectedStack" to true,
                "legitimateInterestConsent" to null,
                "showConsentToggle" to false,
                "showLegitimateInterestToggle" to false,
                "stackId" to null,
            )
        ),
        "specialFeatures" to listOf(
            mapOf(
                "purposeDescription" to "Your precise geolocation data can be used in support of one or more purposes. This means your location can be accurate to within several meters.",
                "illustrations" to listOf<String>(),
                "id" to 1,
                "name" to "Use precise geolocation data",
                "consent" to null,
                "isPartOfASelectedStack" to false,
                "stackId" to null,
                "showConsentToggle" to false,
            )
        ),
        "specialPurposes" to listOf(
            mapOf(
                "purposeDescription" to "Your data can be used to monitor for and prevent fraudulent activity, and ensure systems and processes work properly and securely.",
                "illustrations" to listOf("An advertising intermediary delivers ads from various advertisers to its network of partnering websites. It notices a large increase in clicks on ads relating to one advertiser, and uses data regarding the source of the clicks to determine that 80% of the clicks come from bots rather than humans."),
                "id" to 1,
                "name" to "Ensure security, prevent fraud, and debug",
            )
        ),
        "stacks" to listOf(
            mapOf(
                "description" to "Ads can be personalised based on a profile. More data can be added to better personalise ads.",
                "id" to 3,
                "name" to "Personalised ads",

                "purposeIds" to listOf(
                    2,
                    3,
                    4
                ),
                "specialFeatureIds" to listOf<Any>(),
            )
        ),
        "vendors" to listOf(
            mapOf(
                "consent" to null,
                "features" to listOf(3),
                "flexiblePurposes" to listOf<Any>(),
                "id" to 7,
                "legitimateInterestConsent" to null,
                "legitimateInterestPurposes" to listOf<Any>(),
                "name" to "Vibrant Media Limited",
                "policyUrl" to "https://www.vibrantmedia.com/en/privacy-policy/",
                "purposes" to listOf(
                    1,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8
                ),
                "specialFeatures" to listOf(1),
                "specialPurposes" to listOf<Any>(),
                "showConsentToggle" to true,
                "showLegitimateInterestToggle" to true,
                "cookieMaxAgeSeconds" to null,
                "usesNonCookieAccess" to false,
                "deviceStorageDisclosureUrl" to null,
                "usesCookies" to false,
                "cookieRefresh" to null,
                "dataSharedOutsideEU" to true,
                "dataRetention" to null,
                "dataCategories" to listOf(1),
                "vendorUrls" to listOf<Any>(),
                "deviceStorage" to listOf(
                    mapOf(
                        "identifier" to "identifier",
                        "type" to "APP",
                        "name" to "name",
                        "maxAgeSeconds" to 123123L,
                        "cookieRefresh" to true,
                        "purposes" to listOf(1, 2, 3),
                        "domain" to "domain",
                        "description" to "description",
                    )
                ),
                "restrictions" to listOf(
                    mapOf(
                        "purposeId" to 1,
                        "restrictionType" to "REQUIRE_LI"
                    )
                )
            ),
        ),
    )

}
