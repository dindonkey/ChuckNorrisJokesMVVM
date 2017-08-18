import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard
            let navigationController = window?.rootViewController as? UINavigationController,
            let jokesViewController = navigationController.viewControllers.first as? JokesViewController else { fatalError("Not a JokesViewController ?!?") }
        
        jokesViewController.jokesProvider = RxMoyaProvider<JokesService>()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}

