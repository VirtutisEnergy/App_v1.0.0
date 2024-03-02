//
//  DropDownView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 31/01/24.
//

import SwiftUI

struct DropDownView: View {
    let titulo: String
    let prompt: String
    let opcoes: [String]
    
    @State private var isExpanded = false
    
    @Binding var selection: String?
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .font(.footnote)
                .foregroundStyle(.gray)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Text(selection ?? prompt)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .frame(height: 40)
                .background(scheme == .dark ? .black : .green)
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.snappy) { isExpanded.toggle() }
                }
                
                if isExpanded {
                    VStack {
                        ForEach(opcoes, id: \.self) { opcao in
                            HStack {
                                Text(opcao)
                                    .foregroundStyle(selection == opcao ? Color.primary : .gray)
                                
                                Spacer()
                                
                                if selection == opcao {
                                    Image(systemName: "checkmark")
                                        .font(.subheadline)
                                }
                            }
                            .frame(height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selection = opcao
                                    isExpanded.toggle()
                                }
                                
                            }
                            
                        }
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .background(scheme == .dark ? .black : .green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .primary.opacity(0.2), radius: 2)
            .frame(width: 160)
            
        }
    }
}

#Preview {
    DropDownView(titulo: "Opções",
                 prompt: "Selecione",
                 opcoes: ["Banco do Brasil", "Nubank", "Caixa"],
                 selection: .constant("Nubank")
    )
}
