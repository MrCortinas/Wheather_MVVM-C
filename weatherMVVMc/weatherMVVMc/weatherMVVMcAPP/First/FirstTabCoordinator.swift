//
//  FirstTabCoordinator.swift
//  weatherMVVMc
//
//  Created by GCortinas on 10/6/24.
//

import UIKit
import SwiftUI

class FirstTabCoodinator: NSObject, Coordinator {
    
    var rootViewController: UINavigationController
    
    let viewModel = FirstTabViewModel()
    
    override init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()
        
        rootViewController.delegate = self
    }
    
    lazy var firstViewController: FirstViewController = {
       let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "Dallas, Tx"
        return vc
    }()
    
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetail() {
        
        
        
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel,
                                                                                 dayText: viewModel.dayText,
                                                                                 weatherStatusText: viewModel.weatherStatusText,
                                                                                 weatherHiTempText: viewModel.weatherHiTempText,
                                                                                 weatherLowTempText: viewModel.weatherLowTempText,
                                                                                 weatherIcon: viewModel.weatherIcon,
                                                                                 weatherNightTempText: viewModel.weatherNightTempText,
                                                                                 weatherEveningTempText: viewModel.weatherEveningTempText,
                                                                                 weatherDayTempText: viewModel.weatherDayTempText,
                                                                                 weatherMorningTempText: viewModel.weatherMorningTempText,
                                                                                 weatherhumidityText: viewModel.weatherhumidityText,
                                                                                 weatherGustText: viewModel.weatherGustText,
                                                                                 weatherSunriseText: viewModel.weatherSunriseText,
                                                                                 weatherSunsetText: viewModel.weatherSunsetText,
                                                                                 weatherCloudsText: viewModel.weatherCloudsText,
                                                                                 weatherPressureText: viewModel.weatherPressureText,
                                                                                 weatherWindText: viewModel.weatherWindText,
                                                                                 weatherFeelsLikeNText: viewModel.weatherFeelsLikeNText,
                                                                                 weatherFeelsLikeEText: viewModel.weatherFeelsLikeDText,
                                                                                 weatherFeelsLikeDText: viewModel.weatherFeelsLikeDText,
                                                                                 weatherFeelsLikeMText: viewModel.weatherFeelsLikeMText))
        
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

extension FirstTabCoodinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("first will be shown")
        }
    }
}
