//
//  Header.swift
//  Pokemon
//
//  Created by Deblyn Prado on 05/05/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
       ZStack {
            Text("PokeApi")
               .font(.title)
               
        }
       .frame(maxWidth: .infinity)
       .background(Color.red)
    }
}

#Preview {
    Header()
}
