//
//  ViewController.swift
//  AddUpdateEmployee
//
//  Created by Meet Patel on 25/Aug/18.
//  Copyright © 2018 Meet Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblEmployeeData: UITableView!
    
    var index:String = "0"
    var updateindex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let objrightbarbutton:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(ViewController.btnadd))
        self.navigationItem.rightBarButtonItem = objrightbarbutton
        
        tblEmployeeData.delegate = self
        tblEmployeeData.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblEmployeeData.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnadd() {
         index = "0"
        addupdateemploee(withaddupdatedata: index)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DictAddEmployee.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:UpdateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell") as? UpdateTableViewCell {
            let value:[String:String] = DictAddEmployee[indexPath.row]
            cell.txtfieldfname.text = value["fname"]!
            cell.txtfieldlname.text = value["lname"]!
            cell.txtfielddesignation.text = value["designation"]!
            return cell
        }
        return UITableViewCell.init(style: .default, reuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = "1"
        updateindex = indexPath.row
        addupdateemploee(withaddupdatedata: index)
    }
    
    func addupdateemploee (withaddupdatedata addupdatedata:String) {
        let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let secondcontroller:SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondcontroller.update = addupdatedata
            secondcontroller.updateindex = updateindex
            self.navigationController?.pushViewController(secondcontroller, animated: true)
        }
    }
}

