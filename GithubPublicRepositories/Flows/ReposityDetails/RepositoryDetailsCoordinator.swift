//
//  RepositoryDetailsCoordinator.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class RepositoryDetailsCoordinator: BaseCoordinator, RepositoryDetailsOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: PublicRepositoriesModuleFactory
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    private let url: URL
    
    init(url: URL, factory: PublicRepositoriesModuleFactory, router: Router, coordinatorFactory: CoordinatorFactory) {
        self.factory = factory
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.url = url
    }
    
    override func start() {
        showRepositoryDetails(url: url)
    }
    
    func showRepositoryDetails(url: URL) {
        let view = factory.makeRepositoryDetails(url: url)
        view.output.didDisappear = { [unowned self] in
            self.finishFlow?()
        }
        router.push(view)
    }
    
}

