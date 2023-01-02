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
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var progressBar: BigProgressView!
    // Models
    let btnModel = CustomButton()
    
    // Constants
    
    var rotationAngle: CGFloat!
    let width: CGFloat = 150
    let height: CGFloat = 150
    let arrAge = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var selectedGender = "Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Picker - Add, Customize
        agepickerviewtoSuperView()
        
        //icon view
        viewBorders(vieW: maleIconView)
        viewBorders(vieW: femaleIconView)
        
        // button edits
        btnModel.editbtn1(pressButton: btnNext)
        
        // progressBar
        progressBar.layer.cornerRadius = 8
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    func viewBorders(vieW: UIView){
        vieW.layer.borderWidth = 3
        vieW.layer.borderColor = UIColor.white.cgColor
        vieW.layer.cornerRadius = 50
        maleIconView.layer.borderColor = UIColor.red.cgColor
    }
    func agepickerviewtoSuperView(){
        agePicker.delegate = self
        agePicker.dataSource = self
        rotationAngle = (-90 * (.pi/180))
        agePicker.transform = CGAffineTransform(rotationAngle: (rotationAngle))
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
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let secondVC = sb.instantiateViewController(identifier: "CreateProfileViewController")
               self.navigationController?.pushViewController(secondVC, animated: true)
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
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        view.addSubview(label)
        // till now picker was rotated, not the view.
        
        // View rotation
        view.transform = CGAffineTransform(rotationAngle: ((90 * (.pi/180))))
        return view
    }
}

//MARK: toDo List
// 1. Make pickerView selected view dynamic
// 2.
