//
//  BaseViewController.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit

class BaseViewController: UIViewController {

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
