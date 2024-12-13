//
//  PlayerImageView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 20.10.2024.
//

import SwiftUI
import SharedFramework

struct ImageView: View {
    @StateObject private var vm : PlayerImageViewModel
    init(urlString : String , key : String) {
        _vm = StateObject(wrappedValue: PlayerImageViewModel(urlString: urlString , key: key))
    }
    var body: some View {
        if let imageData = vm.playerImage{
            Image(uiImage: imageData)
                .resizable()
                .scaledToFit()
        }else if vm.isLoading {
            ProgressView()
        }else{
            Image(systemName: "questionMark")
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ImageView(urlString: "https://crests.football-data.org/263.png" , key: "1")
}
