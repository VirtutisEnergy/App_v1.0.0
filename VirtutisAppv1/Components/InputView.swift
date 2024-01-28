//
//  InputView.swift
//  VirtutisAppv1
//
//  Created by Virtutis Energy on 10/01/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var titulo: String
    var placeholder: String
    var isSecureField = false
    // var font: Int
    // ver como escolher fonte desse modelo (novo parametro)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(titulo)
                .foregroundColor(.blue)
                .fontWeight(.semibold)
                .font(.system(size: 26))
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 26))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 26))
                
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), 
                  titulo: "Email",
                  placeholder: "abcde@gmail.com")
        
    }
}
