import Foundation
import Usercentrics
import UsercentricsUI
import UIKit

protocol UsercentricsBannerProxyProtocol {
    func showFirstLayer(bannerSettings: BannerSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)

    func showSecondLayer(bannerSettings: BannerSettings?,
                         tab: SecondLayerTab?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)
}

struct UsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    // Optional: only Consent-or-Pay first-layer screens ever invoke these, so a plain first-layer
    // call with no such buttons configured never touches this at all.
    let consentOrPayEventNotifier: ConsentOrPayEventNotifier?

    init(consentOrPayEventNotifier: ConsentOrPayEventNotifier? = nil) {
        self.consentOrPayEventNotifier = consentOrPayEventNotifier
    }

    func showFirstLayer(bannerSettings: BannerSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        UsercentricsBanner(bannerSettings: bannerSettings).showFirstLayer(onLoginClicked: { [weak consentOrPayEventNotifier] url in
            consentOrPayEventNotifier?.onLoginClicked(url)
        }, onSubscribeClicked: { [weak consentOrPayEventNotifier] url in
            consentOrPayEventNotifier?.onSubscribeClicked(url)
        }) { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         tab: SecondLayerTab?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(tab: tab) { response in
            completionHandler(response)
        }
    }

}
