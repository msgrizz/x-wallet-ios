//
//  XWMyViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/9.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit
class XWMyViewController: UIBaseViewController,FSPagerViewDataSource,FSPagerViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var codeButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    fileprivate let imageNames = ["testImage"]
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = .zero
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Me", comment: "")
        
        headImage.layer.borderWidth = 3
        headImage.layer.masksToBounds = false
        headImage.layer.borderColor = UIColor.white.cgColor
        headImage.layer.cornerRadius = headImage.frame.height/2
        headImage.clipsToBounds = true
        
        pageControl.numberOfPages = self.imageNames.count
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: (self.view.frame.size.width-70)/3, height:((self.view.frame.size.width-70)/3) * 117/102)
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "MyAuthenticationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyAuthenticationCollectionViewCell")
        
        configUser()
//        collectionView.register(UINib?"MyAuthenticationCollectionViewCell", forCellWithReuseIdentifier: "MyAuthenticationCollectionViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func configUser(){
        headImage.kf.setImage(with: URL(string: XWLocalManager.sharedInstance().localUser.avatar!))
        creditLabel.text = "Credit："+"\(XWLocalManager.sharedInstance().localUser.credit!)"
        nameLabel.text = XWLocalManager.sharedInstance().localUser.loginName
        contentLabel.text = XWLocalManager.sharedInstance().localUser.nickname
        emailLabel.text = XWLocalManager.sharedInstance().localUser.email
        idLabel.text = "Identity code: \(XWLocalManager.sharedInstance().localUser.id!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    @IBAction func codeAction() {
//        
//    }

    // MARK:- FSPagerView DataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        self.pageControl.currentPage = index
        self.performSegue(withIdentifier: "goToInvite", sender: nil)
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMyCard"
        {
//            let viewController: MyCardViewController = segue.destination as! MyCardViewController
        }
    }

}

extension XWMyViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyAuthenticationCollectionViewCell", for: indexPath) as! MyAuthenticationCollectionViewCell
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named:"au1")
        }else if indexPath.row == 1{
            cell.imageView.image = UIImage(named:"au2")
        }else if indexPath.row == 2{
            cell.imageView.image = UIImage(named:"au3")
        }else if indexPath.row == 3{
            cell.imageView.image = UIImage(named:"au4")
        }
        return cell
    }
}
