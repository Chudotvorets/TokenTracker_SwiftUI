//
//  CoinDataService.swift
//  TokenTracker
//
//  Created by dev on 23.11.2024.
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
    func fatchCoin() async throws -> [CoinModel] {
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([CoinModel].self, from: data)
            return coins
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
                return []
            }
            
        }
    }

