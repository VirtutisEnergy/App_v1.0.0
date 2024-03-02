//
//  VitisView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 28/01/24.
//

import SwiftUI

struct VitisView: View {
    @State private var quantVitis = ""
    @State private var valorTotalVitis = ""
    
    @State private var banco = ""
    @State private var numConta = ""
    @State private var agencia = ""
    @State private var senha = ""
    
    // valores String opcionais
    @State private var pagSelecionado: String?
    @State private var vitisSelecionado: String?
    
    // colocar variaveis para Vitis de cada ano
    private var valorVitis = 12.0
    
    private let opçoesPagamento = ["Ala VE.1", "Ala VE.2", "Ala VE.3", "Ala VE.4", "Ala VE.5"]
    
    private let anoVitis = ["2023.01", "2024.01", "2024.02"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 20) {
                    Image("virtutis-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .padding(.vertical, 10)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 10)
                    
                    VStack(spacing: 0.5) {
                        Text("INFORMAÇÕES DA COMPRA")
                            .padding(.top, 10)
                            .fontWeight(.bold)
                            .font(.title3)
                       
                    }
                }
                .padding(.top, 1)
                
                List {
                    // Dropdown options
                    
                    HStack(spacing: 10) {
                        // colocar opções de Ala
                        DropDownView(titulo: "Ala",
                                     prompt: "Selecione",
                                     opcoes: opçoesPagamento,
                                     selection: $pagSelecionado)
                        
                        //
                        DropDownView(titulo: "Usina",
                                     prompt: "Selecione",
                                     opcoes: anoVitis,
                                     selection: $vitisSelecionado)
                        
                    }
                    .padding()
                    
                    VStack {
                        Text("COMPRAR VITIS")
                            .padding(.top, 30)
                            .padding(.bottom, 1)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.green)
                       // numVitispeloValor
                        HStack {
                            VStack {
                                Section {
                                    Text("Quantidade")
                                    Text("de Vitis")
                                        .padding(.bottom, 1)
                                }
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                                .fontWeight(.bold)
                                .font(.title3)
                            
                                // de acordo com o ano, o valor do vitis sera diferente
                                TextField("Digite o valor", text: $quantVitis)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 140)
                                    .padding()
                                    .padding(.top, 3)
                                
                                Text("R$ \( valorTotalVitis(valorVitis: 12.0) )")
                                    .padding(.bottom, 40)
                                    .foregroundColor(.white)
                            }
                            
                            VStack {
                                Section {
                                    Text("Valor")
                                    Text("a ser gasto")
                                        .padding(.bottom, 1)
                                }
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                                .fontWeight(.bold)
                                .font(.title3)
                                
                                // de acordo com o ano, o valor do vitis sera diferente
                                TextField("Digite o valor", text: $valorTotalVitis)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 140)
                                    .padding()
                                    .padding(.top, 3)
                                
                                Text("Vitis: \(numVitispeloValor(valorVitis: 12.0))")
                                    .padding(.bottom, 40)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    // width de antes: UIScreen.main.bounds.width
                    .frame(width: 350, height: 240)
                    .background(Color(.blue))
                    .clipShape(Rectangle())
                    
                    Text("DIGITE SEUS DADOS")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.top, 10)
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("Banco")
                            TextField("Nubank", text: $banco)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        
                        VStack {
                            Text("Número da Conta")
                            TextField("xxxxxxxx", text: $numConta)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                    }
                    .padding(.top, 10)
                    
                    // precisa confirmação de senha?
                    // cartão já cadastrado?
                    HStack(spacing: 30) {
                        VStack {
                            Text("Agência")
                            TextField("xxxx", text: $agencia)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                        
                        VStack {
                            Text("Senha do App")
                            TextField("*******", text: $senha)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 150)
                        }
                    }
                    .padding(.top, 10)
                }
                
                // colocar em section?
                NavigationLink(destination: AcompanharInvestimentoView()) {
                    ConfigLinhaView(imagemNome: "arrow.right.circle.fill",
                                    titulo: "ACOMPANHE SEU INVESTIMENTO",
                                    tintColor: Color(.blue))
                }
            }
        }
        
        Spacer()
    }
    
    // função que calcula o valor a ser pago de acordo com o valorVitis. Ou seja, de acordo com o valor do Vitis
    func valorTotalVitis(valorVitis: Float) -> Float {
        if let quantVitis = Float(quantVitis) {
            return round(quantVitis * valorVitis * 1000) / 1000.0
        } else {
            return 0
        }
    }
    
    func numVitispeloValor(valorVitis: Float) -> Int {
        if let valorTotalVitis = Float(valorTotalVitis) {
            return Int(valorTotalVitis / valorVitis)
        } else {
            return 0
        }
    }
}

#Preview {
    VitisView()
}
