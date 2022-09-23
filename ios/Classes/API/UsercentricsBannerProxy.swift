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
        guard let rootVC = getRootViewController() else { return }

        UsercentricsBanner(bannerSettings: bannerSettings).showFirstLayer(hostView: rootVC,
                                                                          layout: layout) { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        guard let rootVC = getRootViewController() else { return }

        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(hostView: rootVC) { response in
            completionHandler(response)
        }
    }

    func getRootViewController() -> UIViewController? {
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
        return window?.rootViewController ?? window?.rootViewController?.presentedViewController
    }

}
