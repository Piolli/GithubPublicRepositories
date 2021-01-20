//
//  BaseCoordinator.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    private var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("start() method has not been implemented")
    }
    
    func add(coordinator: Coordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
}
