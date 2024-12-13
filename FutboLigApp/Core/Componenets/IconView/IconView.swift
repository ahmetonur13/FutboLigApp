//
//  IconView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import SwiftUI

struct IconView: View {
    let iconName : String
    var body: some View {
        Image(systemName: iconName)
            .font(.title)
            .frame(maxWidth: 10)
            .padding(.all , 20)
            .background(
                Circle()
                    .foregroundColor(.white)
            )
            .shadow(color: .gray.opacity(0.7),radius: 10)
            .padding()
    }
}

#Preview {
    IconView(iconName: "info")
}
