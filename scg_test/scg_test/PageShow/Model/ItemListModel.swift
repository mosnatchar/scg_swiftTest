//
//  ItemListModel.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import Foundation
struct ListItemModel {
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    
    init?(from jsonObject: AnyObject) {
        let title = jsonObject.object(forKey: "title") as? String
        let description = jsonObject.object(forKey: "description") as? String
        let urlToImage = jsonObject.object(forKey: "urlToImage") as? String
        let publishedAt = jsonObject.object(forKey: "publishedAt") as? String
        
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
