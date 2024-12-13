//
//  ContentView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import SwiftUI
import SharedFramework

struct HomeView: View {
    @StateObject var competitionFilter = HomeViewModel(standingsApiKey: Environment.standingsApiKey, topScoreresApiKey: Environment.topScorersApiKey)
    var body: some View {
        ScrollView(showsIndicators: false){
            PickerView(selectedCompetition: $competitionFilter.selectedCompetition )
                infoPickerView
                    .padding(.vertical)
            LazyVStack{
                    if competitionFilter.selection == .standing {
                        StandingTableView(competitionModel: competitionFilter)
                    } else if competitionFilter.selection == .topScorers {
                        TopScorersView(competitionModel: competitionFilter)
                    }
                }
        }.padding(.horizontal)
            .navigationTitle("Competitions")
            .navigationBarTitleDisplayMode(.inline)
            .font(.headline)
    }
}
extension HomeView {
    private var infoPickerView : some View {
        Picker("Merhaba" , selection: $competitionFilter.selection) {
            ForEach(Selection.allCases , id: \.self){ selected in
                Text(selected.rawValue)
                    .tag(selected)
            }
        }.pickerStyle(.segmented)
    }
}

#Preview {
    NavigationView{
        HomeView()
    }
}

