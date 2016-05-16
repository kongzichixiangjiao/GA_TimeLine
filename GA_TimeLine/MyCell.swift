//
//  MyCell.swift
//  GA_TimeLine
//
//  Created by houjianan on 16/5/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        myView.backgroundColor = highlighted == true ? UIColor.redColor() : UIColor.greenColor()
    }
}

