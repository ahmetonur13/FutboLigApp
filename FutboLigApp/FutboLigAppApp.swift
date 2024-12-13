//
//  FutboLigAppApp.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import SwiftUI

@main
struct FutboLigAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }.navigationBarHidden(true)
        }
    }
}
