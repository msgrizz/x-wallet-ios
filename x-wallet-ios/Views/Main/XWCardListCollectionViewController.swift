//
//  XWCardListCollectionViewController.swift
//  x-wallet-ios
//
//  Created by 爱班 on 2018/3/16.
//  Copyright © 2018年 linkio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "XWContractCollectionViewCell"

class XWCardListCollectionViewController: UICollectionViewController {
    var cardCollectionViewLayout: HFCardCollectionViewLayout?
    var cardArray: [BaseCardModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = ""
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        cardArray = [BaseCardModel(),BaseCardModel()]
        addClearItem()
        // Register cell classes
        self.collectionView?.register(UINib(nibName: "XWContractCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addClearItem () {
        if cardArray.count < 10 {
            var clearModel = BaseCardModel()
            clearModel.isClear = true
            cardArray.append(clearModel)
            addClearItem()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // MARK: CollectionView
    
    func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willRevealCardAtIndex index: Int) {
        if let cell = self.collectionView?.cellForItem(at: IndexPath(item: index, section: 0)) as? XWContractCollectionViewCell {
            cell.cardCollectionViewLayout = self.cardCollectionViewLayout
//            cell.cardIsRevealed(true)
        }
    }
    
    func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willUnrevealCardAtIndex index: Int) {
        if let cell = self.collectionView?.cellForItem(at: IndexPath(item: index, section: 0)) as? XWContractCollectionViewCell {
            cell.cardCollectionViewLayout = self.cardCollectionViewLayout
//            cell.cardIsRevealed(false)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! XWContractCollectionViewCell
        cell.needClear = self.cardArray[indexPath.item].isClear
        //        cell.imageIcon?.image = self.cardArray[indexPath.item].icon
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.cardCollectionViewLayout?.revealCardAt(index: indexPath.item)
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempItem = self.cardArray[sourceIndexPath.item]
        self.cardArray.remove(at: sourceIndexPath.item)
        self.cardArray.insert(tempItem, at: destinationIndexPath.item)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
