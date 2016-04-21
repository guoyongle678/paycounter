//
//  ViewController.swift
//  计分器
//
//  Created by 乐乐 on 16/4/18.
//  Copyright © 2016年 乐乐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var jia: UILabel!
    var operang: String = ""
    @IBAction func jiayy(sender: UIButton) {
        let value = sender.currentAttributedTitle
        var result = 0.0
        switch operang {
            case "+1":
                result = Double(operang)!
        default:
                result = 0
            
        }
        jia.text = "\(result)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ryn here")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

