import Foundation
import UsercentricsUI
import UIKit

protocol UsercentricsBannerProxyProtocol {
    func showFirstLayer(bannerSettings: BannerSettings?,
        layout: UsercentricsLayout,
                        settings: FirstLayerStyleSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)

    func showSecondLayer(bannerSettings: BannerSettings?,
                         showCloseButton: Bool,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)
}

struct UsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    func showFirstLayer(bannerSettings: BannerSettings?,
                        layout: UsercentricsLayout,
                        settings: FirstLayerStyleSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let flutterVC = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController else { return }

        UsercentricsBanner(bannerSettings:bannerSettings).showFirstLayer(hostView: flutterVC,
                                                                         layout: layout,
                                                                         settings: settings) { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         showCloseButton: Bool,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let flutterVC = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController else { return }

        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(hostView: flutterVC,
                                                                          showCloseButton: showCloseButton) { response in
            completionHandler(response)
        }
    }

}
