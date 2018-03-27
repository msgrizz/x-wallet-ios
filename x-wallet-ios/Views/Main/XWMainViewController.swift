//
//  XWMainViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
import DynamicBlurView
import SnapKit
class XWMainViewController: UIBaseViewController {
    
    var slideView: XWSlideView!
    var blurView: DynamicBlurView!
    var addButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scrollView: UIScrollView!

    var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Wallet", comment: "")
        searchBar.backgroundColor=UIColor.clear
        searchBar.placeholder = NSLocalizedString("Search", comment: "")
        
        addButton = UIBarButtonItem(
            image: UIImage.init(named: "newMessage"),
            style: .plain,
            target: self,
            action: #selector(add(_:))
        )
        addButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = addButton
        
        slideView = XWSlideView.fromNib()
        slideView.frame = UIScreen.main.bounds
        slideView.closeButton.addTarget(self, action: #selector(dismissSlide(_ :)), for: .touchUpInside)
        slideView.alpha = 0
        
        let contract = UITapGestureRecognizer.init(target: self, action: #selector(addContractAction(_:)))
        slideView.miniContract.addGestureRecognizer(contract)
        
        let token = UITapGestureRecognizer.init(target: self, action: #selector(addTokenAction(_:)))
        slideView.token.addGestureRecognizer(token)
        
        let myCard = UITapGestureRecognizer.init(target: self, action: #selector(addCardAction(_:)))
        slideView.myCard.addGestureRecognizer(myCard)
        
        let scan = UITapGestureRecognizer.init(target: self, action: #selector(addScanAction(_:)))
        slideView.scan.addGestureRecognizer(scan)
        
        blurView = DynamicBlurView(frame: slideView.bounds)
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        
        self.scrollView.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.right.equalTo(scrollView)
        }
        
        let oneCard: XWContractView = XWContractView.fromNib()
        oneCard.cards = [BaseCardModel(),BaseCardModel()]
        oneCard.frame = getAppRect(cardNum: oneCard.cards.count)
        oneCard.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(getAppRect(cardNum: oneCard.cards.count).height)
            make.width.equalTo(getAppRect(cardNum: oneCard.cards.count).width)
        }
        oneCard.contractButton.addTarget(self, action: #selector(goToLists), for: UIControlEvents.touchUpInside)
        self.stackView.addArrangedSubview(oneCard)

        let demoTwoCard1: XWTwoCardDemoView = XWTwoCardDemoView.fromNib()
        demoTwoCard1.backImageView.image = UIImage(named: "demo1")
        self.stackView.addArrangedSubview(demoTwoCard1)
        
        let demoThreeCard: XWThreeCardDemoView = XWThreeCardDemoView.fromNib()
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(goToMembership))
        demoThreeCard.addGestureRecognizer(tap2)
        self.stackView.addArrangedSubview(demoThreeCard)
        
        let demoOneCard1: XWOneCardDemoView = XWOneCardDemoView.fromNib()
        demoOneCard1.backImageView.image = UIImage(named: "demo3")
        self.stackView.addArrangedSubview(demoOneCard1)
        
        let demoOneCard2: XWOneCardDemoView = XWOneCardDemoView.fromNib()
        demoOneCard2.backImageView.image = UIImage(named: "demo4")
        self.stackView.addArrangedSubview(demoOneCard2)
        
        let demoOneCard3: XWOneCardDemoView = XWOneCardDemoView.fromNib()
        demoOneCard3.backImageView.image = UIImage(named: "demo5")
        self.stackView.addArrangedSubview(demoOneCard3)
        
        let demoTwoCard3: XWOneCardDemoView = XWOneCardDemoView.fromNib()
        demoTwoCard3.backImageView.image = UIImage(named: "demo6")
        self.stackView.addArrangedSubview(demoTwoCard3)
        
        let noCard: XWNoCardView = XWNoCardView.fromNib()
        self.stackView.addArrangedSubview(noCard)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height + 20)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAppRect(cardNum: Int) -> CGRect {
        return CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: CGFloat(52 + 14 + cardNum * 46))
    }
    
    @objc func add(_ : UIBarButtonItem) {
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.window?.addSubview(self.blurView)
        myAppdelegate.window?.addSubview(slideView)
        UIView.animate(withDuration: 0.5) {
            self.blurView.blurRadius = 70
            self.slideView.alpha = 1
        }
    }
 
    @objc func goToLists(_ : UIButton) {
        self.performSegue(withIdentifier: "goToCardList", sender: nil)
    }
    
    @objc func goToMembership(_ : UIButton) {
        let Membership: UIStoryboard = UIStoryboard(name: "Membership", bundle: nil)
        self.navigationController?.pushViewController(Membership.instantiateInitialViewController()!, animated: true)
    }
    
    @objc func dismissSlide(_ :UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.blurView.blurRadius = 0
            self.slideView.alpha = 0
        }) { (true) in
            self.slideView.removeFromSuperview()
            self.blurView.removeFromSuperview()
        }
    }
    
    @objc func addContractAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())
    }
    
    @objc func addScanAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())

    }
    
    @objc func addTokenAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())

    }
    
    @objc func addCardAction(_ :UITapGestureRecognizer) {
        dismissSlide(_ :UIButton())

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCardList" {
            let vc = segue.destination as! XWCardListTableViewController
            vc.title = "Mini Contract"
        }
    }

}

extension XWMainViewController: UITabBarDelegate {
    
}

extension XWMainViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
        
        
        return false
    }
}
