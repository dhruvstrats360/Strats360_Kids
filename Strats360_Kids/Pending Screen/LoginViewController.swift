//
//  ViewController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 26/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgLogoCover: UIImageView!
    @IBOutlet weak var imgDisplaytoons: UIImageView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    // Buttons Edit Model
    let btn360 = CustomButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesSearchBarWhenScrolling = true
        imgLogoCover.layer.cornerRadius = 20
        
        btn360.editbtn1(pressButton: btnLogin)
        btn360.editbtn1(pressButton: btnSignUp)
        // some edit spl for SignUp btn.
        
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func LoginBtnPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let secondVC = sb.instantiateViewController(identifier: "GenderViewController")
               self.navigationController?.pushViewController(secondVC, animated: true)

    }
    @IBAction func SignUPBtnPressed(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let secondVC = sb.instantiateViewController(identifier: "GenderViewController")
               self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

