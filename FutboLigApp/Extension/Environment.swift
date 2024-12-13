//
//  ApiKeyHelper.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 13.12.2024.
//

import Foundation

public enum Environment {
    enum Keys {
        static let standingsApiKey = "STANDINGS_API_KEY"
        static let topScorersApiKey = "TOP_SCORERS_API_KEY"
        static let playerMatchesApiKey = "PLAYER_MATCHES_API_KEY"
        static let teamMatchesApiKey = "TEAM_MATCHES_API_KEY"
        static let teamDataServiceApiKey = "TEAM_DATA_SERVICE_API_KEY"

    }
    private static let infoDictionary : [String : Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist is not found")
        }
        return dict
    }()
    
    static let standingsApiKey : String = {
        guard let standingsApiKey = Environment.infoDictionary[Keys.standingsApiKey] as? String else {
            fatalError("Keys is not found")
        }
        return standingsApiKey
    }()
    static let topScorersApiKey : String = {
        guard let topScorersApiKey = Environment.infoDictionary[Keys.topScorersApiKey] as? String else {
            fatalError("Keys is not found")
        }
        return topScorersApiKey
    }()
    static let playerMatchesApiKey : String = {
        guard let playerMatchesApiKey = Environment.infoDictionary[Keys.playerMatchesApiKey] as? String else {
            fatalError("Keys is not found")
        }
        return playerMatchesApiKey
    }()
    static let teamMatchesApiKey : String = {
        guard let teamMatchesApiKey = Environment.infoDictionary[Keys.teamMatchesApiKey] as? String else {
            fatalError("Keys is not found")
        }
        return teamMatchesApiKey
    }()
    static let teamDataServiceApiKey : String = {
        guard let teamDataServiceApiKey = Environment.infoDictionary[Keys.teamDataServiceApiKey] as? String else {
            fatalError("Keys is not found")
        }
        return teamDataServiceApiKey
    }()


}
