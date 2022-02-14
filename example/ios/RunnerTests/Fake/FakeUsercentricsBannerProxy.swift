import Foundation
@testable import usercentrics_sdk
@testable import Usercentrics
import UsercentricsUI

class FakeUsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    var showFirstLayerAnswer: UsercentricsConsentUserResponse? = nil
    var showFirstLayerCount = 0
    var showFirstLayerLayoutArg: UsercentricsLayout? = nil
    var showFirstLayerSettingsArg: FirstLayerStyleSettings? = nil
    var showFirstLayerBannerSettingsArg: BannerSettings? = nil

    func showFirstLayer(bannerSettings: BannerSettings?,
                        layout: UsercentricsLayout,
                        settings: FirstLayerStyleSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        showFirstLayerCount += 1
        showFirstLayerLayoutArg = layout
        showFirstLayerSettingsArg = settings
        showFirstLayerBannerSettingsArg = bannerSettings

        completionHandler(showFirstLayerAnswer!)
    }

    var showSecondLayerAnswer: UsercentricsConsentUserResponse? = nil
    var showSecondLayerCount = 0
    var showSecondLayerCloseButtonArg: Bool? = nil
    var showSecondLayerBannerSettingsArg: BannerSettings? = nil

    func showSecondLayer(bannerSettings: BannerSettings?,
                         showCloseButton: Bool,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        showSecondLayerCount += 1
        showSecondLayerBannerSettingsArg = bannerSettings
        showSecondLayerCloseButtonArg = showCloseButton

        completionHandler(showSecondLayerAnswer!)
    }

}
