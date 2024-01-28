//
//  ConfigLinhaView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 12/01/24.
//

import SwiftUI

struct ConfigLinhaView: View {
    let imagemNome: String
    let titulo: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imagemNome)
                .imageScale(.small)
                .font(.title) // *
                .foregroundColor(tintColor)
            
            Text(titulo)
                .font(.subheadline)
                .foregroundColor(.black)
                
        }
    }
}

#Preview {
    ConfigLinhaView(imagemNome: "gear", titulo: "Versão", tintColor: Color(.systemGray))
}
