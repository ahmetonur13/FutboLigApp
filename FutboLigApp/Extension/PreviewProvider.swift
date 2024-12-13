//
//  PreviewProvider.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperProvider {
        return DeveloperProvider.instance
    }
}

class DeveloperProvider{
    static let instance = DeveloperProvider()
    private init() { }
    
//    let footballPlayer = FootballPlayer(
//        filters: Filters(
//            limit: 10,
//            offset: 0,
//            competitions: "DFB,BL1,SSL,CL,EL,UNL,PD,CDR",
//            permission: "TIER_ONE",
//            season: "2021",
//            matchday: "30"
//        ),
//        resultSet: ResultSet(
//            count: 8,
//            competitions: "PD",
//            played : 9,
//            first: "2024-01-21",
//            last: "2024-09-20"
//        ),
//        aggregations: "As this is a CPU intensive operation, this is only available for paid subscriptions.",
//        person: Person(
//            id: 16275,
//            name: "Djibril Sow",
//            firstName: "Djibril",
//            lastName: "Sow",
//            dateOfBirth: "1997-02-06",
//            nationality: "Switzerland",
//            section: "Central Midfield",
//            position: nil,
//            shirtNumber: nil,
//            lastUpdated: "2024-08-12T11:57:15Z"
//        ),
//        matches: []
//    )
}

