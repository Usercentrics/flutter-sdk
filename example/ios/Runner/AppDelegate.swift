// Firebase mediation: uncomment to enable. See example/README.md for setup instructions.
// import FirebaseCore
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Firebase mediation: uncomment to enable. Place GoogleService-Info.plist in Runner/ first.
    // See example/README.md for setup instructions.
    // FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
