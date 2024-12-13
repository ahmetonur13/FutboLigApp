//
//  PickerView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 14.10.2024.
//

import SwiftUI
import SharedFramework

struct PickerView: View {
    @Binding var selectedCompetition: CompetitionFilter
//    let standings: Standings
    
    var body: some View {
//        if let competition = standings.competition, let emblem = competition.emblem, let code = competition.code {
//            HStack {
//                if code == selectedCompetition.rawValue {
//                    PlayerImageView(urlString: emblem, key: code)
//                        .frame(maxWidth: 30)
//                }
                Picker("Select a competition", selection: $selectedCompetition) {
                    ForEach(CompetitionFilter.allCases, id: \.self) { competitions in
                            Text(competitions.listOfCometition)
                                .font(.subheadline)
                                .tag(competitions)
                    }
                }
                .pickerStyle(.menu)
                .frame(maxHeight: 30)
            }
        }
//    }
//}
