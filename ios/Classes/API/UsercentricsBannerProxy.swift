import Foundation
import UsercentricsUI
import UIKit

protocol UsercentricsBannerProxyProtocol {
    func showFirstLayer(bannerSettings: BannerSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void)
}

struct UsercentricsBannerProxy: UsercentricsBannerProxyProtocol {

    func showFirstLayer(bannerSettings: BannerSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        UsercentricsBanner(bannerSettings: bannerSettings).showFirstLayer { response in
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer() { response in
            completionHandler(response)
        }
    }

}
