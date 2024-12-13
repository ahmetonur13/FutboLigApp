//
//  IconAnimation.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 11.10.2024.
//

import SwiftUI

struct IconAnimation: View {
    @Binding var repeatAnimation : Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(repeatAnimation ? 1.0 : 0.0)
            .opacity(repeatAnimation ? 0.0 : 1.0)
            .animation(repeatAnimation ? Animation.easeOut(duration: 1.0)  : .none)   
    }
}

//#Preview {
//    IconAnimation()
//}
