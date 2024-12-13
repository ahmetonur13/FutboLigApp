//
//  MatchTableView.swift
//  FutboLigApp
//
//  Created by Ahmet Onur on 20.10.2024.
//

import SwiftUI
import SharedFramework

struct MatchTableColunmView: View {
    let match : Match
    var body: some View {
        HStack{
            if let matchday = match.matchday{
                Text("\(matchday)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .frame(minWidth: 10)
            }
            ImageView(urlString: match.homeTeam.crest , key: match.homeTeam.name)
                .frame(maxHeight: 30)
            Text(match.homeTeam.shortName)
                .frame(maxWidth: 120)
                .lineLimit(1)
            Spacer()
            if let home = match.score.fullTime.home , let away = match.score.fullTime.away{
                Text("\(home)" + " - " +  "\(away)")
            }else if let utcDate = match.utcDate{
                Text(formattedDate(utcDateString: utcDate))
                    .lineLimit(1)
                    .font(.caption)
            }
            Spacer()
            Text(match.awayTeam.shortName)
                .frame(maxWidth: 120)
                .lineLimit(1)
            ImageView(urlString: match.awayTeam.crest , key: match.awayTeam.name)
                .frame(maxHeight: 30)
        }.padding(.horizontal)
    }
    func formattedDate(utcDateString : String ) -> String{
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: utcDateString) else {
            return "Geçersiz Tarih"
        }
        
        // İstenen biçimde tarih formatı oluşturma
        let customFormatter = DateFormatter()
        customFormatter.dateFormat = "dd MMM HH:mm"
        customFormatter.locale = Locale.current
        customFormatter.timeZone = .current
        
        return customFormatter.string(from: date)
    }
}
