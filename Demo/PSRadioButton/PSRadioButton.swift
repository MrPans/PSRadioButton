//
//  PSRadioButton.swift
//  PSRadioButton
//
//  Created by Pan on 16/3/18.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

import UIKit

@objc public class PSRadioButton: UIButton {
    
    @IBInspectable public var selectedImage: UIImage? {
        didSet {
            self.setImage(selectedImage, forState: .Selected)
        }
    }
    @IBInspectable public var deselectedImage: UIImage? {
        didSet {
            self.setImage(deselectedImage, forState: .Normal)
        }
    }
    
    override public var selected: Bool {
        didSet {
            if selected {
                action?(self)
            }
        }
    }
    
    private var action: ((PSRadioButton) -> Void)?
    
    // Conveniently creat a set of PSRadioButton which tag = index
    public class func radioButtons(repeatCount repeatCount: Int, selectedImage: UIImage, deselectedImage: UIImage) -> [PSRadioButton] {
        if repeatCount < 0 {
            return [PSRadioButton]()
        }
        var buttons = [PSRadioButton]()
        for i in 0..<repeatCount {
            let radioButton = PSRadioButton()
            radioButton.tag = i;
            radioButton.selectedImage = selectedImage
            radioButton.deselectedImage = deselectedImage
            buttons.append(radioButton)
        }
        return buttons
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        assert(self.buttonType == .Custom, "PSRadioButton:\(self) type is not UIButtonType.Custom /r Please set buttonType to \r UIButtonType.Custom in your Storyboard Or Xib file,otherwise the button appearance will be odd")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(type buttonType: UIButtonType) {
        self.init(frame: CGRectZero)
    }
    
    public convenience init(action: (PSRadioButton) -> Void) {
        self.init(frame: CGRectZero)
        self.action = action
    }
}

@objc public class PSRadioGroup: NSObject {
    
    public weak var delegate: PSRadioGroupDelegate?
    let radioButtons: [PSRadioButton]
    var selectedButton: PSRadioButton?
    
    @objc public init(radioButtons: [PSRadioButton]) {
        self.radioButtons = radioButtons
        super.init()
        
        for button in self.radioButtons {
            button.addTarget(self, action: "touchRadioButton:", forControlEvents: .TouchUpInside)
        }
    }
    
    func touchRadioButton(sender: PSRadioButton) {
        selectedButton?.selected = false
        sender.selected = true;
        selectedButton = sender
        delegate?.radioGroup(self, didSeletedRadioButotn: sender)
    }
    
}

@objc public protocol PSRadioGroupDelegate: NSObjectProtocol {
    func radioGroup(radioGroup: PSRadioGroup, didSeletedRadioButotn radioButton: PSRadioButton)
}