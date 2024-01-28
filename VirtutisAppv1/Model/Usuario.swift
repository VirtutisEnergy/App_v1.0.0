//
//  Usuario.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 12/01/24.
//

import Foundation

// OBS: For any app we create that requires authentication, we're gonna need to create the user objective like this
// represent the user as a data object

struct Usuario: Identifiable, Codable {
    let id: String
    let login: String
    let nomeUsuario: String // pode ser o nome da PF ou PJ
    
    var iniciais: String { // pegando as iniciais do nome do usuario
        let formatter = PersonNameComponentsFormatter()
        if let componentes = formatter.personNameComponents(from: nomeUsuario) {
            formatter.style = .abbreviated
            return formatter.string(from: componentes)
        }
        return ""
    }
}

extension Usuario {
    static var MOCK_USER = Usuario(id: NSUUID().uuidString, login: "034024694", nomeUsuario: "Virtutis Energy")
}

// Populando a pagina de profile com user data
