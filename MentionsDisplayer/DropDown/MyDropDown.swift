//
//  MyDropDown.swift
//  Recruitd
//
//  Created by macmini on 04/05/18.
//  Copyright © 2018 Recritd Ltd. All rights reserved.
//

import UIKit

class MyDropDown: NSObject {    
    static let shared = MyDropDown()
    
    lazy var dropMentionUser: DropDown = DropDown()
    var strSearchKey = ""
    var isShowMention : Bool = false    
    var arrResult : [String] = []
    var arrMyProfessional : [String] = ["Ilesh","Daniel","Sachin","Arjun","Riya","Dipeeka","Ajay","Jigar"]
    
    func ConfigureMentionList(viewDropDown:UIView, successBlock: @escaping (_ index:Int,_ arrResult:[String],_ strSearchKey:String) -> Void,dismissBlock: @escaping () -> Void){
        dropMentionUser = DropDown()
        
        dropMentionUser.cellNib = UINib(nibName: "MyCell", bundle: nil)
        dropMentionUser.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? MyCell else { return }
            cell.suffixLabel.text = item
            cell.suffixLabel.textColor = .black
        }
        
        dropMentionUser.cancelAction = { [unowned self] in
            print("Drop down dismissed")
            self.isShowMention = false
            self.strSearchKey = ""
            dismissBlock()
        }
        
        DropDown.ConfigureDropDownforCreatePost(dropdown: dropMentionUser)
        dropMentionUser.selectionAction = { (index, item) in
            successBlock(index,self.arrResult,self.strSearchKey)
            self.isShowMention = false
            self.strSearchKey = ""
        }
        dropMentionUser.anchorView = viewDropDown
        
        //FOR SET ACTUAL POSSITION
        dropMentionUser.direction = .bottom
        dropMentionUser.bottomOffset = CGPoint(x: 0, y:(dropMentionUser.anchorView?.plainView.bounds.height)!)
    }
    
    func ConfigureCoustomMentionList(viewDropDown:UIView, successBlock: @escaping (_ index:Int,_ arrResult:[String],_ strSearchKey:String) -> Void,dismissBlock: @escaping () -> Void) {
        dropMentionUser = DropDown()
        dropMentionUser.cellNib = UINib(nibName: "ProfessionalCell", bundle: nil)
        dropMentionUser.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? ProfessionalCell else { return }
            cell.lblTitle.text = item
            cell.lblSubTitle.text = "@\(item)"
            if index % 2 == 0 {
                cell.imgProfile.image = #imageLiteral(resourceName: "avatar")
            }else{
                cell.imgProfile.image = #imageLiteral(resourceName: "avatar2")
            }
        }
        dropMentionUser.cancelAction = { [unowned self] in
            print("Drop down dismissed")
            self.isShowMention = false
            self.strSearchKey = ""
            dismissBlock()
        }
        
        DropDown.ConfigureDropDownforCreatePost(dropdown: dropMentionUser)
        dropMentionUser.selectionAction = { (index, item) in
            successBlock(index,self.arrResult,self.strSearchKey)
            self.isShowMention = false
            self.strSearchKey = ""
        }
        //FOR SET ACTUAL POSSITION
        dropMentionUser.anchorView = viewDropDown
        dropMentionUser.direction = .bottom
        dropMentionUser.bottomOffset = CGPoint(x: 0, y:(dropMentionUser.anchorView?.plainView.bounds.height)!)
    }
    
    
    func showDropdownWith(strKey:String) -> Void {
        if arrMyProfessional.count > 0 {
            arrResult.removeAll()
            if strKey.count > 0 {
                arrResult = arrMyProfessional.filter({ (aSkill) -> Bool in
                    if aSkill.lowercased().range(of:strKey) != nil {
                        return true
                    }
                    return false
                })
                if arrResult.count == 0 {
                    dropMentionUser.hide()
                }
                print("key : \(strKey): Result:\(arrResult.count)")
            }else{
                arrResult = arrMyProfessional
                print("key : \(strKey): AllResult ")
            }
            
            dropMentionUser.dataSource = arrResult
            //dropDowns.anchorView?.plainView.frame = CGRect(x: 0, y:bodyTextView.frame.origin.y + bodyTextView.frame.size.height, width: UIScreen.main.bounds.size.width, height: (dropDowns.anchorView?.plainView.frame.size.height)!)
            //dropDowns.topOffset = CGPoint(x: 0, y:-(bodyTextView.frame.size.height))
            dropMentionUser.show()
        }
    }
    
    func SearchMentionsTextFieldShowChagne(text:String,strFullString:String) -> Void {
        if strFullString.count == 1 && text == ""{
            dropMentionUser.hide()
        }
        if text == "@" {
            self.isShowMention = true
        }else if text == "" {
            print("delete")
            if !self.strSearchKey.isEmpty {
                self.strSearchKey.removeLast()
            }
            if self.strSearchKey.isEmpty {
                self.isShowMention = false
            }
        }
        if self.isShowMention {
            self.strSearchKey = strSearchKey + text
            self.showDropdownWith(strKey: self.strSearchKey.replacingOccurrences(of: "@", with: ""))
        }
        print("Search :\(self.strSearchKey) AND flag:\(isShowMention)")
    }
    
    
}
