//
//  ViewController.swift
//  Putting Helper
//
//  Created by Ben on 8/28/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit
import GRDB

class ViewController: UIViewController {

    @IBOutlet var puttSkill: UITextField!
    
    @IBOutlet var length: UITextField!
    
    @IBOutlet var riseFall: UITextField!
   
    @IBOutlet var slope: UITextField!
    
    @IBOutlet var puttCalc: UIButton!
   
    @IBOutlet var outPutPutts: UITextField!
    
    @IBAction func generatePutts(_ sender: Any) {
        
        UserDefaults.standard.set(Int(puttSkill.text ?? ""), forKey: "PuttSkill")
        
        let dbQueue = try! DatabaseQueue(path: "mydatabase.db")
    
        try! dbQueue.read { db in
            if let row = try Row.fetchOne(db, "SELECT * FROM PuttDataTbl", arguments: [1]) {
                let color: Int = row["One"]
                print(color)
                
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        puttSkill.text = "\(UserDefaults.standard.integer(forKey: "PuttSkill"))"

    }


}

