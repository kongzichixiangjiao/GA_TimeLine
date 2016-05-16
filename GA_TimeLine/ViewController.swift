//
//  ViewController.swift
//  GA_TimeLine
//
//  Created by houjianan on 16/5/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var topLine: UIView!
    var bottomLine: UIView!
    var leadingSpacingOfLines: CGFloat!
    var bottomLineHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.tableFooterView = UIView()
        //创建两个view添加到vc的view上。
        topLine = UIView()
        bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.redColor()
        view.addSubview(topLine)
        view.addSubview(bottomLine)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //自定义Cell，最好用Xib创建。
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! MyCell
        return cell
    }
    //***
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let tempCell = cell as? MyCell {
            topLine.backgroundColor = tempCell.topLine.backgroundColor
            //通过方法convertPoint获取到cell中topLine距离左边距是多少
            leadingSpacingOfLines = cell.convertPoint(tempCell.topLine.frame.origin, fromView: view).x
            //获取bottomLine的高度
            bottomLineHeight = tempCell.bottomLine.frame.size.height
        }
        scrollViewDidScroll(tableView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let y = scrollView.frame.height - scrollView.contentSize.height + scrollView.contentOffset.y
        print(scrollView.frame.height)
        print(scrollView.contentSize.height)
        print(scrollView.contentOffset.y)
        print(y)
        topLine.frame = CGRectMake(leadingSpacingOfLines, 0, 1, -scrollView.contentOffset.y)
        bottomLine.frame = CGRectMake(leadingSpacingOfLines, view.frame.height - y - bottomLineHeight, 1, view.frame.height)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}

