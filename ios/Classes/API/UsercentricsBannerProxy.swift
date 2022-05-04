import Foundation
import UsercentricsUI
import UIKit

protocol UsercentricsBannerProxyProtocol {
    func showFirstLayer(bannerSettings: BannerSettings?,
                        layout: UsercentricsLayout,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)
}

struct UsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    func showFirstLayer(bannerSettings: BannerSettings?,
                        layout: UsercentricsLayout,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let flutterVC = UIApplication.shared.windows.last?.rootViewController as? FlutterViewController else { return }

        UsercentricsBanner(bannerSettings: bannerSettings).showFirstLayer(hostView: flutterVC,
                                                                         layout: layout) { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let flutterVC = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController else { return }

        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(hostView: flutterVC) { response in
            completionHandler(response)
        }
    }

}
