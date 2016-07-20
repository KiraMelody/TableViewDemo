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

    var text=["Title","Description"]
    private var selectIndexPath: NSIndexPath?
    private var titleName:String = "无";
    private var Desc:String = "无";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(TableViewCellPre.self, forCellReuseIdentifier: "TableViewCellPre")
        self.tableView.dataSource = self
        self.tableView.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "管理项目";
        let nextItem = UIBarButtonItem(title:"添加",style:.Plain,target:self,action:"AddItem");
        self.navigationItem.rightBarButtonItem = nextItem;
    }

    func tansfer (item: ItemClass)
    {
        titleName = item.getTitle()
        Desc = item.getDesc()
    }
    
    
    // MARK: - Table view data source
    func AddItem()
    {
        self.navigationController!.popViewControllerAnimated(true);
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellPre", forIndexPath: indexPath) as! TableViewCellPre
        cell.titleLabel.text = text[indexPath.row]
        switch indexPath.row
        {
        case 0: cell.titleLabel.font = UIFont.systemFontOfSize(30)
        cell.inputLabel.text = titleName
        case 1: cell.inputLabel.text = Desc
        default:break
        }
        return cell
    }
    

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }

}
