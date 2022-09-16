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
        guard let flutterVC = getFlutterViewController() else { return }

        UsercentricsBanner(bannerSettings: bannerSettings).showFirstLayer(hostView: flutterVC,
                                                                         layout: layout) { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let flutterVC = getFlutterViewController() else { return }

        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(hostView: flutterVC) { response in
            completionHandler(response)
        }
    }

    func getFlutterViewController() -> FlutterViewController? {
        var window: UIWindow?
        if #available(iOS 13.0, *) {
            window = UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            window = UIApplication.shared.windows.first { $0.isKeyWindow }
        }
        return window?.rootViewController?.presentedViewController as? FlutterViewController

    }

}
