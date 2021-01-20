//
//  Presentable.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import UIKit

protocol Presentable {
    func asPresent() -> UIViewController
}

extension UIViewController: Presentable {
    func asPresent() -> UIViewController {
        return self
    }
}
