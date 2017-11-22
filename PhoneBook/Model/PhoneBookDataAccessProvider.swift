//
//  PhoneBookDataAccessProvider.swift
//  PhoneBook
//
//  Created by Ade Wija Nugraha on 8/9/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct PhoneBookDataAccessProvider{
    
    private var appDelegate: AppDelegate!
    private var managedObjectContext: NSManagedObjectContext!
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func fetchPhoneBookData() -> [PhoneBookData] {
        let request = PhoneBookData.phoneBookDatafetchRequest()
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        
        do{
            return try managedObjectContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func addPhoneBookData(name: String, phoneNumber: String){
        
        let newPhoneBookData = NSEntityDescription.insertNewObject(forEntityName: "PhoneBookData", into: managedObjectContext) as! PhoneBookData
        
        newPhoneBookData.name = name
        newPhoneBookData.phoneNumber = phoneNumber
        
        do{
            managedObjectContext.insert(newPhoneBookData)
            try managedObjectContext.save()
        } catch {
            //do something
        }
    }
    
    func deletePhoneBookData(index: Int){
        let allData = self.fetchPhoneBookData()
        
        allData.enumerated().forEach { i, element in
            if i == index {
                managedObjectContext.delete(element)
                
                do{
                    try managedObjectContext.save()
                } catch {
                    //do something
                }
            }
        }
    }
    
    func fetchPhoneBookData(withIndex index: Int) -> PhoneBookData? {
        let allData = fetchPhoneBookData()
        if index < 0 || index > allData.count - 1 {
            return nil
        } else {
            return allData[index]
        }
    }
    
    func editPhoneBookData(index: Int, name: String, phoneNumber: String){
        if let data = fetchPhoneBookData(withIndex: index){
            data.name = name
            data.phoneNumber = phoneNumber
            
            do{
            try managedObjectContext.save()
            } catch {
                //do something
            }
        }
    }
}
