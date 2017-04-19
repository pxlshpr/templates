import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var app: Application?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.app = Application(window: window)
    
    self.window = window
    self.app?.navigation.start()
    return true
  }
}

class Application {
  private let window: UIWindow
  lazy var navigation: Navigation = Navigation(
    window: self.window,
    navigationController: NavigationController(),
    application: self
  )
  
  init(window: UIWindow) {
    self.window = window
  }
}

class NavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    //self.setNavigationBarHidden(true, animated: false)
  }
}

class Navigation {
  private let navigationController: UINavigationController
  private let application: Application
  
  init(window: UIWindow, navigationController: UINavigationController, application: Application) {
    self.application = application
    self.navigationController = navigationController
    window.rootViewController = self.navigationController
    window.makeKeyAndVisible()
  }
  
  func start() {
    self.showFirstScreen()
  }
  
  func showFirstScreen() {
    let viewController = UIViewController()
    viewController.view.backgroundColor = .white
    self.navigationController.pushViewController(viewController, animated: false)
  }
}
