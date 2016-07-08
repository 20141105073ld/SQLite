//
//  ViewController.swift
//  SQLite
//
//  Created by 20141105073 on 16/7/1.
//  Copyright © 2016年 20141105073. All rights reserved.
//

import UIKit

class chazhao: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var textf: UITextField!
    @IBOutlet weak var textf1: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),mobile varchar(20)email varchar(20)address varchar(20))")
        //如果有数据则加载
        // initUser()
    }
    
    @IBAction func seletf(sender: AnyObject) {
        sf()
    }
    func sf(){
        textf1.text=""
        let a=textf.text!
        let data = db.query("select * from tuser where uname='\(a)'")
        for (var i=0;i<data.count;i++)
        {
            let user = data[i]
            textf1.text!+="姓名："+String(user["uname"]!)+"电话："+String(user["mobile"]!)+"邮件："+String(user["email"]!)+"地址："+String(user["address"]!)+"\n"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}