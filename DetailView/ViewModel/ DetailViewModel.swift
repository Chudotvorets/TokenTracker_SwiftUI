//
//  CoinViewModel.swift
//  TokenTracker
//
//  Created by dev on 25.11.2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var coin: CoinModel
    
    private let service: CoinDetailDataService
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.service = CoinDetailDataService(coin: coin)
        
    }
    
}
