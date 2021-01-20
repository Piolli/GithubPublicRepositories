//
//  AppCoordinator.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    unowned let router: Router
    let coordinatorFactory: CoordinatorFactory
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    func asPresent() -> UIViewController {
        return router.asPresent()
    }
    
    override func start() {
        runPublicRepositoriesFlow()
    }
    
    func runPublicRepositoriesFlow() {
        let coordinator = coordinatorFactory.makePublicRepositoriesListCoordinator()
        coordinator.finishFlow = { [weak self] in
            self?.remove(coordinator: coordinator)
        }
        add(coordinator: coordinator)
        coordinator.start()
    }
    
}

