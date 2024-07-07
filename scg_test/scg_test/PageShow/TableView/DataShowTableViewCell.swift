//
//  DataShowTableViewCell.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import UIKit
protocol DataShowTableViewCellCellDelegate: AnyObject {
    func selecteTapped(cell: UITableViewCell?)
}
class DataShowTableViewCell: UITableViewCell {

    var deleget: DataShowTableViewCellCellDelegate!
    
    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var dateUpTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func setModel(model: ListItemModel){
        if let url = URL(string: model.urlToImage ?? "") {
            imageShow.setImage(from: url)
        }
        nameTitle.text = model.title
        detailTitle.text = model.description
        dateUpTitle.text = model.publishedAt
    }
    
    @IBAction func viewDetailAction(_ sender: Any) {
        deleget.selecteTapped(cell: self)
    }
}


extension UIImageView {
    func setImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
