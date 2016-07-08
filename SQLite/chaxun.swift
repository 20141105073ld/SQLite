//
//  ViewController.swift
//  SQLite
//
//  Created by 20141105073 on 16/7/1.
//  Copyright © 2016年 20141105073. All rights reserved.
//

import UIKit

class chaxun: UIViewController {
    
    var db:SQLiteDB!
    
    @IBAction func qingchu(sender: AnyObject) {
        text3.text=""
    }
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from tuser"
        let result = db.execute(sql)
        print(result)
    }
    
    @IBOutlet weak var text3: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),mobile varchar(20)email varchar(20)address varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    @IBAction func selete(sender: AnyObject) {
        selete()
    }
    
    func selete(){
        let data = db.query("select * from tuser")
        for var x=0;x<data.count;x++
        {
            let tuser = data[x]
            text3.text! += "姓名" + String(tuser["uname"]!) + "电话" + String(tuser["mobile"]!) + "邮件" + String(tuser["email"]!) + "地址" + String(tuser["address"]!)+"\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}