//
//  ItemClass.swift
//  TableView
//
//  Created by TJQ on 16/7/20.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class ItemClass: NSObject,NSCoding {
    private var title : String = ""
    private var desc : String = ""
    
    init(Title:String,Desc:String) {
        title = Title
        desc = Desc
    }
    
    required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey("title") as! String
        desc = aDecoder.decodeObjectForKey("desc") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(desc, forKey: "desc")
    }

    func getTitle () -> String
    {
        return title
    }
    func getDesc () ->String
    {
        return desc
    }
}
