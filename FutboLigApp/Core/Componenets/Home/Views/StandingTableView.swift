//
//  StandingTableView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 16.11.2024.
//

import SwiftUI
import SharedFramework

struct StandingTableView: View {
    @StateObject private var vm : StandingViewModel
    @State private var table : TeamTable? = nil
    @State private var showTeamMatches : Bool = false
    init(competitionModel : HomeViewModel) {
        _vm = StateObject(wrappedValue: StandingViewModel(competititonModel: competitionModel))
    }
    var body : some View {
        VStack {
            if let standings = vm.standingCompetitions  , let standing = standings.standings{
                ScrollView(.horizontal , showsIndicators: false){
                    ForEach(standing , id: \.group ) { standing in
                        if let tables = standing.table{
                            Section {
                                ForEach(tables , id:\.team.id ){ table in
                                    StandingView(table: table)
                                        .onTapGesture {
                                            segue(table : table)
                                        }
                                }
                            } header: {
                                VStack(alignment: .leading){
                                    if let group = standing.group , !tables.isEmpty{
                                        Text(group)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .fontWeight(.bold)
                                    }
                                    sectionHeaderView
                                }
                            }
                        }
                    }
                }
                Spacer()
            }else {
                ProgressView()
            }
        }.background(
            NavigationLink(
                destination:TeamMatchesLoadingView(teamId: table?.team.id),
                isActive: $showTeamMatches,
                label: {EmptyView()})
        )
    }
}

extension StandingTableView {
    private var sectionHeaderView : some View {
        HStack{
            Text("Club")
                .frame(width: 230 , alignment: .leading)
            Spacer()
            Group{
                Text("MP")
                Text("W")
                Text("D")
                Text("L")
                Text("GF")
                Text("GA")
                Text("GD")
                Text("Pts")
            }.frame(width: 30, alignment: .center)
        }
        .font(.subheadline)
        .foregroundColor(.gray)
    }
    private func segue(table : TeamTable) {
        self.table = table
        showTeamMatches.toggle()
    }
}
