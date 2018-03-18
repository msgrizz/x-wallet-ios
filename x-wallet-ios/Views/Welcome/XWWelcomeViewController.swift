//
//  WelcomeViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/6.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWWelcomeViewController: UIBaseViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    fileprivate var scrollView: UIScrollView!
    
    fileprivate let numOfPages = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = self.view.bounds
        
        scrollView = UIScrollView(frame: frame)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint.zero
        
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)
        
        scrollView.delegate = self
        for index  in 0..<numOfPages {
            let imageView = UIImageView(image: UIImage(named: "guideImage\(index + 1)"))
            
            let width = frame.size.width - 40
            
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index) + (frame.size.width - width)/2 , y: (frame.size.height - width)/2, width: width, height: width)
            imageView.contentMode = .center
            scrollView.addSubview(imageView)
        }
        
        self.view.insertSubview(scrollView, at: 0)

        self.joinButton.alpha = 0.0
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinAction(_ button: UIButton){
        let login: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.rootViewController = login.instantiateInitialViewController();
    }
    
    func animationText(_ text: String){
        UIView.transition(with: self.contentLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.contentLabel.text = text
            }, completion: nil)
    }
}

extension XWWelcomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        
        switch pageControl.currentPage {
        case 0:
            animationText(NSLocalizedString("Asset Encryption", comment: ""))
        case 1:
            animationText(NSLocalizedString("Mini Contract", comment: ""))
        case 2:
            animationText(NSLocalizedString("Message", comment: ""))
        default:
            animationText(NSLocalizedString("Asset Encryption", comment: ""))
        }
        
        
        
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.joinButton.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.joinButton.alpha = 0.0
            })
        }
    }
}
