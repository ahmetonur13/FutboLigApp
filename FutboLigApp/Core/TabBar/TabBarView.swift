//
//  TabBarView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 13.10.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "info")
                }.tag(0)
        }
    }
}

#Preview {
    NavigationView{
        TabBarView()
    }
}
