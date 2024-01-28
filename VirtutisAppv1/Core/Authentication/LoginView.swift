//
//  LoginView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 09/01/24.
//

import SwiftUI
// immma start here !!!!!!
struct LoginView: View {
    @State private var login_usuario = ""
    @State private var senha = ""
    
    var body: some View {
        ZStack { // coloquei tudo em um ZStack
//           Rectangle()
//              .foregroundColor(Color.blue)
//              .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    Image("virtutis-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 110)
                        .padding(.vertical, 30)
                    
                    // form field
                    VStack(spacing: 26) {
                        InputView(text: $login_usuario,
                                  titulo: "CPF ou CNPJ",
                                  placeholder: "CPF ou CNPJ cadastrado")
                            .autocapitalization(.none)
                            // o texto, por padrão, não começa com letra maiuscula
                        
                        InputView(text: $senha,
                                  titulo: "Senha",
                                  placeholder: "Digite sua senha",
                                  isSecureField: true)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 30)
                    
                    // sign in button
                    Button {
                        print("Entrar com usuário...")
                    } label: {
                        HStack {
                            Text("ENTRAR")
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
                    .padding(.top, 20)
                    
                    
                    Spacer()
                    
                    // sign up button
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack(spacing: 4) {
                            Text("Não possui uma conta?")
                            Text("CADASTRE-SE")
                                .underline()
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                    }
                    
                }
            }
        }
    }
    
    // funções
}

#Preview {
    LoginView()
}
