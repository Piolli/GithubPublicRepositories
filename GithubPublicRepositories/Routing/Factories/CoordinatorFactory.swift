//
//  CoordinatorFactory.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

protocol CoordinatorFactory {
    func makePublicRepositoriesListCoordinator() -> Coordinator & PublicRepositoriesListOutput
    func makeRepositoryDetailsCoordinator(url: URL) -> Coordinator & RepositoryDetailsOutput
}

class CoordnatorFactoryImpl: CoordinatorFactory {
    
    unowned let router: Router
    let assembler: Assembler
    
    init(router: Router, assembler: Assembler) {
        self.router = router
        self.assembler = assembler
    }
    
    func makePublicRepositoriesListCoordinator() -> Coordinator & PublicRepositoriesListOutput {
        return PublicRepositoriesListCoordinator(factory: ModuleFactoryImpl(assembler: assembler), router: router, coordinatorFactory: CoordnatorFactoryImpl(router: router, assembler: assembler))
    }
    
    func makeRepositoryDetailsCoordinator(url: URL) -> Coordinator & RepositoryDetailsOutput {
        return RepositoryDetailsCoordinator(url: url, factory: ModuleFactoryImpl(assembler: assembler), router: router, coordinatorFactory: CoordnatorFactoryImpl(router: router, assembler: assembler))
    }
}

