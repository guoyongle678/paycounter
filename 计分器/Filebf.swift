//
//  Filebf.swift
//  计分器
//
//  Created by 乐乐 on 16/5/27.
//  Copyright © 2016年 乐乐. All rights reserved.
//

import UIKit
class Filebf: UIViewController {
    

    @IBOutlet var ls2: UITextField!
    @IBOutlet var ls1: UITextField!
    @IBOutlet var jia: UILabel!
    @IBOutlet var yi: UILabel!
    @IBOutlet var jia1: UILabel!
    
    @IBOutlet var jia2: UILabel!
    
    @IBOutlet var jia3: UILabel!
    
    @IBOutlet var jia4: UILabel!
    
    @IBOutlet var yi1: UILabel!
    
    @IBOutlet var yi2: UILabel!
    
    @IBOutlet var yi3: UILabel!
    
    @IBOutlet var yi4: UILabel!
    

    
    
    var db:SQLiteDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        db.execute("create table if not exists t_qiudui(uid integer primary key,jname varchar(20),yname varchar(20))")
        db.execute("create table if not exists t_baocun2(uid integer primary key,jiaduidefen varchar(20),yiduidefen varchar(20))")
        //如果有数据则加载
        initUser()
        initBaocun()
    }
    //比分保存
    func initBaocun() {
        let data = db.query("select * from t_baocun2")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            jia1.text = user["jiaduidefen"] as? String
            yi1.text = user["yiduidefen"] as? String
           
            
        }
    }
    
    //保存数据到SQLite
    func saveBaocun(x:Int) {
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_baocun(mobile) values('\(x)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }

    
    
    
    
    
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from xx_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            jia.text = user["jia"] as? String
            yi.text = user["yi"] as? String

        }
    }
    
    //保存数据到SQLite
    func saveQiudui(x:Int) {
        // let uname = self.jiaduidefen.text!
        // let mobile = self.yiduidefen.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(mobile) values('\(x)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    func saveUser(x:Int) {
        //let uname = self.jiaduidefen.text!
        //let mobile = self.yiduidefen.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname) values('\(x)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}
