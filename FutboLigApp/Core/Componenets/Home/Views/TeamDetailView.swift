//
//  SwiftUIView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 12.10.2024.
//

import SwiftUI
import SharedFramework

struct TeamDetailView: View {
    let competition : CompetitionTeams
    var body: some View {
        VStack{
            if let emblem = competition.competition?.emblem , let key = competition.competition?.name{
                ImageView(urlString: emblem , key: key)
                Text( emblem )
            }
        }
    }
}
