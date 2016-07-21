//
//  TableViewController1.swift
//  TableView
//
//  Created by TJQ on 16/7/19.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate: NSObjectProtocol{
    
    func fetchData(item: ItemClass)
}

class TableViewController1: UITableViewController,TableViewCellDelegate {
    
    var text=["Title","Description"]
    weak var delegate: TableViewControllerDelegate?
    
    var TitleName:String = ""
    var Desc:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "添加项目";
        let nextItem = UIBarButtonItem(title:"确定",style:.Plain,target:self,action:"GoBack");
        self.navigationItem.rightBarButtonItem = nextItem;
    }

    // MARK: - Table view data source
    func GoBack()
    {
        tableView.endEditing(true)
        let Anothervc = TableViewController2();
        let item = ItemClass(Title: TitleName,Desc: Desc)
        fetch(item)
        self.navigationController!.pushViewController(Anothervc,animated:true);
    }
    
    func fetch(item: ItemClass)
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let saved = defaults.objectForKey("item") as? NSData {
            var data = NSKeyedUnarchiver.unarchiveObjectWithData(saved) as? [ItemClass] ?? [ItemClass]()
            data.append(item)
            let savedData = NSKeyedArchiver.archivedDataWithRootObject(data)
            defaults.setObject(savedData, forKey: "item")
        }
        else
        {
            var data = [ItemClass]()
            data.append(item)
            let savedData = NSKeyedArchiver.archivedDataWithRootObject(data)
            defaults.setObject(savedData, forKey: "item")
            defaults.synchronize()
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        cell.titleLabel.text = text[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        switch indexPath.row
        {
        case 0: cell.titleLabel.font = UIFont.systemFontOfSize(30)
                cell.inputField.placeholder = "请输入标题"
        case 1: cell.inputField.placeholder = "请输入描述"
        default:break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView?
        footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        footerView?.backgroundColor = UIColor.whiteColor()
        
        let userButton = UIButton(type: UIButtonType.System)
        userButton.setTitle("Button", forState: UIControlState.Normal)
        userButton.frame = CGRectMake(0, 0, 100, 50)
        userButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView?.addSubview(userButton)
        userButton.translatesAutoresizingMaskIntoConstraints = false
        let constraintButtonCenterX = NSLayoutConstraint(item: userButton, attribute: .CenterX, relatedBy: .Equal, toItem: footerView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let constraintButtonCenterY = NSLayoutConstraint(item: userButton, attribute: .CenterY, relatedBy: .Equal, toItem: footerView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        footerView?.addConstraints([constraintButtonCenterX,constraintButtonCenterY])
        
        return footerView
    }
    
    func buttonTouched(sender:UIButton!)
    {
        print("click")
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        //记录当前点击的IndexPath
//        self.selectIndexPath = indexPath
//        
//        //获取当前点击的Cell对象
//        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
//        
//        //从storyboard中实例化编辑视图控制器
//        //let editViewController:EditViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
//        
//        //指定编辑视图控制器委托代理对象
//        TableViewController1.delegate = self
//        
//        //把点击Cell上的值传递给编辑视图控制器
//        if cell != nil {
//            TableViewController1.Title = cell.TitleField.text!
//        }
//        
//        //push到编辑视图控制器
//        self.navigationController?.pushViewController(editViewController, animated: true)
//    }
    
    func textDidChange(cell: TableViewCell, textField: UITextField) {
        switch cell.indexPath.row
        {
        case 0:TitleName = textField.text!
        case 1:Desc = textField.text!
        default: break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
