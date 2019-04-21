//
//  ViewController.swift
//  2019_ios_HW7
//
//  Created by 王心妤 on 2019/4/19.
//  Copyright © 2019年 river. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var botView: UIView!
    
    @IBOutlet weak var partPicker: UIPickerView!
    
    @IBOutlet weak var redPicker: UISlider!
    @IBOutlet weak var greenPicker: UISlider!
    @IBOutlet weak var bluePicker: UISlider!
    @IBOutlet weak var alphaPicker: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    
    @IBAction func randomBuild(_ sender: Any) {
        topView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        botView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        redLabel.text = String(format: "%.0f", redPicker.value)
        blueLabel.text = String(format: "%.0f", bluePicker.value)
        greenLabel.text = String(format: "%.0f", greenPicker.value)
        alphaLabel.text = String(format: "%.2f", alphaPicker.value)
        if partPicker.selectedRow(inComponent: 0) == 0{
            topView.backgroundColor = UIColor(red: CGFloat(redPicker.value/255), green: CGFloat(greenPicker.value/255), blue: CGFloat(bluePicker.value/255), alpha: CGFloat(alphaPicker.value))
        }else{
            botView.backgroundColor = UIColor(red: CGFloat(redPicker.value/255), green: CGFloat(greenPicker.value/255), blue: CGFloat(bluePicker.value/255), alpha: CGFloat(alphaPicker.value))
        }
    }
    func buildMask(view: UIView, name: String){
        let image = UIImage(named: name)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: 375, height: 200))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        view.frame = imageView.bounds
        view.mask = imageView
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0{
            return "上面"
        }else{
            return "下面"
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildMask(view: topView, name: "vueLogoTop.png")
        buildMask(view: botView, name: "vueLogoBot.png")
        topView.backgroundColor = UIColor(red: CGFloat(57.0/255), green: CGFloat(73.0/255), blue: CGFloat(92.0/255), alpha: CGFloat(1))
        botView.backgroundColor = UIColor(red: CGFloat(100.0/255), green: CGFloat(181.0/255), blue: CGFloat(135.0/255), alpha: CGFloat(1))
        partPicker.delegate = self
        partPicker.dataSource = self
    }


}

