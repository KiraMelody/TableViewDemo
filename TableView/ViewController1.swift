//
//  ViewController1.swift
//  TableView
//
//  Created by TJQ on 16/7/19.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class ViewController1: UITableViewController {

    var text = ["Title: ","Description: "]
    var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "TableViewCell")
        view.backgroundColor = UIColor.whiteColor()
        tableview = UITableView(frame: self.view.frame)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.titleLabel.text = text[indexPath.row]
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

