//
//  CoinDetailDataService.swift
//  TokenTracker
//
//  Created by dev on 25.11.2024.
//

import Foundation

class CoinDetailDataService {
    var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    func getCoinDetailsWithResult(completion: @escaping(Result<[CoinDetailModel], CoinAPIErrorModel>) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=true&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=true"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownedError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let details = try JSONDecoder().decode([CoinDetailModel].self, from: data)
                completion(.success(details))
            } catch {
                print("DEBUG: Failed to decode with error \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
}
