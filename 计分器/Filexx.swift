//
//  Filexx.swift
//  计分器
//
//  Created by 乐乐 on 16/5/25.
//  Copyright © 2016年 乐乐. All rights reserved.
//

import UIKit
class Filexx: UIViewController {
    
    @IBOutlet var jia: UITextField!
    @IBOutlet var yi: UITextField!
    var db:SQLiteDB!
    
    // @IBOutlet var txtUname: UITextField!
    // @IBOutlet var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists xx_user(uid integer primary key,jia varchar(20),yi varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    //点击保存
    @IBAction func bc(sender: AnyObject) {
        saveUser()
    }
    //保存数据到SQLite
        func saveUser() {
        let jia = self.jia.text!
        let yi = self.yi.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into xx_user(jia,yi) values('\(jia)','\(yi)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

    
    
}

