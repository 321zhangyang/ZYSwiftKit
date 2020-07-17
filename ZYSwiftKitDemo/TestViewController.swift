//
//  TestViewController.swift
//  ZYSwiftKit
//
//  Created by zhangyang on 2020/7/17.
//  Copyright © 2020 张洋. All rights reserved.
//

import UIKit

class TestViewController: BaseTableViewController {

  lazy var listData : [String] = {
        return []
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupEmpty(scrollView: self.tableView)
        self.setupRefresh(scrollView: self.tableView, options: .defaults);
    }
    override func refreshData(page: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.listData = ["下拉刷新","上拉加载","上拉下拉","无上下拉","ConnectionView"];
            self.endRefresh(more: false);
            self.tableView.reloadData();
    
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count;
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell.cellForTableView(tableView: tableView, indexPath: indexPath);
        cell.textLabel?.text = self.listData[indexPath.row];
        return cell;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let str = self.listData[indexPath.row];
        if str == "ConnectionView"{
           // self.navigationController?.pushViewController(ZYGroupConnectionController(), animated:true)
        }else{
            var options : ZYRefreshOption = .none;
            if str == "下拉刷新" {
                options = ZYRefreshOption(rawValue: ZYRefreshOption.header.rawValue|ZYRefreshOption.autoHeader.rawValue);
            }else if str == "上拉加载"{
                options = ZYRefreshOption(rawValue: ZYRefreshOption.autoFooter.rawValue);
            }else if str == "上拉下拉"{
                options = .defaults;
            }else{
                options = .none;
            }
        UIViewController.rootTopPresentedController().navigationController?.pushViewController(TestTableViewController(options: options), animated: true);
        }
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
