//
//  SignUpNavController.swift
//  Strats360_Kids
//
//  Created by Strats 360 on 29/12/22.
//

import UIKit

//class SignUpNavController: UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
final class SignUpNavController: UINavigationController {
    private let progressView = UIProgressView(progressViewStyle: .bar)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupProgressView()
    }
    
    private func setupProgressView() {
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
}
