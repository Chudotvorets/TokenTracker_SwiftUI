//
//  ContentViewModel.swift
//  TokenTracker
//
//  Created by dev on 23.11.2024.
//

import Foundation
import SwiftUI
//import Combine

@MainActor
class CoinsViewModel: ObservableObject {
    
    @Published var coins: [CoinModel] = []
    //@Published var market: MarketDataModel? = nil
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var searchText: String = "" {
        didSet {
            print("updateDisplayCoins")
        }
    }
    private let service = CoinDataService()
    
    init() {
        isLoading = true
    }
    
     var filterProducts: [CoinModel] {
        if searchText.isEmpty {
            return coins
        } else {
            let lowercasedText = searchText.lowercased()
            let coin = coins.filter { coin in
                coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
                coin.id.lowercased().contains(lowercasedText)
            }
            return coin
        }
        
    }
    
}
