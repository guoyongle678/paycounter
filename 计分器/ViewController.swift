//
//  ViewController.swift
//  计分器
//
//  Created by 乐乐 on 16/4/18.
//  Copyright © 2016年 乐乐. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    //参赛队伍
    
    @IBOutlet var jia: UILabel!
    
    @IBOutlet var yi: UILabel!
    //倒计时00：00
    var time :NSTimer!
    var _tame:Int = 720
    var stop :NSTimer!
    @IBOutlet var timel: UILabel!
    
    
    //甲队得分
    @IBOutlet var jiaduidefen: UILabel!
    var x:Int = 0;
    var z:Int = 0;
    @IBAction func jiayy(sender: UIButton) {
        x++
        z=1
        saveUser(z)
        jiaduidefen.text = "\(x)";
    }
    @IBAction func jiajia2(sender: UIButton) {
        x=x+2
        z=2
        saveUser(z)
        jiaduidefen.text = "\(x)";
    }
    @IBAction func jiajia3(sender: UIButton) {
        x=x+3
        z=3
        saveUser(z)
        jiaduidefen.text = "\(x)";
    }

 
    @IBOutlet var yiduidefen: UILabel!
    var y:Int = 0;
    @IBAction func yidui1(sender: UIButton) {
        y=y+1
        z=1
        saveQiudui(z)
        yiduidefen.text = "\(y)";
    }
    @IBAction func yidui2(sender: UIButton) {
        y=y+2
        z=2
        saveQiudui(z)
        yiduidefen.text = "\(y)";
    }
    @IBAction func yidui3(sender: UIButton) {
        y=y+3
        z=3
        saveQiudui(z)
        yiduidefen.text = "\(y)";
    }
    //重新计分让甲乙队比分为0
    @IBAction func cxjf(sender: UIButton) {
        yiduidefen.text = "\(0)"
        jiaduidefen.text = "\(0)"
        x=0
        y=0
    }
    //开始计时按钮
    @IBAction func star(sender: AnyObject) {
        time = NSTimer.scheduledTimerWithTimeInterval(1, target:self,selector: Selector("tickDOWn"),userInfo: nil,repeats: true)
    }
    //暂停计时按钮
    @IBAction func stop(sender: AnyObject) {
        time.invalidate()
    }
    func tickDOWn()
    {
        _tame -= 1
        let sec = _tame%60
        let min = _tame/60
        timel.text = String(min)+":"+String(sec)
        if(_tame == 0){
            time.invalidate()
        }
    }
    
    
    
    
    
    
    
    var db:SQLiteDB!
    
   // @IBOutlet var txtUname: UITextField!
   // @IBOutlet var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
    db.execute("create table if not exists t_qiudui(uid integer primary key,jname varchar(20),yname varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func bc(sender: AnyObject) {
        //saveUser()
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
