//
//  CustomUITextFiled.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit
import SnapKit

class CustomUITextFiled: UIView {
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.text = "Title"
        return label
    }()
    
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next Regular", size: 20)
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.placeholder = "Enter Your Title"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            
            make.top.equalTo(self.label.snp.bottom).offset(5)
            make.leading.equalTo(self.label.snp.leading)
            make.trailing.equalTo(self.label.snp.trailing)
        }
        
        addSubview(underlineView)
        underlineView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            
            make.top.equalTo(self.textField.snp.bottom).offset(5)
            make.leading.equalTo(self.label.snp.leading)
            make.trailing.equalTo(self.label.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(1)
        }
    }
}

extension CustomUITextFiled {
    convenience init(text: String, placeHolder: String? = nil, fontForTitle: UIFont? = nil, fontForDetails: UIFont? = nil) {
        self.init()
        
        label.text = text
        textField.placeholder = placeHolder != nil ? placeHolder : text
        
        if let titleFont = fontForTitle {
            label.font = titleFont
        }
        
        if let detailsFont = fontForDetails {
            textField.font = detailsFont
        }
        
        setupView()
    }
}
