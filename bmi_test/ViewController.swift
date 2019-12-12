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

private var heightnew: Double = 0.0
private var weightnew: Double = 0.0
private var bmiresult: Double = 0.0
private var statusnew = ""
class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
   
    
    
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

