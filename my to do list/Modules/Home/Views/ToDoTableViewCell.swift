//
//  ToDoTableViewCell.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit
import SnapKit

class ToDoTableViewCell: UITableViewCell {
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 25)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Test label"
        return label
    }()
    
    lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Regular", size: 20)
        label.numberOfLines = 2
        label.alpha = 0.5
        label.text = "Test details"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToDoTableViewCell {
    func setupUI() {
        addSubview(mainView)
        mainView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }
            
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mainView.snp.top).offset(10)
            make.leading.equalTo(mainView.snp.leading).offset(10)
            make.trailing.equalTo(mainView.snp.trailing).offset(-10)
        }
        
        mainView.addSubview(detailsLabel)
        detailsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalTo(mainView.snp.bottom).offset(-10)
        }
    }
}
