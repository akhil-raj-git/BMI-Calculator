//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Akhil Raj on 2/15/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let colors = (underweight: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), normal: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), overweight: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        
        let bmiVal = weight / pow(height, 2)
        
        switch bmiVal{
            case 0..<18.5:
                bmi = BMI(value: bmiVal, advice: "Eat more pies!", color: colors.underweight)
            case 18.5...24.9:
                bmi = BMI(value: bmiVal, advice: "Fit as a fiddle!", color: colors.normal)
            default:
                bmi = BMI(value: bmiVal, advice: "Eat less pies!", color: colors.overweight)
        }
    }
    
    func getBMIValue() -> String? {
        let bmiToString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToString
    }
    
    func getAdvice() -> String? {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor? {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
