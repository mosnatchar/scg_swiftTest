//
//  DataDetailViewController.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import UIKit

class DataDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var itemDatail: ListItemModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        registerTableView()
        // Do any additional setup after loading the view.
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: String(describing: DataDetailTableViewCell.self),
                                 bundle: Bundle(for: DataDetailTableViewCell.self)),
                           forCellReuseIdentifier: DataDetailTableViewCell.identifier)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DataDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DataDetailTableViewCell.self)) as? DataDetailTableViewCell else { return UITableViewCell() }
        if let dataItem = itemDatail{
            cell.setModel(model: dataItem)
        }
        return cell
    }
}
