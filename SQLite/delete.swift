//
//  ViewController.swift
//  SQLite
//
//  Created by 20141105073 on 16/7/1.
//  Copyright © 2016年 20141105073. All rights reserved.
//

import UIKit

class delete: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        //  initUser()
    }
    
    //点击保存
       
    @IBAction func deletenum(sender: AnyObject) {
        deleteuser()
    }
    func deleteuser(){
        let value=text1.text!
        let sql = "delete from tuser where mobile='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
    @IBAction func deletename(sender: AnyObject) {
        deleteuser1()
    }
    func deleteuser1(){
        let value1=text2.text!
        let sql = "delete from tuser where uname='\(value1)'"
        let result = db.execute(sql)
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}