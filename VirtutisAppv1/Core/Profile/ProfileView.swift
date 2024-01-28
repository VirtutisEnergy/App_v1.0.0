//
//  ProfileView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 12/01/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var economizarInput = ""
    // @Environment(\.dismiss) var dismiss
    var body: some View {
        List {
            Section {
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
                }
                
            }
            
            Text("Aqui na Virtutis você economiza até 30% mensalmente.")
                .foregroundColor(.blue)
                .fontWeight(.semibold)
            
            Section {
                HStack(spacing: 30) {
                    Text("V")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                        .background(Color(.green))
                        .clipShape(Circle())
                    
                    Text("I")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                        .background(Color(.green))
                        .clipShape(Circle())
                    
                    Text("T")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                        .background(Color(.green))
                        .clipShape(Circle())
                    
                    Text("I")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                        .background(Color(.green))
                        .clipShape(Circle())
                    
                    Text("S")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                        .background(Color(.green))
                        .clipShape(Circle())
                }
                
                
            }
            
            Section("ACOMPANHE SEU LUCRO") {
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
            
            Section {
                Button {
                    print("COMPRAR VITIS")
                } label: {
                    ConfigLinhaView(imagemNome: "arrow.right.circle.fill",
                                    titulo: "COMPRAR VITIS", tintColor: Color(.blue))
                }
                Text("Compre a quantidade desejada de Vitis de Usinas VE.")
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
            }
            
            Section("Conta") {
                Button {
                    print("SAIR")
                } label: {
                    ConfigLinhaView(imagemNome: "arrow.left.circle.fill",
                                    titulo: "SAIR", tintColor: Color(.blue))
                }
                
                Button {
                    print("Deletar Conta")
                } label: {
                    ConfigLinhaView(imagemNome: "xmark.circle.fill",
                                    titulo: "DELETAR CONTA", tintColor: Color(.blue))
                }
            }
            
            Section("Geral") {
                HStack {
                    ConfigLinhaView(imagemNome: "gear",
                                    titulo: "Versão",
                                    tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
            }
            
        } // List
        // .background(Color.blue)
        // não funciona
        
        
        Button {
            print("Investir...")
        } label: {
            Text("QUERO INVESTIR!")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 25, height: 60)
        }
        .background(Color(.green))
        .cornerRadius(40)
        .padding(.top, 20)
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
    ProfileView()
}
