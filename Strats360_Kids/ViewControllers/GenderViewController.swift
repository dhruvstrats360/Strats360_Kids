//
//  GenderViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 26/12/22.
//

import UIKit


class GenderViewController: UIViewController {
    // Outlets
    @IBOutlet weak var maleIconView: UIView!
    @IBOutlet weak var femaleIconView: UIView!
    @IBOutlet weak var pickerUIView: UIView!
    
    
    // Constants
    
    var agePickerView = UIPickerView()
    var rotationAngle: CGFloat!
    let width: CGFloat = 100
    let height: CGFloat = 100
    let arrAge = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var selectedGender = "Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Picker - Add, Customize
        agepickerviewtoSuperView()
        
        //icon view
        viewBorders(vieW: maleIconView)
        viewBorders(vieW: femaleIconView)
        
        self.navigationController?.isNavigationBarHidden = false

        
    }
    func viewBorders(vieW: UIView){
        vieW.layer.borderWidth = 3
        vieW.layer.borderColor = UIColor.white.cgColor
        vieW.layer.cornerRadius = 50
        maleIconView.layer.borderColor = UIColor.red.cgColor
    }
    func agepickerviewtoSuperView(){
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.frame = CGRect(x: 130, y: -130, width: pickerUIView.frame.height, height: pickerUIView.frame.width)
//        agePickerView.center = pickerUIView.center
        rotationAngle = (-90 * (.pi/180))
        agePickerView.transform = CGAffineTransform(rotationAngle: (rotationAngle))
        pickerUIView.addSubview(agePickerView)
        
    }
    
    @IBAction func femaleBtnPressed(_ sender: Any) {
        
         if maleIconView.layer.borderColor == UIColor.red.cgColor && femaleIconView.layer.borderColor == UIColor.white.cgColor{
             femaleIconView.layer.borderColor =  UIColor.red.cgColor
             maleIconView.layer.borderColor = UIColor.white.cgColor
             selectedGender = "Female"
        }
    }
    @IBAction func malebtnPressed(_ sender: UIButton) {
        if femaleIconView.layer.borderColor == UIColor.red.cgColor && maleIconView.layer.borderColor == UIColor.white.cgColor{
            maleIconView.layer.borderColor =  UIColor.red.cgColor
            femaleIconView.layer.borderColor = UIColor.white.cgColor
            selectedGender = "Male"
       }
    }
}
//MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension GenderViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    // pickerSelection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(arrAge[row])
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrAge.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arrAge[row])
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        height
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        width
    }
    // Customizing view that returns data we have selected.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        label.text = "\(arrAge[row])"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        view.addSubview(label)
        // till now picker was rotated, not the view.
        
        // View rotation
        view.transform = CGAffineTransform(rotationAngle: ((90 * (.pi/180))))
        return view
    }
    
}
class BigProgressView: UIProgressView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 20)
    }
}
