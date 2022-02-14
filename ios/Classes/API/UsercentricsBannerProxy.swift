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

    func createNavigationController() -> UINavigationController {
        let flutterVC = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController

        let nav = UINavigationController()
        nav.setNavigationBarHidden(true, animated: false)
        nav.modalPresentationStyle = .overFullScreen
        if #available(iOS 13.0, *) {
            nav.isModalInPresentation = true
        }
        flutterVC?.present(nav, animated: false)

        return nav
    }

    func dismissNavigationController() {
        let flutterVC = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController

        flutterVC?.dismiss(animated: false)
    }

    func showFirstLayer(bannerSettings: BannerSettings?,
                        layout: UsercentricsLayout,
                        settings: FirstLayerStyleSettings?,
                        completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        let navigationController = createNavigationController()

        UsercentricsBanner(bannerSettings:bannerSettings).showFirstLayer(hostView: navigationController,
                                                                         layout: layout,
                                                                         settings: settings) { response in
            dismissNavigationController()
            completionHandler(response)
        }
    }

    func showSecondLayer(bannerSettings: BannerSettings?,
                         showCloseButton: Bool,
                         completionHandler: @escaping (UsercentricsConsentUserResponse) -> Void) {
        let navigationController = createNavigationController()

        UsercentricsBanner(bannerSettings:bannerSettings).showSecondLayer(hostView: navigationController,
                                                                          showCloseButton: showCloseButton,
                                                                          presentationMode: SecondLayerPresentationMode.present) { response in
            dismissNavigationController()
            completionHandler(response)
        }
    }

}
