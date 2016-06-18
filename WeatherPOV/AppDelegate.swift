import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		//UIFont.print_all()
		initParse(launchOptions)
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
	}

	func applicationDidEnterBackground(application: UIApplication) {
	}

	func applicationWillEnterForeground(application: UIApplication) {
	}

	func applicationDidBecomeActive(application: UIApplication) {
	}

	func applicationWillTerminate(application: UIApplication) {
	}

	func initParse(launchOptions: [NSObject: AnyObject]?) {
		let applicationId	= "C4MCodjI5pFuctdLMDKSjgGSybVm9XWLFc7cmDQF"
		let clientKey		= "ik5E1yuhvPwUqiUBc6QyhSN3NSz3KyQmLWtOWHWw"
		Parse.setApplicationId(applicationId, clientKey:clientKey)

		PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block:{
			(success, error) in
			LF.log("ANALYTICS success", success)
		})

		//PFUser.logInWithUsername("no@name.com", password:"asdf")
        if let user = PFUser.currentUser() {
            WP.user = user
        } else {
			PFUser.enableAutomaticUser()
		}
		LF.log("user", WP.user)
		PFQuery.clearAllCachedResults()
	}
}