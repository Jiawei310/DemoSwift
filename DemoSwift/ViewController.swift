//
//  ViewController.swift
//  DemoSwift
//
//  Created by ZZ on 2019/8/22.
//  Copyright © 2019 SJW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {[unowned self] in
        let tabV = UITableView();
        return tabV
    }()
    
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.frame = CGRect(origin: self.view.bounds.origin, size: self.view.bounds.size)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView .dequeueReusableCell(withIdentifier: "cellID")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
            
            self.count = self.count + 1
            print("cellCount:\(self.count)")
        }
        cell?.textLabel?.text = "cellIndex\(indexPath.row)"

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

