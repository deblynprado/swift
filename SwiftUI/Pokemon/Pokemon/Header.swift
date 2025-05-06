//
//  Header.swift
//  Pokemon
//
//  Created by Deblyn Prado on 05/05/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
       HStack {
            Text("PokeApi")
        }
       .frame(width: .infinity)
       .background(Color.blue)
    }
}

#Preview {
    Header()
}
