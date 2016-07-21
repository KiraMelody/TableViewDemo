//
//  TableViewController2.swift
//  TableView
//
//  Created by TJQ on 16/7/19.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

let TITLE = "title"
let DESC = "description"
class TableViewController2: UITableViewController {

    private var selectIndexPath: NSIndexPath?
    var sourceData = [ItemClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(TableViewCellPre.self, forCellReuseIdentifier: "TableViewCellPre")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        fetch()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "管理项目";
        let nextItem = UIBarButtonItem(title:"添加",style:.Plain,target:self,action:"AddItem");
        self.navigationItem.rightBarButtonItem = nextItem;
        
        
        
    }
    
    
    // MARK: - Table view data source
    func AddItem()
    {
        self.navigationController!.popViewControllerAnimated(true);
    }
    
    func fetch()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let saved = defaults.objectForKey("item") as? NSData {
            sourceData = NSKeyedUnarchiver.unarchiveObjectWithData(saved) as! [ItemClass]
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sourceData.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellPre", forIndexPath: indexPath) as! TableViewCellPre
        cell.titleLabel.text = sourceData[indexPath.row].getTitle()
        cell.inputLabel.text = sourceData[indexPath.row].getDesc()
        return cell
    }
    

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }

}
