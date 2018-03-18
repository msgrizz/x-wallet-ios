// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import UIKit
import SafariServices

enum ConfirmationError: LocalizedError {
    case cancel
}

extension UIViewController {
    
    func displayLoading() {
        
    }

    func hideLoading(animated: Bool = true) {
        
    }

    func openURL(_ url: URL) {
        let controller = SFSafariViewController(url: url)
        controller.preferredBarTintColor = Colors.darkBlue
        present(controller, animated: true, completion: nil)
    }
}
