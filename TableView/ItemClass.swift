//
//  ItemClass.swift
//  TableView
//
//  Created by TJQ on 16/7/20.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

class ItemClass: NSObject {
    private var title : String = ""
    private var desc : String = ""
    init(Title:String,Desc:String) {
        title = Title
        desc = Desc
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
