//
//  CreateProfileViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 30/12/22.
//

import UIKit

class CreateProfileViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var taskSelectorColView: UICollectionView!
    
    
    // Constants
    let arrSubImages: [UIImage] = [UIImage(imageLiteralResourceName: "kidzoLogo.png")]
    let arrSubLabels = ["Subject Name"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskSelectorColView.delegate = self
        taskSelectorColView.dataSource = self
        
        // Do any additional setup after loading the view.
        editbtn(btn: btnNext)
    }
    // btn edits
    func editbtn(btn: UIButton){
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowPath = CGPath(rect: CGRect(x: 5, y: 35, width: 290, height: 10), transform: .none)
        btn.layer.shadowRadius = 5
        btn.layer.shadowOpacity = 2
        btn.layer.cornerRadius = 10
    }
}
extension CreateProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectSelectCell", for: indexPath) as! SubjectSelectCell
        cell.imgSubject.image = arrSubImages[0]
        cell.lblSubjectName.text = arrSubLabels[0]
//        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.borderWidth = 3
        cell.contentView.layer.cornerRadius = 15
        
        if indexPath.row == index{
            cell.contentView.layer.borderColor = UIColor.red.cgColor
            cell.contentView.addBorder(to: .bottom, in: .red, width: 6)
        }
        else {
            cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            cell.contentView.addBorder(to: .bottom, in: .lightGray, width: 6)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        index = indexPath.row
        collectionView.reloadData()
    }

}
class SubjectSelectCell: UICollectionViewCell{
    
    @IBOutlet weak var imgSubject: UIImageView!
    @IBOutlet weak var lblSubjectName: UILabel!
    
}
extension UIView {
    enum ViewSide {
        case top
        case left
        case bottom
        case right
    }

    func addBorders(to sides: [ViewSide], in color: UIColor, width: CGFloat) {
        sides.forEach { addBorder(to: $0, in: color, width: width) }
    }

    func addBorder(to side: ViewSide, in color: UIColor, width: CGFloat) {
        switch side {
        case .top:
            addTopBorder(in: color, width: width)
        case .left:
            addLeftBorder(in: color, width: width)
        case .bottom:
            addBottomBorder(in: color, width: width)
        case .right:
            addRightBorder(in: color, width: width)
        }
    }

    func addTopBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        addSubview(border)
    }

    func addBottomBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(border)
    }

    func addLeftBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        addSubview(border)
    }
}

