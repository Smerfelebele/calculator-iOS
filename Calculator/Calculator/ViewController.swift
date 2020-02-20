//
//  ViewController.swift
//  Calculator
//
//  Created by Administrator on 23/01/2020.
//  Copyright © 2020 Katedra Radiokomunikacji. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var calculatorValue: Double? = 0.0;
    var multiplyOperation: Bool = false;
    var addOperation: Bool = false;
    var minusOperation: Bool = false;
    var divideOperation: Bool = false;
    var moduloOperation: Bool = false;
    
    var globalValueButton: Bool = false;
    
    var firstValue: Double? = 0.0;
    var secondValue: Double? = 0.0;

    @IBOutlet weak var calculationScreen: UITextField!
    @IBAction func numbers(_ sender: UIButton) {

            if globalValueButton
            {
            calculationScreen.text = "";
                globalValueButton = false;
            }

        
            calculationScreen.text = calculationScreen.text! + String(sender.tag);
            calculatorValue = Double(calculationScreen.text!)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func operationalButton(_ sender: UIButton) {
        
        if (firstValue == 0 || firstValue == 0.0)
        {
            firstValue = Double (calculationScreen.text!);
            addSign(tag: sender.tag);
        }
        else
        {
            secondValue = Double(calculationScreen.text!);
            isEqual();
            addSign(tag: sender.tag);
            secondValue = 0;
        }
    }
    
    @IBAction func dotButton(_ sender: Any) {
        calculationScreen.text = calculationScreen.text! + ".";
    }
    
    @IBAction func clearButton(_ sender: Any) {
        firstValue = 0.0;
        secondValue = 0.0;
        calculationScreen.text = "";
    }
    
    @IBAction func oppositeValue(_ sender: Any) {
        var tempValue = Double(calculationScreen.text!);
        tempValue = tempValue!*(-1);
        calculationScreen.text = String(describing: tempValue!);
    }
    
    @IBAction func sinButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
        var tempValue = Double(calculationScreen.text!);
        
        tempValue = sin(tempValue!);
        calculationScreen.text = String(describing: tempValue!);
        }
    }
    
    @IBAction func cosButton(_ sender: Any) {
        
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            tempValue = cos(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func tgButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            tempValue = tan(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func ctgButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = cos(tempValue!)/sin(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func asinButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
        
            tempValue = asin(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func acosButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = acos(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func atgButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = atan(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    
    @IBAction func piButton(_ sender: Any) {
        calculationScreen.text = String(describing: Double.pi);
    }
    @IBAction func lnButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = log(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    
    @IBAction func sqrtButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = sqrt(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func pow2Button(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = pow(tempValue!,2);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    @IBAction func pow3Button(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = pow(tempValue!,3);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    
    @IBAction func logButton(_ sender: Any) {
        if(Double(calculationScreen.text!) != nil){
            var tempValue = Double(calculationScreen.text!);
            
            tempValue = log10(tempValue!);
            calculationScreen.text = String(describing: tempValue!);
        }
    }
    
    func isEqual() -> Void
    {
        if addOperation == true
        {
            firstValue=firstValue! + secondValue!;
            calculationScreen.text = String (describing: firstValue!);
            addOperation = false;
        }
        else if minusOperation == true
        {
            firstValue=firstValue! - secondValue!;
            calculationScreen.text = String (describing: firstValue!);
            minusOperation = false;
        }
        else if multiplyOperation == true
        {
            firstValue=firstValue! * secondValue!;
            calculationScreen.text = String (describing: firstValue!);
            multiplyOperation = false;
        }
        else if divideOperation == true
        {
            firstValue=firstValue! / secondValue!;
            calculationScreen.text = String (describing: firstValue!);
            divideOperation = false;
        }
        else if moduloOperation == true
        {
            firstValue = firstValue!.truncatingRemainder(dividingBy: secondValue!);
            calculationScreen.text = String (describing: firstValue!);
            moduloOperation = false;
        }
    }
    
    func addSign(tag: Int) -> Void
    {
        globalValueButton = true;
        if tag == 20
        {
            calculationScreen.text = calculationScreen.text! + "+";
            addOperation  = true;
        }
        else if tag == 21
        {
            calculationScreen.text = calculationScreen.text! + "-";
            minusOperation = true;
            //calculationScreen.text = calculationScreen.text! + "-";
        }
        else if tag == 22
        {
            calculationScreen.text = calculationScreen.text! + "*";
            multiplyOperation = true;

        }
        else if tag == 23
        {
            calculationScreen.text = calculationScreen.text! + "/";
            divideOperation = true;
        }
        else if tag == 26
        {
            calculationScreen.text = calculationScreen.text! + "%";
            moduloOperation = true;
            
        }
    }
}

