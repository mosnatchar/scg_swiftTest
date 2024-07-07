//
//  DataShowViewController.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import UIKit

class DataShowViewController: UIViewController {

    @IBOutlet weak var searchView: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModelHome()
    var itemList: [ListItemModel]?
    var serchList: [ListItemModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate
        searchView.placeholder = "ค้นหา"
        getDataService()
        // Do any additional setup after loading the view.
    }
    
    func getDataService(){
        viewModel.getDataShow()
        
        viewModel.didFinishFetch = {
            self.itemList = self.viewModel.itemList
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorStyle = .none
            self.registerTableView()
        }
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: String(describing: DataShowTableViewCell.self),
                                 bundle: Bundle(for: DataShowTableViewCell.self)),
                           forCellReuseIdentifier: DataShowTableViewCell.identifier)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchView.text?.count ?? 0 > 0{
            serchList = []
            let listfilter = itemList?.filter { string in
                return string.title?.contains(searchView.text ?? "") ?? false
            }
            
            if searchView.text?.count ?? 0 <= 0{
                serchList = itemList
            }else{
                serchList = listfilter
            }
        }
        tableView.reloadData()
        
    }
}
extension DataShowViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchView.text?.count ?? 0 > 0{
            return serchList?.count ?? 0
        }else{
            return itemList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DataShowTableViewCell.self)) as? DataShowTableViewCell else { return UITableViewCell() }
        if searchView.text?.count ?? 0 <= 0{
            guard let item = itemList?[indexPath.row] else{return cell}
            DispatchQueue.main.async{
                cell.setModel(model: item)
            }
        }else{
            guard let item = serchList?[indexPath.row] else{return cell}
            DispatchQueue.main.async{
                cell.setModel(model: item)
            }
        }
        cell.deleget = self
        return cell
    }
}
extension DataShowViewController: DataShowTableViewCellCellDelegate {
    func selecteTapped(cell: UITableViewCell?) {
        guard let cell = cell,
              let index = tableView.indexPath(for: cell) else { return }
        presentDetail(itemDatail: itemList?[index.row])
    }
    
    
}
