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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

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
        return 25
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        /* 这⾥我们请求获取cell中的标记为1000的⼦视图，这个标记就是我们刚才在storyboard中在标签上所设置的。通过这种方法，我们就获取了⼀个到该UILabel标签对象的引⽤。 实际上，通过使⽤tag标记的⽅式来获取到某个视觉元素的引⽤用是⾮常方便的,可以省掉了声明 @IBOutlet变量的步骤。
         */
        let cell_label = cell.viewWithTag(1000) as! UILabel
        
        // 显示 > 5 行, 利用mod5 函数, 求 5 的倍数
        let indexpath_row = mod5(beichushu: indexPath.row, chushu: 5)
        if indexpath_row == 0 {
            cell_label.text = "流浪地球"
        } else if indexpath_row == 1{
            cell_label.text = "疯狂的外星人"
        } else if indexpath_row == 2{
            cell_label.text = "飞驰人生"
        } else if indexpath_row == 3{
            cell_label.text = "喜剧之王"
        }else if indexpath_row == 4{
            cell_label.text = "小猪佩奇过大年"
        }
        //结束以上的新代码段
        return cell
    }
    
    func mod5(beichushu:Int,chushu:Int) -> Int{
        return (beichushu % chushu)
    }
    
    //MARK:- Table View Delegate - change checkbox

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath)
    {
        // checkmark 还是根据cell来渲染,会出现滑动时,checkmark 状态不对的情况
        if let cell = tableView.cellForRow(at: indexPath){
            
            if cell.accessoryType == .none{
                cell.accessoryType = .checkmark
            }
            else{
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
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
