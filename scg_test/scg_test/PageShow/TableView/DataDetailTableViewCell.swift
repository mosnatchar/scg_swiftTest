//
//  DataDetailTableViewCell.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import UIKit

class DataDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageShow: UIImageView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var dateUpTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    
}
