//
//  Router.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit

protocol Router: Presentable {
    
    func push(_ view: Presentable)
    func push(_ view: Presentable, animated: Bool)

    func present(_ view: Presentable)
    func present(_ view: Presentable, animated: Bool)
    func present(_ view: Presentable, animated: Bool, completion: (() -> Void)?)
    
    func dismissModule()
    
}

class RouterImpl: Router {
    
    let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func asPresent() -> UIViewController {
        return rootViewController
    }

    func present(_ view: Presentable) {
        present(view, animated: true)
    }
    
    func present(_ view: Presentable, animated: Bool) {
        rootViewController.present(view.asPresent(), animated: animated, completion: nil)
    }
    
    func present(_ view: Presentable, animated: Bool, completion: (() -> Void)?) {
        rootViewController.present(view.asPresent(), animated: animated, completion: completion)
    }
    
    func push(_ view: Presentable) {
        push(view, animated: true)
    }
    
    func push(_ view: Presentable, animated: Bool) {
        rootViewController.pushViewController(view.asPresent(), animated: animated)
    }
    
    func dismissModule() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
    
}

