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
            setImage(selectedImage, for: .selected)
        }
    }
    @IBInspectable public var deselectedImage: UIImage? {
        didSet {
            setImage(deselectedImage, for: .normal)
        }
    }
    
    override public var isSelected: Bool {
        didSet {
            if isSelected {
                action?(self)
            }
        }
    }
    
    private var action: ((PSRadioButton) -> Void)?
    
    // Conveniently creat a set of PSRadioButton which tag = index
    public class func radioButtons(repeatCount: Int, selectedImage: UIImage, deselectedImage: UIImage) -> [PSRadioButton] {
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
        assert(self.buttonType == .custom, "PSRadioButton:\(self) type is not UIButton.UIButtonType.custom /r Please set buttonType to \r UIButtonType.custom in your Storyboard Or Xib file,otherwise the button appearance will be odd")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(type buttonType: UIButton.ButtonType) {
        self.init(frame: CGRectZero)
    }
    
    public convenience init(action: @escaping (PSRadioButton) -> Void) {
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
            button.addTarget(self, action: #selector(touchRadioButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func touchRadioButton(_ sender: PSRadioButton) {
        selectedButton?.isSelected = false
        sender.isSelected = true;
        selectedButton = sender
        delegate?.radioGroup(self, didSelected: sender)
    }
    
}

@objc public protocol PSRadioGroupDelegate: NSObjectProtocol {
    func radioGroup(_ radioGroup: PSRadioGroup, didSelected radioButton: PSRadioButton)
}
