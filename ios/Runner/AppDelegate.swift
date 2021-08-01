import UIKit
import Flutter
import SKPhotoBrowser
import SwiftProtobuf

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    static let sharedInstance = AppDelegate()
    var navigationController:UINavigationController!
    
    func solutionPresent(){
        if let controller = self.window.rootViewController as? FlutterBinaryMessenger{
            let nativeChannel = FlutterMethodChannel.init(name: "flutterplugins.javatpoint.com/interaction", binaryMessenger: controller)
            nativeChannel.setMethodCallHandler {(call: FlutterMethodCall, resultFlutter: FlutterResult) -> Void in
                NSLog("vao day da")
                    if (call.method == "enablepush") {
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
                            resultFlutter(FlutterError.init(code: "bad args", message: nil, details: nil))
                        }
                    }
                    else if (call.method == "showPhoto") {
                        if let args = call.arguments as? Dictionary<String, Any>,
                           let content = args["content"] as? String, let array = args["array"] as? NSArray{
                            self.showImage(array: array, content: content)
                        }
                    } else if (call.method == "getproduct") {
                        if let args = call.arguments as? Dictionary<String, Any>,
                           let url = args["url"] as? String{
                            NSLog("url: %@", url)
//                            result("hahahaha")
                            
                            var product = Product()
                            product.name = "tin toi di"
                            product.title = "ok ong"
                            product.content = "an sua chua"
                            
                            do {
                                let jsonData: Data = try product.serializedData()
                                let giaima:Product = try Product.init(serializedData: jsonData)
                                
                                print(giaima.content)
                                
                                resultFlutter(jsonData)
                                
                                
                            }
                            catch let error {
                                
                            }
                            
                            
                            
                            
                                //APIRequest.sharedInstance.getProduct { result, error in
//                                    if let data = result as? String {
//                                        do {
//                                            let product = try Product(jsonString: data)
//                                            print("den day luon jsonString xong")
//                                        }
//                                        catch let error {
//                                            print(error.localizedDescription)
//                                            resultFlutter("hahahaha")
//                                        }
//                                    }
                                //}
                                
//                            )
                            
                            
                            
                        }
                        else {
                            resultFlutter(FlutterError.init(code: "bad args", message: nil, details: nil))
                        }
                    }
                }
        }
    }
    
    func showImage(array:NSArray, content: String) {
        print("goi vao day roi")
        
        var images = [SKPhoto]()
        for i in 0..<array.count {
            if let url = array[i] as? String {
                let photo = SKPhoto.photoWithImageURL(url)
                photo.shouldCachePhotoURLImage = false // you can use image cache by true(NSCache)
                images.append(photo)
            }
        }

        // 2. create PhotoBrowser Instance, and present.
        let browser = SKPhotoBrowser(photos: images)
        
        var index = 0
        if (array.index(of: content) > 0) {
            index = array.index(of: content)
        }
        browser.initializePageIndex(index)
                
        let flutterViewController : FlutterViewController = self.window?.rootViewController as! FlutterViewController
        flutterViewController.present(browser, animated: true, completion: {})
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
