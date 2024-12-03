//
//  CoinDetailModel.swift
//  TokenTracker
//
//  Created by dev on 25.11.2024.
//

import Foundation

struct CoinDetailModel: Codable {

        let id: String
        let symbol: String
        let name: String
        let description: [String: String]
        let links: Links
        let image: Image
        let genesisDate: String?
        let sentimentVotesUpPercentage: Double?
        let sentimentVotesDownPercentage: Double?
        let marketCapRank: Int?
        let coingeckoRank: Int?
        let coingeckoScore: Double?
        let developerScore: Double?
        let communityScore: Double?
        let liquidityScore: Double?
        let publicInterestScore: Double?
        let lastUpdated: String
        let localization: [String: String]
        let sparklineIn7d: Sparkline?
        
        struct Links: Codable {
            let homepage: [String?]
            let blockchainSite: [String?]
            let officialForumURL: [String?]
            let chatURL: [String?]
            let announcementURL: [String?]
            let twitterScreenName: String?
            let facebookUsername: String?
            let bitcointalkThreadIdentifier: String?
            let telegramChannelIdentifier: String?
            let subredditURL: String?
        }
        
        struct Image: Codable {
            let thumb: String
            let small: String
            let large: String
        }
        
        struct Sparkline: Codable {
            let price: [Double]
        }
    }
