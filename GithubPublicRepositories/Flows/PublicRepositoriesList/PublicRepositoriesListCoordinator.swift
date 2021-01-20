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
    
    init(factory: PublicRepositoriesModuleFactory, router: Router) {
        self.factory = factory
        self.router = router
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
        fatalError()
    }
    
}

