//
//  Service.swift
//  pokemon-ajaib
//
//  Created by Hansel Matthew on 20/03/23.
//

import Foundation
import Alamofire


class Service {
    
    static let shared = Service()
    
    public func requestCards(completion: @escaping (Result<CardsResponse, Error>) -> Void){
        
        let urlString = Constants.baseApi + Endpoints.cards
        
        AF.request(urlString).responseJSON { response in
                switch response.result {
                case .success(_):
                    do {
                        if let responseData = response.data {
                            let results = try JSONDecoder().decode(CardsResponse.self, from: responseData)
                            completion(.success(results))
                        } else {
                            let error = NSError()
                            completion(.failure(error))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}

