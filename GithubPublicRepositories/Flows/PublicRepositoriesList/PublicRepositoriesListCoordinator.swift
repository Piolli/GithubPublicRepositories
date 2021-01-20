//
//  PublicRepositoriesListCoordinator.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class PublicRepositoriesListCoordinator: BaseCoordinator, PublicRepositoriesListOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: PublicRepositoriesModuleFactory
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    
    init(factory: PublicRepositoriesModuleFactory, router: Router, coordinatorFactory: CoordinatorFactory) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showPublicRepositoriesList()
    }
    
    func showPublicRepositoriesList() {
        let view = factory.makePublicRepositoriesList()
        view.output.onOpenDetails = { [unowned self] url in
            self.showRepositoryDetails(url: url)
        }
        router.push(view)
    }
    
    func showRepositoryDetails(url: URL) {
        let coordinator = coordinatorFactory.makeRepositoryDetailsCoordinator(url: url)
        coordinator.finishFlow = { [unowned self] in
            self.router.dismissModule()
            self.remove(coordinator: coordinator)
        }
        add(coordinator: coordinator)
        coordinator.start()
    }
    
}

