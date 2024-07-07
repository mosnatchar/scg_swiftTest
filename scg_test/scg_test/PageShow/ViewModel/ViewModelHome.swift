//
//  ViewModelHome.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import Foundation
import Moya
import Alamofire

enum DataCase {
    case success(String)
    case failure
}

class ViewModelHome: NSObject {

    var didFinishFetch: (() -> ())?
    var itemList: [ListItemModel]?
    
    func getDataShow() {
        let params: Parameters = [
            "q": "apple",
            "from": "2024-07-06",
            "to":"2024-07-06",
            "sortBy":"popularity",
            "apiKey":"d1bb0d9de0d549e6ba40754527a5253e"
        ]
        
        let request = AF.request( "https://newsapi.org/v2/everything",method: .get, parameters: params, encoding: URLEncoding.default)
        request.validate(statusCode: 200..<300).responseJSON() { (response) in
            switch response.result {
            case .success(let data): do {
                if let postArray = data as? [String:AnyObject], let list = postArray["articles"] as? [AnyObject] {
                    self.itemList = list.compactMap({ListItemModel(from: $0)})
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.didFinishFetch?()
                    }
                } else {
                    
                }
            }
            case .failure(_): do {
                return
            }
            }
        }
    }
}
