//
//  SecondTabCoodinator.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/6/24.
//

import UIKit

class SecondTabCoodinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
