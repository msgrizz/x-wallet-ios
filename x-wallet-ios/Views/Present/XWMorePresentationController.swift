//
//  XWMorePresentationController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/4/12.
//  Copyright © 2018年 evrins. All rights reserved.
//

import UIKit

class XWMorePresentationController: UIBasePresentationControllerVC {
    let size = CGSize(width: 70, height: 93)
    
    
    var actionArray: [UIButton] = [UIButton]()
    
    lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 130))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override var controllerHeight: CGFloat? {
        return 130
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        if actionArray.count>0 {
            for btn in actionArray {
                
            }
        }
    }
}
