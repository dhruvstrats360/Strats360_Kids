//
//  ChapterCollectionViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 04/01/23.
//

import UIKit

//private let reuseIdentifier = "Cell"

class ChapterCollectionViewController: UICollectionViewController {

    // Constants
    let arrImgs = [UIImage(imageLiteralResourceName: "BoyIcon"), UIImage(imageLiteralResourceName: "cardBoardkid"), UIImage(imageLiteralResourceName: "GirlIcon"), UIImage(imageLiteralResourceName: "Kidsgroup"), UIImage(imageLiteralResourceName: "prayer"), UIImage(imageLiteralResourceName: "rainbow")]
    let arrNames = ["Subject Names"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // nav Controller
        navigationItem.title = "Chapter Name"
        navigationItem.titleView?.tintColor = .black
        navigationItem.backButtonTitle = ""
        
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrImgs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChapterCell", for: indexPath) as! ChapterCollectionViewControllerCell
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        cell.imgChapter.image = arrImgs[indexPath.row]
        cell.lblChapName.text = arrNames[0]
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height: 160)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: .main)
        let destinationVC = sb.instantiateViewController(withIdentifier: "1234")
        navigationController?.pushViewController(destinationVC, animated: true)
        
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

class ChapterCollectionViewControllerCell: UICollectionViewCell{
    @IBOutlet weak var imgChapter: UIImageView!
    @IBOutlet weak var lblChapName: UILabel!
    
}
