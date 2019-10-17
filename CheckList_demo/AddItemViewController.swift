//
//  AddItemViewControllerTableViewController.swift
//  CheckList_demo
//
//  Created by 龚晨杰 on 2019/10/16.
//  Copyright © 2019 gongchenjie.com. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {


    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
      
    }
    //MARK: - Actions

    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(){
       //print some contents
//        print("用户输入的信息是： \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Table View Delegate methods
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
}
