//
//  ViewController.swift
//  colorExample0128
//
//  Created by min-chia on 2019/1/28.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var ramdonButton: UIButton!
    @IBOutlet weak var bkColor: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var gradientLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func gradientSliderChange(_ sender: Any) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        if gradientSwitch.isOn{
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            gradientSlider.isEnabled = true
            
            gradientLayer.colors = [UIColor.orange.cgColor,UIColor.orange.cgColor, UIColor.yellow.cgColor]
            var slider = Float.random(in: 0...1)
            slider = gradientSlider.value
            gradientLayer.locations = [0, slider, 1] as [NSNumber]
            gradientView.layer.addSublayer(gradientLayer)
            gradientView.layer.isHidden = false
            gradientLabel.text = String(format:"%.2f", gradientSlider.value)
        }else{
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            gradientSlider.isEnabled = false
            
            bkColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            gradientView.layer.isHidden = true
            redLabel.text = String(format:"%.2f", redSlider.value)
            greenLabel.text = String(format:"%.2f", greenSlider.value)
            blueLabel.text = String(format:"%.2f", blueSlider.value)
            alphaLabel.text = String(format:"%.2f", alphaSlider.value)
        }
    }
    @IBAction func randomButtonPress(_ sender: Any) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        if gradientSwitch.isOn == true {
            redSlider.isEnabled = false
            greenSlider.isEnabled = false
            blueSlider.isEnabled = false
            alphaSlider.isEnabled = false
            gradientSlider.isEnabled = true
            gradientLayer.colors = [UIColor.orange.cgColor,UIColor.orange.cgColor, UIColor.yellow.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientSlider.value = Float.random(in: 0...1)
            gradientLayer.locations = [0, gradientSlider.value, 1] as [NSNumber]
            gradientView.layer.addSublayer(gradientLayer)
            gradientView.layer.isHidden = false
            gradientLabel.text = String(format:"%.2f", gradientSlider.value)
        }else{
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            gradientSlider.isEnabled = false
            var arr3 = [Float]()
            arr3.append(Float.random(in: 0...1))
            arr3.append(Float.random(in: 0...1))
            arr3.append(Float.random(in: 0...1))
            arr3.append(Float.random(in: 0...1))
            redSlider.value = arr3[0]
            greenSlider.value = arr3[1]
            blueSlider.value = arr3[2]
            alphaSlider.value = arr3[3]
            bkColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            gradientView.layer.isHidden = true
            redLabel.text = String(format:"%.2f", redSlider.value)
            greenLabel.text = String(format:"%.2f", greenSlider.value)
            blueLabel.text = String(format:"%.2f", blueSlider.value)
            alphaLabel.text = String(format:"%.2f", alphaSlider.value)
        }
    }
}

