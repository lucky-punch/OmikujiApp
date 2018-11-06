//
//  ViewController.swift
//  OmikujiApp
//
//  Created by nowall on 2018/11/03.
//  Copyright © 2018 鈴木貴大. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var stickView: UIView!
    @IBOutlet weak var stickLabel: UILabel!
    @IBOutlet weak var stickHeight: NSLayoutConstraint!
    @IBOutlet weak var stickBottommargin: NSLayoutConstraint!
    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var bigLabel: UILabel!
    
    let resultTexts: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶",
        "神",
        "鬼",
        "死神",
        "クソムシ",
        "幸男",
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //シェイクモーション以外では動作させない
        if motion != UIEvent.EventSubtype.motionShake || overView.isHidden == false {
            return
        }
        
        let resultNum = Int(arc4random_uniform(UInt32(resultTexts.count)))
        stickLabel.text = resultTexts[resultNum]
        stickBottommargin.constant = stickHeight.constant * -1
        
        
        UIView.animate(withDuration: 3, animations: {
          self.view.layoutIfNeeded()
        }, completion: {(finished: Bool) in
            self.bigLabel.text = self.stickLabel.text
            self.overView.isHidden = false
        })
    }

    
    @IBAction func tapRetryButton(_ sender: Any) {
        overView.isHidden = true
        stickBottommargin.constant = 0
    }
    
    
}

