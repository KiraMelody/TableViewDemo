//
//  TableViewCell.swift
//  TableView
//
//  Created by TJQ on 16/7/19.
//  Copyright © 2016年 KiraMelody. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate : NSObjectProtocol {
    
    func textDidChange(cell:TableViewCell,textField: UITextField)
    
}

class TableViewCell: UITableViewCell,UITextFieldDelegate {

    var titleLabel: UILabel = UILabel()
    var inputField: UITextField = UITextField()
    var indexPath: NSIndexPath = NSIndexPath()
    weak var delegate:TableViewCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        inputField.delegate = self
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputField.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(titleLabel)
        contentView.addSubview(inputField)

        self.selectionStyle = .None
        let constraintTitleWidth = NSLayoutConstraint(item: titleLabel, attribute: .Width, relatedBy: .Equal, toItem: .None, attribute: .NotAnAttribute, multiplier: 0.0, constant: 100)
        let constraintTitleCenterY = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let constraintTitleLeading = NSLayoutConstraint(item: titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1.0, constant: 10)
        let constraintTitleTrailing = NSLayoutConstraint(item: titleLabel, attribute: .Trailing, relatedBy: .Equal, toItem: inputField, attribute: .Leading, multiplier: 1.0, constant: -10)
        let constraintInputCenterY = NSLayoutConstraint(item: inputField, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let constraintInputTrailing = NSLayoutConstraint(item: inputField, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1.0, constant: -10)

        let constraintArray = [constraintTitleWidth,constraintTitleCenterY,constraintInputCenterY,constraintTitleLeading,constraintTitleTrailing,constraintInputTrailing]
        contentView.addConstraints(constraintArray)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        delegate?.textDidChange(self, textField: textField)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
