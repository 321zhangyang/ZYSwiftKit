//
//  TestTableViewController.swift
//  ZYSwiftKit
//
//  Created by zhangyang on 2020/7/17.
//  Copyright © 2020 张洋. All rights reserved.
//

import UIKit

class TestTableViewController: BaseTableViewController {

   
      convenience init(options:ZYRefreshOption) {
             self.init();
             self.options = options;
         }
         var options : ZYRefreshOption = .none;
         lazy var listData : [TestGroupModel] = {
             return []
         }()
      
      
      override func viewDidLoad() {
          super.viewDidLoad()

          self.showNavTitle(title: "测试页面")
          
          self.setupEmpty(scrollView: self.tableView)
        
          
          self.setupRefresh(scrollView: self.tableView, options: self.options)
          // Do any additional setup after loading the view.
      }
      
      override func refreshData(page: Int) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {//看清楚动画
              
                           for i in 1...30 {
                               print(i)
                               let model = TestGroupModel.init()
                               model.title = String(i)
                              self.listData.append(model)
      
                               self.tableView.reloadData()
                           }
                           self.endRefresh(more: true)
                     }
    
      }
      
      override func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return listData.count
      }
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell : UITableViewCell = UITableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath)
          let model = listData[indexPath.row]
          cell.textLabel?.text = model.title
          return cell
      }
      
      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 44
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
