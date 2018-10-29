//
//  ViewController.swift
//  PickerView
//
//  Created by Tu Doan on 02/10/2018.
//  Copyright © 2018 DoanVantu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblSelectedItem: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    var vps = ["Rose", "Lily", "Holly", "Daisy", "Alyssum", "Violet", "Ivy"]
    let rowHeight:CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.selectRow(vps.count/2, inComponent: 0, animated: true) //hien ra phan tu o giua mang luon
        lblSelectedItem.text = vps[vps.count/2]
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MASK-UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vps.count
    }
    //MASK-UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vps[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblSelectedItem.text = vps[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label:UILabel?
        if (view == nil) {
            label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: pickerView.frame.width, height: rowHeight))
        } else {
            label = view as? UILabel
        }
        label!.text = vps[row]
        label?.textAlignment = .center
        label?.font = UIFont.boldSystemFont(ofSize: 18)
        label?.textColor = UIColor.white
        label?.backgroundColor = UIColor.darkGray
        return label! // ! dam bao label khac nil
    }


}

