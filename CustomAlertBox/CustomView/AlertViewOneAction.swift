//
//  AlertViewOneAction.swift
//  CustomAlertBox
//
//  Created by Gautham Sritharan on 2021-06-07.
//

import UIKit

protocol AlertViewOneDelegate {
    func didTapOnOk(action: String)
}

class AlertViewOneAction: UIView {

    // MARK: - Variables
    static let instance = AlertViewOneAction()
    var delegate: AlertViewOneDelegate?
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("AlertViewOneAction", owner: self, options: nil)
        
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commomInit() {
        
        // Parentview Properties
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        baseView.layer.cornerRadius = 10
        
        // Button UI
        btnOk.layer.cornerRadius = 5
    }
    
    // MARK: - Show Custom Alert
    func showCustomAlert(title: String, message: String, action: CustomAlertAction) {
        self.lblTitle.text = title
        self.lblMessage.text = message
        self.btnOk.setTitle(action.title ?? "OK", for: .normal)
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    // MARK: - Show Custom Alert with Action
    func showCustomAlertWithAction(title: String?, message: String, action: CustomAlertAction, from vc: UIViewController) {
        self.lblTitle.text = title
        self.lblMessage.text = message
        self.btnOk.setTitle(action.title ?? "OK", for: .normal)
        self.delegate = vc as? AlertViewOneDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func didTapOnButton(_ sender: UIButton) {
        delegate?.didTapOnOk(action: sender.title(for: .normal) ?? "OK")
        parentView.removeFromSuperview()
    }
}

struct CustomAlertAction {
    var title: String?
    var style: UIAlertAction.Style
    
    init(title: String, style: UIAlertAction.Style = .default) {
        self.title = title
        self.style = style
    }
}
