//
//  AddContactTableViewController.swift
//  PhoneBook
//
//  Created by Ade Wija Nugraha on 8/9/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import UIKit

class AddContactTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    let dap = PhoneBookDataAccessProvider()
    
    var phoneBookDataIndex = -1
    
    var editingType : EditingContactDataType = .add
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard
            let name = nameTextField.text,
            let phoneNumber = phoneNumberTextField.text else {
                return
        }
        
        if editingType == .add {
            dap.addPhoneBookData(name: name, phoneNumber: phoneNumber)
        } else if editingType == .edit {
            dap.editPhoneBookData(index: phoneBookDataIndex, name: name, phoneNumber: phoneNumber)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if editingType == .add {
            self.title = "Add"
        } else if editingType == .edit {
            self.title = "Edit"
            
            if let dataToBeEdited = dap.fetchPhoneBookData(withIndex: phoneBookDataIndex){
                self.nameTextField.text = dataToBeEdited.name
                self.phoneNumberTextField.text = dataToBeEdited.phoneNumber
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
}
