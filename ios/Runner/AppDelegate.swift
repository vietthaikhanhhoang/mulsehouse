import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    static let sharedInstance = AppDelegate()
    var navigationController:UINavigationController!
    
    func solutionPresent(){
        if let controller = self.window.rootViewController as? FlutterBinaryMessenger{
            let nativeChannel = FlutterMethodChannel.init(name: "flutterplugins.javatpoint.com/enablepush", binaryMessenger: controller)
            nativeChannel.setMethodCallHandler {(call: FlutterMethodCall, result: FlutterResult) -> Void in
                    if (call.method == "enablepush") {
                        NSLog("Lam cai mie gi thi lam:")
                        if let args = call.arguments as? Dictionary<String, Any>,
                           let url = args["url"] as? String{
                            NSLog("url: %@", url)
                            
//                            let mainVC = WebKitViewController()
//                            mainVC.modalPresentationStyle = .fullScreen
//                            let flutterViewController : FlutterViewController = self.window?.rootViewController as! FlutterViewController
//                            flutterViewController.transitionVc(vc: mainVC)
                            
                            let settingsUrl = NSURL(string: UIApplication.openSettingsURLString)
                            if let url = settingsUrl {
                                
                                if #available(iOS 10, *) {
                                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url as URL)
                                }
                            }
                        }
                        else {
                            result(FlutterError.init(code: "bad args", message: nil, details: nil))
                        }
                    }
                }
        }
    }
    
    func solutionPush(){
        self.navigationController = UINavigationController (rootViewController: self.window.rootViewController!)
        self.navigationController.isNavigationBarHidden = true
        self.window = UIWindow (frame: UIScreen.main.bounds)
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible ()
        
        if let navigation = self.window.rootViewController as? UINavigationController{
            let viewControllers = navigation.viewControllers
            if(viewControllers.count > 0){
                let viewController = navigation.viewControllers[0]
                if let controller = viewController as? FlutterBinaryMessenger{
                    let nativeChannel = FlutterMethodChannel.init(name: "flutterplugins.javatpoint.com/enablepush", binaryMessenger: controller)
                    nativeChannel.setMethodCallHandler {(call: FlutterMethodCall, result: FlutterResult) -> Void in
                            if (call.method == "enablepush") {
                                NSLog("Lam cai mie gi thi lam:")
                                if let args = call.arguments as? Dictionary<String, Any>,
                                   let url = args["url"] as? String{
                                    NSLog("url: %@", url)

                                    let mainVC = MainViewController()
                                    self.navigationController?.pushViewController (mainVC, animated: true)
                                }
                                else {
                                    result(FlutterError.init(code: "bad args", message: nil, details: nil))
                                }
                            }
                        }
                }
            }
        }
    }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    solutionPresent()
//    solutionPush()
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
