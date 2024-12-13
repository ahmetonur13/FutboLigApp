//
//  PersonMatchFilterPicker.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 4.11.2024.
//

import SwiftUI
import SharedFramework

struct PersonMatchFilterPicker: View {
    @Binding var personFilter : PersonMatchFilter
    var body: some View {
        Picker("Select Filter", selection: $personFilter) {
            ForEach(PersonMatchFilter.allCases , id: \.rawValue) { filter in
                Text(filter.listOfPersonMatchFilter).tag(filter)
            }
        }
    }
}
