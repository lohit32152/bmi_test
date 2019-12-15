//
//  BMITableViewController.swift
//  bmi_test
//
//  Created by Lohit Mahay on 2019-12-14.
//  Copyright © 2019 Applications. All rights reserved.
//

import UIKit
import Firebase

class BMITableViewController:  UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dbase:Firestore?
    
    var dictionary = [[String:AnyObject]]()
    var indexDict = [String:AnyObject]()
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveData()
        
    

 
    }
    func retrieveData(){
        
        dbase = Firestore.firestore()
        dbase?.collection("bmi").getDocuments(completion: { (snap, err) in
            
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
            self.table.reloadData()
            
        })
        
    }

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return dictionary.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
  /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = dictionary[indexPath.row]
        print("index",index)
        
        // assigning name of task to table cell
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = index["weight"] as? String
        }
        // assigning age of task to table cell
        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = index["age"] as? String
        }
        
        return cell
        
    }
    
    
   
}
