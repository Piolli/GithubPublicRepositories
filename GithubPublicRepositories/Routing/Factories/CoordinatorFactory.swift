//
//  CoordinatorFactory.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol CoordinatorFactory {
    func makePublicRepositoriesListCoordinator() -> Coordinator & PublicRepositoriesListOutput
}

class CoordnatorFactoryImpl: CoordinatorFactory {
    
    unowned let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func makePublicRepositoriesListCoordinator() -> Coordinator & PublicRepositoriesListOutput {
        return PublicRepositoriesListCoordinator(factory: ModuleFactoryImpl(), router: router)
    }
}

