//
//  UIBasePresentationController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/12.
//  Copyright © 2018年 evrins. All rights reserved.
//

import Foundation
import UIKit

class UIBasePresentationController: UIPresentationController {
    
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    open var controllerHeight:CGFloat
    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if case let vc as UIBasePresentationControllerVC = presentedViewController {
            controllerHeight = vc.controllerHeight ?? UIScreen.main.bounds.height
        } else {
            controllerHeight = UIScreen.main.bounds.width
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    public override func presentationTransitionWillBegin() {
        blackView.alpha = 0
        containerView?.addSubview(blackView)
        let sacn = UITapGestureRecognizer.init(target: self, action: #selector(dismissView(_:)))
        blackView.addGestureRecognizer(sacn)
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1
        }
    }
    
    @objc func dismissView(_ : UITapGestureRecognizer) {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    public override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }

    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
        }
    }
    
    public override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height-controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
    }
    
}

public class UIBasePresentationControllerVC: UIViewController {
    public var controllerHeight: CGFloat? {
        get {
            return self.controllerHeight
        }
    }
}

extension UIViewController: UIViewControllerTransitioningDelegate {
    
    public func presentBottom(_ vc: UIBasePresentationControllerVC.Type) {
        let controller = vc.init()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = UIBasePresentationController(presentedViewController: presented, presenting: presenting)
        return present
    }
}
