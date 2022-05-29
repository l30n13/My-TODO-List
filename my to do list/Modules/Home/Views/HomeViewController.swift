//
//  HomeViewController.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    lazy var noDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Medium", size: 30)
        label.textColor = .red
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    lazy var navBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(openNewNote))
        return button
    }()
    
    let cellID = "cellID"
    let viewModel = HomeViewModel()
}

extension HomeViewController {
    override func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My TODO List"
        navigationItem.setRightBarButton(navBarButton, animated: true)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(20)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: cellID)
        
        loadData()
    }
}

extension HomeViewController {
    func loadData() {
        viewModel.fetchToDoData { [weak self] (response) in
            if response {
                self?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController {
    @objc func openNewNote() {
        let vc = CreateTODOViewController(delegate: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = viewModel.todoListViewModel, list.count > 0 {
            tableView.backgroundView = nil
            return list.count
        } else {
            noDataLabel.text = viewModel.noDataFound
            tableView.backgroundView = noDataLabel
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ToDoTableViewCell
        cell.setupData(data: viewModel.todoListViewModel?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            viewModel.todoListViewModel?.remove(at: indexPath.row)
            viewModel.deleteToDoData()
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
}

extension HomeViewController: CreateTODODelegate {
    func onSuccessfulCreateTODO(isSuccess: Bool) {
        if isSuccess {
            loadData()
        }
    }
}
