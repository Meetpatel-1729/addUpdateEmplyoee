//
//  SecondViewController.swift
//  AddUpdateEmployee
//
//  Created by Meet Patel on 25/Aug/18.
//  Copyright © 2018 Meet Patel. All rights reserved.
//

import UIKit
var DictAddEmployee:[[String:String]] = []

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
    @IBOutlet weak var tblAddEmployee: UITableView!
    
    var updateindex:Int = 0
    var update:String = ""
    
    var dictinfo:[String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(update)
        self.title = "Add Employee"
        tblAddEmployee.delegate = self
        tblAddEmployee.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (update == "0")
        {
        if indexPath.row < 11
        {
            if let cell:AddEmployeeViewCell = tableView.dequeueReusableCell(withIdentifier: "AddEmployeeViewCell") as? AddEmployeeViewCell
            {
                cell.txtfieldValue.delegate = self
                cell.txtfieldValue.autocorrectionType = .no
                
                if (indexPath.row == 0) {
                    cell.txtfieldId.text = "ID"
                    cell.txtfieldValue.isEnabled = false
                    cell.txtfieldValue.tag = 1000
                    cell.txtfieldValue.text = "\(DictAddEmployee.count + 1)"
                }
                else if(indexPath.row == 1) {
                    cell.txtfieldId.text = "First Name"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1001
                    cell.txtfieldValue.text = dictinfo["fname"]
                    cell.txtfieldValue.becomeFirstResponder()
                }
                else if(indexPath.row == 2) {
                    cell.txtfieldId.text = "Last Name"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1002
                    cell.txtfieldValue.text = dictinfo["lname"]
                }
                else if(indexPath.row == 3) {
                    cell.txtfieldId.text = "City"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1003
                    cell.txtfieldValue.text = dictinfo["city"]
                }
                else if(indexPath.row == 4) {
                    cell.txtfieldId.text = "State"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1004
                    cell.txtfieldValue.text = dictinfo["state"]
                }
                else if(indexPath.row == 5) {
                    cell.txtfieldId.text = "Country"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1005
                    cell.txtfieldValue.text = dictinfo["country"]
                }
                else if(indexPath.row == 6) {
                    cell.txtfieldId.text = "Blood Group"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1006
                    cell.txtfieldValue.text = dictinfo["bloodgroup"]
                }
                else if(indexPath.row == 7) {
                    cell.txtfieldId.text = "Mobile Number"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1007
                    cell.txtfieldValue.text = dictinfo["mobileno"]
                }
                else if(indexPath.row == 8) {
                    cell.txtfieldId.text = "Home Number"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1008
                    cell.txtfieldValue.text = dictinfo["homeno"]
                }
                else if(indexPath.row == 9) {
                    cell.txtfieldId.text = "Designation"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1009
                    cell.txtfieldValue.text = dictinfo["designation"]
                }
                else if(indexPath.row == 10) {
                    cell.txtfieldId.text = "About"
                    cell.txtfieldValue.isEnabled = true
                    cell.txtfieldValue.tag = 1010
                    cell.txtfieldValue.text = dictinfo["about"]
                }
                return cell
            }
        }
            else
            {
                if let cell:AddEmployeeViewCell = tableView.dequeueReusableCell(withIdentifier: "AddUpdateEmployeeCell") as? AddEmployeeViewCell {
                    cell.btnaddemployee.setTitle("Add", for: .normal)
                    cell.btnaddemployee.addTarget(self, action: #selector(addemployee), for: UIControl.Event.touchUpInside)
                    return cell
                }
            }
        }
        
        else {
            if indexPath.row < 11 {
                let value:[String:String] = DictAddEmployee[updateindex]
                if let cell:AddEmployeeViewCell = tableView.dequeueReusableCell(withIdentifier: "AddEmployeeViewCell") as? AddEmployeeViewCell {
                    
                    cell.txtfieldValue.delegate = self
                    if (indexPath.row == 0) {
                        cell.txtfieldId.text = "ID"
                        cell.txtfieldValue.isEnabled = false
                        cell.txtfieldValue.tag = 1000
                        cell.txtfieldValue.text = value["id"]
                    }
                    else if(indexPath.row == 1) {
                        cell.txtfieldId.text = "First Name"
                        cell.txtfieldValue.tag = 1001
                        cell.txtfieldValue.text = value["fname"]
                    }
                    else if(indexPath.row == 2) {
                        cell.txtfieldId.text = "Last Name"
                        cell.txtfieldValue.tag = 1002
                        cell.txtfieldValue.text = value["lname"]
                    }
                    else if(indexPath.row == 3) {
                        cell.txtfieldId.text = "City"
                        cell.txtfieldValue.tag = 1003
                        cell.txtfieldValue.text = value["city"]
                    }
                    else if(indexPath.row == 4) {
                        cell.txtfieldId.text = "State"
                        cell.txtfieldValue.tag = 1004
                        cell.txtfieldValue.text = value["state"]
                    }
                    else if(indexPath.row == 5) {
                        cell.txtfieldId.text = "Country"
                        cell.txtfieldValue.tag = 1005
                        cell.txtfieldValue.text = value["country"]
                    }
                    else if(indexPath.row == 6) {
                        cell.txtfieldId.text = "Blood Group"
                        cell.txtfieldValue.tag = 1006
                        cell.txtfieldValue.text = value["bloodgroup"]
                    }
                    else if(indexPath.row == 7) {
                        cell.txtfieldId.text = "Mobile Number"
                        cell.txtfieldValue.tag = 1007
                        cell.txtfieldValue.text = value["mobileno"]
                    }
                    else if(indexPath.row == 8) {
                        cell.txtfieldId.text = "Home Number"
                        cell.txtfieldValue.tag = 1008
                        cell.txtfieldValue.text = value["homeno"]
                    }
                    else if(indexPath.row == 9) {
                        cell.txtfieldId.text = "Designation"
                        cell.txtfieldValue.tag = 1009
                        cell.txtfieldValue.text = value["designation"]
                    }
                    else if(indexPath.row == 10) {
                        cell.txtfieldId.text = "About"
                        cell.txtfieldValue.tag = 1010
                        cell.txtfieldValue.text = value["about"]
                    }
                    return cell
                }
                }
            
            
            else{
                if let cell:AddEmployeeViewCell = tableView.dequeueReusableCell(withIdentifier: "AddUpdateEmployeeCell") as? AddEmployeeViewCell {
                    cell.btnaddemployee.setTitle("Update", for: UIControl.State.normal)
                    cell.btnaddemployee.addTarget(self, action: #selector(addemployee), for: UIControl.Event.touchUpInside)
                    return cell
                }
            }
        }
        return UITableViewCell.init(style: .default, reuseIdentifier: "cell")
    }
    
    @IBAction func addemployee() {
        self.view.endEditing(true)
        
        if (update == "0") {
            DictAddEmployee.append(dictinfo)
        }
        else {
            DictAddEmployee.remove(at: Int(dictinfo["id"]!)! - 1)
            DictAddEmployee.insert(dictinfo, at: Int(dictinfo["id"]!)! - 1)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" {
            return true
        }
       
        let objCharacterSet = CharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ' abcdefghijklmnopqrstuvwxyz")
        let objNumberSet = CharacterSet.init(charactersIn: "0123456789(+-)")
        let objCountrySet = CharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ- abcdefghijklmnopqrstuvwxyz")
        let objBloodgroupSet = CharacterSet.init(charactersIn: "ABOabo+-")
        let objDesignationSet = CharacterSet.init(charactersIn: "ABCDEFGGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz")
        let objAboutSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyz,ABCDEFGHIJKLMNOPQRSTUVWXYZ 01234567890 !@#$%^&*()-=_+[]{};':")
        
        if ((textField.tag == 1001) || (textField.tag == 1002) || (textField.tag == 1003) || (textField.tag == 1004)) {
            if string.rangeOfCharacter(from: objCharacterSet) != nil {
                return true
            }
            else {
                return false
            }
        }
        
        else if ((textField.tag == 1007) || (textField.tag == 1008)) {
            if string.rangeOfCharacter(from: objNumberSet) != nil {
                return true
            }
            else {
                return false
            }
        }
        
        else if (textField.tag == 1005) {
            if string.rangeOfCharacter(from: objCountrySet) != nil {
                return true
            }
            else {
                return false
            }
        }
        
        else if (textField.tag == 1006) {
            if string.rangeOfCharacter(from: objBloodgroupSet) != nil {
                return true
            }
            else {
                return false
            }
        }
        
        else if (textField.tag == 1009) {
            if string.rangeOfCharacter(from: objDesignationSet) != nil {
                return true
            }
            else {
                return false
            }
        }
        
        else if (textField.tag == 1010) {
            if string.rangeOfCharacter(from: objAboutSet) != nil {
                return true
            }
        }
          return false
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text?.count == 0) {
            return false
        }
            
        else {
            if textField.tag == 1001  {
                dictinfo["fname"] = textField.text!
            }
            else if textField.tag == 1002  {
                dictinfo["lname"] = textField.text!
            }
            else if textField.tag == 1003  {
                dictinfo["city"] = textField.text!
            }
            else if textField.tag == 1004  {
                dictinfo["state"] = textField.text!
            }
            else if textField.tag == 1005  {
                dictinfo["country"] = textField.text!
            }
            else if textField.tag == 1006  {
                dictinfo["bloodgroup"] = textField.text!
            }
            else if textField.tag == 1007  {
                dictinfo["mobileno"] = textField.text!
            }
            else if textField.tag == 1008  {
                dictinfo["homeno"] = textField.text!
            }
            else if textField.tag == 1009  {
                dictinfo["designation"] = textField.text!
            }
            else if textField.tag == 1010  {
                dictinfo["about"] = textField.text!
            }
            return true
          }
       }
   }
