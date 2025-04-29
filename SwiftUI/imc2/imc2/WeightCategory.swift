//
//  WeightCategory.swift
//  imc2
//
//  Created by Deblyn Prado on 25/03/25.
//


enum WeightCategory {
    case under
    case normal
    case overweight
    case obeseMin
    case obeseMed
    case obeseMax
    
    static func weightCategory(for imc: Float) -> String {
        if imc > 0 && imc < 18.5 {
            return WeightCategory.under.getCategory()
        } else if imc >= 18.5 && imc < 25 {
            return WeightCategory.normal.getCategory()
        } else if imc >= 25 && imc < 30 {
            return WeightCategory.overweight.getCategory()
        } else if imc >= 30 && imc < 35 {
            return WeightCategory.obeseMin.getCategory()
        } else if imc >= 35 && imc < 40 {
            return WeightCategory.obeseMed.getCategory()
        } else {
            return WeightCategory.obeseMax.getCategory()
        }
    }
    
    static func imcCategory(for imc: Float) -> WeightCategory? {
        switch imc {
        case 0..<18.5: return .under
        case 18.5..<25: return .normal
        case 25..<30: return .overweight
        case 30..<35: return .obeseMin
        case 35..<40: return .obeseMed
        case 40...: return .obeseMax
        default: return nil
        }
    }
    
    func getCategory() -> String {
        switch self {
        case .under: return "Under weight"
        case .normal: return "Normal weight"
        case .overweight: return "Overweight"
        case .obeseMin: return "Obesity Class I"
        case .obeseMed: return "Obesity Class II"
        case .obeseMax: return "Obesity Class III"
        }
    }
}
