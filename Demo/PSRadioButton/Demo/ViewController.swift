//
//  ViewController.swift
//  PSRadioButton
//
//  Created by Pan on 16/3/17.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PSRadioGroupDelegate {
    
    // MARK: - Var
    
    @IBOutlet var radioButtons: [PSRadioButton]!
    @IBOutlet weak var tipsLabel: UILabel!
    
    var radioGroup: PSRadioGroup!
    let MaleTag = 1
    let FemaleTag = 2
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        radioGroup = PSRadioGroup(radioButtons: radioButtons)
        radioGroup.delegate = self;
    }
    
    // MARK: - PSRadioGroupDelegate
    func radioGroup(radioGroup: PSRadioGroup, didSeletedRadioButotn radioButton: PSRadioButton) {
        if radioButton.tag == MaleTag {
            self.tipsLabel.text = "选择了:男"
        } else if radioButton.tag == FemaleTag {
            self.tipsLabel.text = "选择了:女"
        }
    }

}

