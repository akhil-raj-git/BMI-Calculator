//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderVal: UISlider!
    @IBOutlet weak var weightSliderVal: UISlider!
    
    var bmiVal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let sliderVal = String(format: "%.2f", sender.value)
        heightLabel.text = "\(sliderVal)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let sliderVal = Int(sender.value)
        weightLabel.text = "\(sliderVal)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderVal.value
        let weight = weightSliderVal.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let bmi = weight / pow(height, 2)
        bmiVal = String(format: "%.1f", bmi)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

