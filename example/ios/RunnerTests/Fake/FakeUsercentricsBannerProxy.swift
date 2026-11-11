import Foundation
@testable import usercentrics_sdk
@testable import Usercentrics
import UsercentricsUI

class FakeUsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    var showFirstLayerAnswer: UsercentricsConsentUserResponse? = nil
    var showFirstLayerCount = 0
    var showFirstLayerBannerSettingsArg: BannerSettings? = nil

    func showFirstLayer(bannerSettings: BannerSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        showFirstLayerCount += 1
        showFirstLayerBannerSettingsArg = bannerSettings

        completionHandler(showFirstLayerAnswer!)
    }

    var showSecondLayerAnswer: UsercentricsConsentUserResponse? = nil
    var showSecondLayerCount = 0
    var showSecondLayerBannerSettingsArg: BannerSettings? = nil
    var showSecondLayerTabArg: SecondLayerTab? = nil

    func showSecondLayer(bannerSettings: BannerSettings?,
                         tab: SecondLayerTab?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        showSecondLayerCount += 1
        showSecondLayerBannerSettingsArg = bannerSettings
        showSecondLayerTabArg = tab

        completionHandler(showSecondLayerAnswer!)
    }

}
