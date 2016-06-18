import UIKit

class WPRadarController: UIViewController {
	@IBOutlet var imageRadar: UIImageView!
	@IBOutlet var labelTitle: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if let city = WP.station?.city {
			labelTitle.text = city
		}
		if let api = WP.api.radar {
			//	TODO: error handling while fetching image failed
			LF.dispatch_main() {
				self.imageRadar.image = UIImage.animatedImageWithAnimatedGIFURL(NSURL(string: api))
			}
		} else {
			labelTitle.text = WP.s.unknown
			imageRadar.image = nil
		}
	}
}