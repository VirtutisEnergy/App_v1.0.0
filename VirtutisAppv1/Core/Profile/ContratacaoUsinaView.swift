//
//  ContratacaoUsinaView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 07/02/24.
//

import SwiftUI

struct ContratacaoUsinaView: View {
    @State private var economizarInput = ""
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 10) {
                Text(Usuario.MOCK_USER.iniciais)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 72, height: 72)
                
                    .background(Color(.systemGray2))
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(Usuario.MOCK_USER.nomeUsuario)
                        .fontWeight(.semibold)
                        .padding(.top, 2)
                    
                    Text(Usuario.MOCK_USER.login)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                }
                
                Image("virtutis-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                
            }
            
            List {
                Text("Qual o valor médio que você costuma pagar em sua conta de energia?")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                
                TextField("Digite o valor", text: $economizarInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Text("VOCÊ ECONOMIZOU R$ \(calcularPorcentagem()) REAIS")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            // colocar em section?
            NavigationLink(destination: AcompanharEconomiaView()) {
                ConfigLinhaView(imagemNome: "arrow.right.circle.fill",
                                titulo: "ACOMPANHE SUA ECONOMIA",
                                tintColor: Color(.blue))
            }
            
            Spacer()
            
        }
        
        
        Spacer()
    }
    
    // função para calcular até quanto a pessoa pode economizar
    func calcularPorcentagem() -> Int {
        if let economizarInput = Int(economizarInput) {
            return economizarInput * 3 / 10
        } else {
            return 0
        }
    }
}

#Preview {
    ContratacaoUsinaView()
}
