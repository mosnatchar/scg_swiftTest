//
//  HomeNavigation.swift
//  scg_test
//
//  Created by orcsoft on 7/7/2567 BE.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentHomePage() {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "DataShowViewController") as! DataShowViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func presentDetail(itemDatail: ListItemModel?) {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "DataDetailViewController") as! DataDetailViewController
        vc.itemDatail = itemDatail
        self.present(vc, animated: true)
    }
}
