//
//  ContentView.swift
//  imc2
//
//  Created by Deblyn Prado on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var result: String = ""
//    var category: String = ""
    
//    func category(for imc: Float) -> String? {
//        if imc > 0 && imc < 18.5 {
//            return "Under weight"
//        } else if imc >= 18.5 && imc < 25 {
//            return "Normal weight"
//        } else if imc >= 25 && imc < 30 {
//            return "Overweight"
//        } else if imc >= 30 && imc < 35 {
//            return "Obesity Class I"
//        } else if imc >= 35 && imc < 40 {
//            return "Obesity Class II"
//        } else if imc > 40 {
//            return "Obesity Class III"
//        }
//        return nil
//    }
    
    var body: some View {
        VStack(spacing: 8) {
            TextField("Peso", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
            
            TextField("Altura", text: $height)
                .keyboardType(.decimalPad)
                .padding()
        }
        .padding()
        
        VStack {
            Button("Calcular") {
                guard let weightFloat = Float(weight.replacingOccurrences(of: ",", with: ".")),
                      let heightFloat = Float(height.replacingOccurrences(of: ",", with: ".")) else {
                    result = "Enter a valid number"
                    return
                }
                let imc = weightFloat / pow(heightFloat, 2)
                guard let category2 = WeightCategory.imcCategory(for: imc) else {
                    result = "IMC na Faixa negativa"
                    return
                }
//                guard let category = category(for: imc) else {
//                    result = "An error occurred"
//                    return
//                }
                
                let category = WeightCategory.weightCategory(for: imc)
                result = """
                         IMC: \(imc)
                         Your category is: \(category)
                         """
                
                height = ""
                weight = ""
            }
        }
        Spacer()
        
        VStack {
            Text(result)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
