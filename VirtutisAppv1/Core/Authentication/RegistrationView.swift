//
//  RegistrationView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 10/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var login = ""
    @State private var nomeCompleto = ""
    @State private var senha = ""
    @State private var confimarSenha = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("virtutis-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 95)
                .padding(.vertical, 30)
            
            VStack(spacing: 18) {
                InputView(text: $login,
                          titulo: "CPF ou CNPJ",
                          placeholder: "CPF ou CNPJ cadastrado")
                    .autocapitalization(.none)
                
                InputView(text: $nomeCompleto,
                          titulo: "Nome completo",
                          placeholder: "Digite seu nome completo")
                    .autocapitalization(.none)

                
                InputView(text: $senha,
                          titulo: "Senha",
                          placeholder: "Digite sua senha",
                          isSecureField: true)
                
                InputView(text: $confimarSenha,
                          titulo: "Senha",
                          placeholder: "Confirme sua senha",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom, 30)
            
            Button {
                print("Sign user up...")
            } label: {
                HStack {
                    Text("CADASTRAR")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 25,
                       height: 60)
            }
            .background(Color(.green))
            .cornerRadius(40)
            .padding(.top, 8)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Text("Já possui uma conta?")
                    Text("ENTRAR")
                        .underline()
                        .fontWeight(.bold)
                }
                .font(.system(size: 20))
                .padding(.bottom, 10)
                
            }
            
        }
    }
}

#Preview {
    RegistrationView()
}
