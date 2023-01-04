//
//  HomePageViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 02/01/23.
//

import UIKit

class HomePageViewController: UIViewController {
    // Outlets
    @IBOutlet weak var previewColView: UICollectionView!
    @IBOutlet weak var subjectColView: UICollectionView!
    @IBOutlet weak var autopageCon: UIPageControl!
    @IBOutlet weak var brBtnPoints: UIBarButtonItem!
    
    // Constants
    
    let arrSubImage = [UIImage(imageLiteralResourceName: "prayer.png"), UIImage(systemName: "face.dashed.fill"), UIImage(systemName: "face.dashed.fill")]
    let arrPreviewimg = [UIImage(imageLiteralResourceName: "Kidsgroup.png")]
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewColView.delegate = self
        subjectColView.delegate = self
        previewColView.dataSource = self
        subjectColView.dataSource = self
        brBtnPoints.customView?.layer.borderWidth = 10
        brBtnPoints.customView?.layer.cornerRadius = 10
        brBtnPoints.customView?.layer.masksToBounds = true
        
        // this is a confusing code, make sure to review it while error.
        autopageCon.numberOfPages = arrSubImage.count
        autopageCon.currentPage = 0
        DispatchQueue.main.async {
              self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
           }
        // nav Controller
        navigationItem.backButtonTitle = ""
    }
    @objc func changeImage() {
         if counter < arrSubImage.count {
              let index = IndexPath.init(item: counter, section: 0)
              self.previewColView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
              autopageCon.currentPage = counter
              counter += 1
         } else {
              counter = 0
              let index = IndexPath.init(item: counter, section: 0)
             self.previewColView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
               autopageCon.currentPage = counter
               counter = 1
           }
      }
}
extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView.viewWithTag(0){
           return 5
        }
        else{
            return 3
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView.viewWithTag(0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
            cell.imgPreviewPage.image = arrSubImage[0]
            cell.imgPreviewPage.layer.cornerRadius = 20
            cell.imgPreviewPage.layer.shadowOffset = CGSize(width: cell.imgPreviewPage.bounds.width, height: 1)
            cell.imgPreviewPage.layer.shadowColor = UIColor.red.cgColor
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell2", for: indexPath) as! HomePageCollectionViewCell2
            cell.imgSubject.image = arrPreviewimg[0]
            cell.imgSubject.layer.cornerRadius = 20
             return cell
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == collectionView.viewWithTag(0){
           return 1
        }
        else{
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: .main)
        let destinationVC = sb.instantiateViewController(withIdentifier: "SubjectCollectionViewController")
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
}
