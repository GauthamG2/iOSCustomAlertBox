//
//  AlertViewTwoAction.swift
//  CustomAlertBox
//
//  Created by Gautham Sritharan on 2021-06-07.
//

import UIKit

protocol AlertViewTwoActionsDelegate {
    func didTapOnOk(action: String)
    func didTapOnCancel(action: String)
}

class AlertViewTwoAction: UIView {

    // MARK: - Variables
    static let instance = AlertViewTwoAction()
    var delegate: AlertViewTwoActionsDelegate?
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertViewTwoAction", owner: self, options: nil)
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
    }
    
    enum CustomAlertType {
        case success
        case failure
    }
    
    // MARK: - Show Custom Alert with Actions
    
    func showCustomAlertWithActions(title: String?, message: String, actions: [CustomAlertAction], from vc: UIViewController) {
        self.lblTitle.text = title
        self.lblMessage.text = message
        self.btnOk.setTitle(actions.first?.title ?? "OK", for: .normal)
        self.btnCancel.setTitle(actions.last?.title ?? "Cancel", for: .normal)
        self.delegate = vc as? AlertViewTwoActionsDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func didTapOnOkButton(_ sender: UIButton) {
        delegate?.didTapOnOk(action: sender.title(for: .normal) ?? "Ok")
        parentView.removeFromSuperview()
    }
    
    @IBAction func didTapOnCancelButton(_ sender: UIButton) {
        delegate?.didTapOnCancel(action: sender.title(for: .normal) ?? "Cancel")
        parentView.removeFromSuperview()
    }
    
}
