//FILE NAME : bmi_test
//AUTHOR NAME: LOHIT MAHAY
//STUDENT ID: 301093942
//  ViewController.swift
//  bmi_test
//
//  Created by Lohit Mahay on 2019-12-11.
//  Copyright © 2019 Applications. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore



class ViewController: UIViewController {
    
    var dict = [String:AnyObject]()
    var dbase:Firestore?
    
    private var heightnew: Double = 0.0
    private var weightnew: Double = 0.0
    private var bmiresult: Double = 0.0
    private var statusnew = ""

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbase = Firestore.firestore()
        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var status: UILabel!
    
 
    @IBAction func done(_ sender: UIButton) {
        
      
        
    heightnew = Double(height.text!) as! Double
    weightnew = Double(weight.text!) as! Double
        
        bmiresult = (weightnew*703)/(heightnew*heightnew)
        
      
        if(bmiresult < 16 )
        {
            statusnew = "Severe Thinness"
        }
        if(bmiresult > 16 && bmiresult < 17 )
        {
            statusnew = "Moderate Thinness"
        }
        if(bmiresult > 17 && bmiresult < 18.5 )
        {
            statusnew = "Mild Thinness"
        }
        if(bmiresult > 18.5 && bmiresult < 25 )
        {
            statusnew = "Normal"
        }
        if(bmiresult > 25 && bmiresult < 30 )
        {
            statusnew = "OverWeight"
        }
        if(bmiresult > 30 && bmiresult < 35 )
        {
            statusnew = "Obese Class 1"
        }
        if(bmiresult > 35 && bmiresult < 40 )
        {
            statusnew = "Obese Class 2"
        }
        if(bmiresult > 40 )
        {
            statusnew = "Obese Class 3"
        }
        
        result.text = String(bmiresult)
     
        status.text = String(statusnew)
        
        let Id = dbase?.collection("bmi").document().documentID
        
        let parameters = ["name":name.text!,"age":age.text!,"gender":gender.text!,"weight":weight.text!,"height":height.text!,"date": Date(),"bmi": bmiresult,"Id":Id!] as [String : Any]
        
        dbase?.collection("bmi").document(Id!).setData(parameters as [String : Any]){
            err in
            if let error = err{
                print(error.localizedDescription)
                
            }else{
                let alert = UIAlertController(title: "Message", message: "BMI added", preferredStyle: .alert)
                let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    //       self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
}



