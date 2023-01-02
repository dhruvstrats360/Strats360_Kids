//
//  SetTimerViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 02/01/23.
//

import UIKit

class SetTimerViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var btnNEXT: UIButton!
    @IBOutlet weak var imgTimeLogo: UIImageView!
    @IBOutlet weak var breakSlider: CustomSlider!
    @IBOutlet weak var dailyLimitSlider: CustomSlider!
    @IBOutlet weak var lblBreakTime: UILabel!
    @IBOutlet weak var lblDailyTime: UILabel!
    
    // Initializing Model classes
    
    let BTNModel = CustomButton()
    
    // Constants
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BTNModel.editbtn1(pressButton: btnNEXT)
        
        }
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
    }
    
    
}

