//
//  XWReceiveCodeViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/4.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

class XWReceiveCodeViewController: UIBaseViewController {
    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Pay&Collect", comment: "")
        self.qrCodeImage.image = UIImage.createQRCode(size: self.qrCodeImage.frame.size.width, dataStr: self.createDataString())
        self.navigationController?.navigationBar.prefersLargeTitles = false

        self.backgroundView.layer.cornerRadius = 10
        self.backgroundView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func createDataString() -> String {
        let code = "asdadaasdadadadadad"
        let data = "xwallet://00?data=\(code)&timestamp=\(NSDate().timeIntervalSince1970)"
        return data.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
    }
    
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
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
