//
//  ChecklistViewController.swift
//  CheckList_demo
//
//  Created by gongchenjie2 on 2019/10/13.
//  Copyright © 2019 gongchenjie.com. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.backItem?.title = "GO"
//        navigationController?.navigationBar.prefersLargeTitles = true

        item_initisal()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //MARK:- Checkbox 初始化
    var row0checked = true
    var row1checked = false
    var row2checked = true
    var row3checked = true
    var row4checked = false
    
    
    
    // MARK: - Table view data source - number of line/section
    
    /* 数据源方法的作用是:
     当某一行变得可见时，向表视图提供一个新的（或是回收的）cell对象。
     我们不能,也不需要,手动调用该方法.
     因为UITableView会自己调用它的数据源方法
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        /* 这⾥我们请求获取cell中的标记为1000的⼦视图，这个标记就是我们刚才在storyboard中在标签上所设置的。通过这种方法，我们就获取了⼀个到该UILabel标签对象的引⽤。 实际上，通过使⽤tag标记的⽅式来获取到某个视觉元素的引⽤用是⾮常方便的,可以省掉了声明 @IBOutlet变量的步骤。
         */

        let item = items[indexPath.row]
        // 显示 > 5 行, 利用mod5 函数, 求 5 的倍数
//        let indexpath_row = mod5(beichushu: indexPath.row, chushu: 5)
        upgradeView_Text(for:cell, with:item)

        //结束以上的新代码段
        upgradeView_Checkmark(for:cell, with:item )

        return cell
    }
    
//    func mod5(beichushu:Int,chushu:Int) -> Int{
//        return (beichushu % chushu)
//    }
    
    // 事件 : 点击某一行
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            upgradeView_Checkmark(for:cell, with:item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // 滑动删除 : 某一行
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //1 - 更新model,不仅从数组中删除了这个ChecklistItem对象，实际上也永久将其销毁了。
        
        items.remove(at: indexPath.row)
        
        //2 - 更新View
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    //MARK:- Function : upgrade the view for THE CHECKMARK
    func upgradeView_Checkmark(for cell: UITableViewCell, with item :ChecklistItem){
        
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    func upgradeView_Text(for cell: UITableViewCell, with item: ChecklistItem){
        let cell_label = cell.viewWithTag(1000) as! UILabel
        cell_label.text = item.text
    }
    
    //MARK: - Actions
    @IBAction func addItem(){
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "我是新添加的一行内容"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths , with: .automatic)
    }
    
    func item_initisal(){
        // Do any additional setup after loading the view, typically from a nib.
        let item1 = ChecklistItem()
        item1.text = "重温德容为加盟巴萨寄出投名状"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "A股暴涨，赶紧去开个科创板的新户"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "两会召开中，关注每天的新闻动态"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "学习神奇的AI视频变脸技术"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "为参加6月的WWDC提前做好准备"
        items.append(item5)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
