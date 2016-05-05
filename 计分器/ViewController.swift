//
//  ViewController.swift
//  计分器
//
//  Created by 乐乐 on 16/4/18.
//  Copyright © 2016年 乐乐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var jiaduidefen: UILabel!
    var operand1: String = ""
        @IBAction func jiayy(sender: UIButton) {
        
        switch operand1{
            case "+1":
            result = Double(operand1)! + Double(operand1)!
            
        }
        
    }
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

