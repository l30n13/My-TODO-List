//
//  CustomUITextView.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit
import SnapKit

class CustomUITextView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.text = "Title"
        return label
    }()
    
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Avenir Next Regular", size: 20)
        textView.backgroundColor = .clear
        textView.text = "Enter Your Details"
        textView.delegate = self
        textView.textColor = .lightGray
        return textView
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
        
        addSubview(textView)
        textView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            
            make.top.equalTo(self.label.snp.bottom).offset(5)
            make.leading.equalTo(self.label.snp.leading)
            make.trailing.equalTo(self.label.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}

extension CustomUITextView {
    convenience init(text: String, placeHolder: String? = nil, fontForTitle: UIFont? = nil, fontForDetails: UIFont? = nil) {
        self.init()
        
        label.text = text
        textView.text = placeHolder != nil ? placeHolder : text
        
        if let titleFont = fontForTitle {
            label.font = titleFont
        }
        
        if let detailsFont = fontForDetails {
            textView.font = detailsFont
        }
        
        setupView()
    }
}

extension CustomUITextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter Your Details"
            textView.textColor = .lightGray
        }
    }
}
