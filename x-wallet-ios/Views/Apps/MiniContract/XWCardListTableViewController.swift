//
//  XWCardListTableViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/16.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWCardListTableViewController: UIBaseTableViewController {
    
    var lastScrollOffset: CGFloat = 0
    
    var isScrollDown: Bool = true

    var searchButton: UIBarButtonItem!
    
    var addMoreButton:UIButton!

    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var addButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UINib(nibName: "XWContractTableViewCell", bundle: nil), forCellReuseIdentifier: "XWContractTableViewCell")

        
//        self.tableView.contentInset.bottom = self.bottomBar.frame.size.height
//        self.tableView.scrollIndicatorInsets.bottom = self.bottomBar.frame.size.height
        
        searchButton = UIBarButtonItem(
            image: UIImage.init(named: "searchButton"),
            style: .plain,
            target: self,
            action: #selector(search(_:))
        )
        searchButton.tintColor = Colors.tintColor
        self.navigationItem.rightBarButtonItem = searchButton
        
        addMoreButton = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 100, width: 39, height: 39))
        addMoreButton.setImage(UIImage(named: "bottomAdd"), for: .normal)
        addMoreButton.addTarget(self, action: #selector(add(_:)), for: UIControlEvents.touchUpInside)

    }
    
    @objc func search(_ : UIBarButtonItem) {
        let search: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        self.present(search.instantiateInitialViewController() as! UINavigationController, animated: true) {
            
        }
    }
    
    @objc func add(_ : UIButton) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.addMoreButton.removeFromSuperview()
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.bottomBar.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 71, width: UIScreen.main.bounds.width, height: 71)
//        self.bottomBar.bringSubview(toFront: self.addButton)
//        self.navigationController?.view.addSubview(self.bottomBar)
        self.navigationController?.view.addSubview(self.addMoreButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWContractTableViewCell", for: indexPath) as! XWContractTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isScrollDown {
            self.tableView.bringSubview(toFront: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = XWCardListHeaderView.fromNib()
        headView.clearData()
        if section==0 {
            headView.titleLabel.text = "Ongoing"
            headView.numberButton.isHidden = true
        }else {
            headView.titleLabel.text = "Completed"
        }
        return headView
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            let y = scrollView.contentOffset.y
            if (y > self.lastScrollOffset) {
                isScrollDown = true
            } else {
                isScrollDown = false
            }
            self.lastScrollOffset = y;
        }
    }

}