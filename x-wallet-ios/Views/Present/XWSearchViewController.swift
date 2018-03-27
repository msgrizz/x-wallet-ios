//
//  XWSearchViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/14.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWSearchViewController: UIBaseViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.register(UINib(nibName: "XWSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "XWSearchTableViewCell")
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Search", comment: ""),
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction () {
        self.navigationController?.dismiss(animated: true, completion: {
            
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension XWSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

extension XWSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XWSearchTableViewCell", for: indexPath) as! XWSearchTableViewCell
        cell.contentLabel.text = "Employment Contract"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Important"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
}

extension XWSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headView = view as! UITableViewHeaderFooterView
        headView.backgroundColor = UIColor.clear
        headView.backgroundView?.backgroundColor = UIColor.clear
        headView.contentView.backgroundColor = UIColor.clear
        headView.textLabel?.textColor = UIColor.init(hex: "989da5")
    }
}
