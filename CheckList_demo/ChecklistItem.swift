//
//  ChecklistItem.swift
//  CheckList_demo
//
//  Created by 龚晨杰 on 2019/10/15.
//  Copyright © 2019 gongchenjie.com. All rights reserved.
//

import Foundation


class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        self.checked = !self.checked
    }
    
}

var items = [ChecklistItem]()

// 以下代码 : 放在ChecklistViewController 里面也可以
//func item_initisal(){
//    // Do any additional setup after loading the view, typically from a nib.
//    let item1 = ChecklistItem()
//    item1.text = "重温德容为加盟巴萨寄出投名状"
//    items.append(item1)
//
//    let item2 = ChecklistItem()
//    item2.text = "A股暴涨，赶紧去开个科创板的新户"
//    item2.checked = true
//    items.append(item2)
//
//    let item3 = ChecklistItem()
//    item3.text = "两会召开中，关注每天的新闻动态"
//    item3.checked = true
//    items.append(item3)
//
//    let item4 = ChecklistItem()
//    item4.text = "学习神奇的AI视频变脸技术"
//    items.append(item4)
//
//    let item5 = ChecklistItem()
//    item5.text = "为参加6月的WWDC提前做好准备"
//    items.append(item5)
//}
