//
//  ViewController.swift
//  MentionsDisplayer
//
//  Created by macmini on 05/05/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var outerView: UIView!
    var isProfileList : Bool! {
        didSet {
            if isProfileList {
                MyDropDown.shared.ConfigureCoustomMentionList(viewDropDown: txtView, successBlock: { (index, arrResult, strSearchKey) in
                    let strName = arrResult[index]
                    if  strSearchKey == "@" {
                        self.txtView.insertText("\(strName) ")
                    }else{
                        self.txtView.text = self.txtView.text.replacingOccurrences(of: strSearchKey, with: "")
                        self.txtView.insertText("@\(strName) ")
                    }
                }) {
                    
                }
            }else{
                MyDropDown.shared.ConfigureMentionList(viewDropDown: txtView, successBlock: { (index, arrResult, strSearchKey) in
                    let strName = arrResult[index]
                    if  strSearchKey == "@" {
                        self.txtView.insertText("\(strName) ")
                    }else{
                        //var selectedRange = self.txtView.selectedRange
                        //selectedRange.location = selectedRange.location - strSearchKey.count
                        self.txtView.text = self.txtView.text.replacingOccurrences(of: strSearchKey, with: "")
                         self.txtView.insertText("@\(strName) ")
    
                    }
                    
                }) {
                    
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        outerView.layer.cornerRadius = 8.0
        outerView.layer.borderColor = UIColor.white.cgColor
        outerView.layer.borderWidth = 1
        outerView.layer.masksToBounds = true
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.borderWidth = 2.0
        imgProfile.layer.borderColor = UIColor.white.cgColor
        
        txtView.delegate = self
        isProfileList = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func sgmChagneValue(_ sender: Any) {
        self.isProfileList = !isProfileList
    }
    
    @IBAction func btnDoneClick(_ sender: Any) {
        txtView.resignFirstResponder()
    }
   
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        MyDropDown.shared.SearchMentionsTextFieldShowChagne(text: text, strFullString: textView.text ?? "")
        return true
    }
}
