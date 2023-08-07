import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else { return false }
    guard let GoogleMapsAPIKey: String = infoDictionary["GoogleMapsAPIKey"] as? String else { return false}
    GMSServices.provideAPIKey(GoogleMapsAPIKey)
    GeneratedPluginRegistrant.register(with: self)
     
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
