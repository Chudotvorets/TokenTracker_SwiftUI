//
//  SearchBarView.swift
//  TokenTracker
//
//  Created by dev on 20.11.2024.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.theme.secondaryText)
            TextField("Search by name or symbol...", text: $searchText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.secondaryText)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0) //используется для управления прозрачностью элемента пользовательского интерфейса
                        .onTapGesture { //позволяет добавлять обработчик нажатий (тач-событий) на элементы пользовательского интерфейс
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                        ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(color: .primary.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

extension Color {
    static let theme = Theme()
}

struct Theme {
    let backround = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
