//
//  CreateTODOViewController.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit
import SnapKit
import IHProgressHUD

class CreateTODOViewController: BaseViewController {
    lazy var titleTextFiled: CustomUITextFiled = CustomUITextFiled(text: "Title", placeHolder: "Enter Your Title")
    lazy var detailsTextFiled: CustomUITextView = CustomUITextView(text: "Details", placeHolder: "Enter Your Details")
    
    lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var navBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(saveNote))
        return button
    }()
    
    var delegate: CreateTODODelegate?
    let viewModel = CreateTODOViewModel()
    
    
    
    convenience init(delegate: CreateTODODelegate) {
        self.init(nibName: nil, bundle: nil)
        
        self.delegate = delegate
    }
}

extension CreateTODOViewController {
    override func setupUI() {
        navigationItem.title = "Add New TODO"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setRightBarButton(navBarButton, animated: true)
        
        view.addSubview(titleTextFiled)
        titleTextFiled.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(70)
        }

        view.addSubview(detailsTextFiled)
        detailsTextFiled.snp.makeConstraints { [weak self] (make) in
            guard let self = self else { return }

            make.top.equalTo(self.titleTextFiled.snp.bottom).offset(10)
            make.leading.equalTo(self.titleTextFiled.snp.leading)
            make.trailing.equalTo(self.titleTextFiled.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
    }
}

extension CreateTODOViewController {
    @objc func saveNote() {
        guard let title = titleTextFiled.textField.text else {
            IHProgressHUD.showError(withStatus: "Please fill all fields")
            return
        }
        
        if detailsTextFiled.textView.textColor == .lightGray {
            IHProgressHUD.showError(withStatus: "Please fill all fields")
            return
        }
        
        guard let details = detailsTextFiled.textView.text else {
            IHProgressHUD.showError(withStatus: "Please fill all fields")
            return
        }
        
        viewModel.addIntoTODOList(title: title, details: details) { [weak self] (response) in
            if response {
                self?.navigationController?.popViewController(animated: true)
                self?.delegate?.onSuccessfulCreateTODO(isSuccess: true)
                IHProgressHUD.showSuccesswithStatus("TODO saved successfully")
            } else {
                IHProgressHUD.showError(withStatus: "There is some error during saving TODO")
            }
        }
    }
}
