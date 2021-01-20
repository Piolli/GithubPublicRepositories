//
//  URLSession + Ext.swift
//  GithubPublicRepositories
//
//  Created by Alexandr Kamyshev on 20.01.2021.
//

import Foundation
import RxSwift
import RxCocoa


extension URLSession {
    
    fileprivate func decodeJSON<T : Decodable>(decoder: JSONDecoder, data: Data) -> SingleEvent<T> {
        do {
            let decodeData = try decoder.decode(T.self, from: data)
            return .success(decodeData)
        } catch {
            return .error(RxError.unknown)
        }
    }
    
    func doRequest<T : Decodable>(_ request: URLRequest, jsonDecoder: JSONDecoder = JSONDecoder()) -> Single<T> {
        return Single<T>.create { [weak self] (single) -> Disposable in
            guard let self = self else {
                single(.error(RxError.unknown))
                return Disposables.create()
            }
            
            let task = self.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil {
                    single(.error(RxError.unknown))
                } else if let response = response as? HTTPURLResponse, let data = data {
                    switch response.statusCode {
                    case 200...299:
                        single(self.decodeJSON(decoder: jsonDecoder, data: data))
                    default:
                        single(.error(RxError.unknown))
                    }
                } else {
                    single(.error(RxError.unknown))
                }
            })
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }.subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background))
    }
    
}
