//
//  BaseViewController.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupUI()
    }
}

extension BaseViewController {
    @objc func setupUI() {
    }
}
