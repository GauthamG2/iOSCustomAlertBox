//
//  ViewController.swift
//  CustomAlertBox
//
//  Created by Gautham Sritharan on 2021-06-07.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnOneAction(_ sender: UIButton) {
        AlertViewOneAction.instance.showCustomAlert(title: "One Action", message: "Custom alert box with one action", action: CustomAlertAction(title: "Ok"))
    }
    
    @IBAction func didTapOnTwoAction(_ sender: UIButton) {
        let yesAction = CustomAlertAction(title: "Ok")
        let noAction = CustomAlertAction(title: "Cancel", style: .cancel)
        
        AlertViewTwoAction.instance.showCustomAlertWithActions(title: "Two Action", message: "Custom alert box with two action", actions: [yesAction, noAction], from: self)
    }
}

