//
//  CustomColorViewController.swift
//  BLENOX2Demo-Swift
//
//  Created by jie yang on 2021/3/18.
//  Copyright © 2021 medica. All rights reserved.
//

import UIKit

class CustomColorViewController: UIViewController {
    
    // 颜色1
    @IBOutlet weak var color1Label: UILabel!
    @IBOutlet weak var color1R: UITextField!
    @IBOutlet weak var color1G: UITextField!
    @IBOutlet weak var color1B: UITextField!
    @IBOutlet weak var color1W: UITextField!
    @IBOutlet weak var color1Send: UIButton!
    @IBOutlet weak var color1Clean: UIButton!
    
    // 颜色2
    @IBOutlet weak var color2Label: UILabel!
    @IBOutlet weak var color2R: UITextField!
    @IBOutlet weak var color2G: UITextField!
    @IBOutlet weak var color2B: UITextField!
    @IBOutlet weak var color2W: UITextField!
    @IBOutlet weak var color2Send: UIButton!
    @IBOutlet weak var color2Clean: UIButton!
    
    // 颜色3
    @IBOutlet weak var color3Label: UILabel!
    @IBOutlet weak var color3R: UITextField!
    @IBOutlet weak var color3G: UITextField!
    @IBOutlet weak var color3B: UITextField!
    @IBOutlet weak var color3W: UITextField!
    @IBOutlet weak var color3Send: UIButton!
    @IBOutlet weak var color3Clean: UIButton!
    
    // 颜色4
    @IBOutlet weak var color4Label: UILabel!
    @IBOutlet weak var color4R: UITextField!
    @IBOutlet weak var color4G: UITextField!
    @IBOutlet weak var color4B: UITextField!
    @IBOutlet weak var color4W: UITextField!
    @IBOutlet weak var color4Send: UIButton!
    @IBOutlet weak var color4Clean: UIButton!
    
    // 颜色5
    @IBOutlet weak var color5Label: UILabel!
    @IBOutlet weak var color5R: UITextField!
    @IBOutlet weak var color5G: UITextField!
    @IBOutlet weak var color5B: UITextField!
    @IBOutlet weak var color5W: UITextField!
    @IBOutlet weak var color5Send: UIButton!
    @IBOutlet weak var color5Clean: UIButton!
    
    // 颜色6
    @IBOutlet weak var color6Label: UILabel!
    @IBOutlet weak var color6R: UITextField!
    @IBOutlet weak var color6G: UITextField!
    @IBOutlet weak var color6B: UITextField!
    @IBOutlet weak var color6W: UITextField!
    @IBOutlet weak var color6Send: UIButton!
    @IBOutlet weak var color6Clean: UIButton!
    
    // 颜色7
    @IBOutlet weak var color7Label: UILabel!
    @IBOutlet weak var color7Lum: UILabel!
    
    var cleaned = false
    
    var colorList: Array<WaveCustomColor>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()

        self.setUI()
    }
    
    func getColorList() -> [WaveCustomColor] {
        // 颜色
        var colorList: [WaveCustomColor] =  Array()
        
        var color1 = WaveCustomColor.init()
        color1.colorId = 0;
        var colorLight = SLPLight.init()
        colorLight.r = 255;
        colorLight.g = 0;
        colorLight.b = 0;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 255;
        colorLight.g = 100;
        colorLight.b = 0;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 0;
        colorLight.g = 255;
        colorLight.b = 255;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 0;
        colorLight.g = 125;
        colorLight.b = 255;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 125;
        colorLight.g = 0;
        colorLight.b = 255;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 155;
        colorLight.g = 32;
        colorLight.b = 93;
        colorLight.w = 255;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        color1 = WaveCustomColor.init()
        color1.colorId = 0;
        colorLight = SLPLight.init()
        colorLight.r = 255;
        colorLight.g = 0;
        colorLight.b = 0;
        colorLight.w = 0;
        color1.light = colorLight;
        color1.valid = 1;
        colorList.append(color1)
        
        return colorList
    }
    
    func initData() -> Void {
        self.colorList = self.getColorList()
    }
    
    func initColorField() -> Void {
        let color1 = self.colorList![0]
        if color1.valid == 1 {
            self.color1R.text = String(format: "%d", color1.light.r)
            self.color1G.text = String(format: "%d", color1.light.g)
            self.color1B.text = String(format: "%d", color1.light.b)
            self.color1W.text = String(format: "%d", color1.light.w)
        } else {
            self.color1R.text = ""
            self.color1G.text = ""
            self.color1B.text = ""
            self.color1W.text = ""
        }
        
        let color2 = self.colorList![0]
        if color2.valid == 1 {
            self.color2R.text = String(format: "%d", color2.light.r)
            self.color2G.text = String(format: "%d", color2.light.g)
            self.color2B.text = String(format: "%d", color2.light.b)
            self.color2W.text = String(format: "%d", color2.light.w)
        } else {
            self.color2R.text = ""
            self.color2G.text = ""
            self.color2B.text = ""
            self.color2W.text = ""
        }
        
        let color3 = self.colorList![0]
        if color1.valid == 1 {
            self.color3R.text = String(format: "%d", color3.light.r)
            self.color3G.text = String(format: "%d", color3.light.g)
            self.color3B.text = String(format: "%d", color3.light.b)
            self.color3W.text = String(format: "%d", color3.light.w)
        } else {
            self.color3R.text = ""
            self.color3G.text = ""
            self.color3B.text = ""
            self.color3W.text = ""
        }
        
        let color4 = self.colorList![0]
        if color4.valid == 1 {
            self.color4R.text = String(format: "%d", color4.light.r)
            self.color4G.text = String(format: "%d", color4.light.g)
            self.color4B.text = String(format: "%d", color4.light.b)
            self.color4W.text = String(format: "%d", color4.light.w)
        } else {
            self.color4R.text = ""
            self.color4G.text = ""
            self.color4B.text = ""
            self.color4W.text = ""
        }
        
        let color5 = self.colorList![0]
        if color1.valid == 1 {
            self.color5R.text = String(format: "%d", color5.light.r)
            self.color5G.text = String(format: "%d", color5.light.g)
            self.color5B.text = String(format: "%d", color5.light.b)
            self.color5W.text = String(format: "%d", color5.light.w)
        } else {
            self.color5R.text = ""
            self.color5G.text = ""
            self.color5B.text = ""
            self.color5W.text = ""
        }
        
        let color6 = self.colorList![0]
        if color6.valid == 1 {
            self.color6R.text = String(format: "%d", color6.light.r)
            self.color6G.text = String(format: "%d", color6.light.g)
            self.color6B.text = String(format: "%d", color6.light.b)
            self.color6W.text = String(format: "%d", color6.light.w)
        } else {
            self.color6R.text = ""
            self.color6G.text = ""
            self.color6B.text = ""
            self.color6W.text = ""
        }
    }
    
    func setUI() -> Void {
        self.initColorField()
        
        self.color1Label.text = String(format: "%@ 1", NSLocalizedString("color", comment: ""))
        self.color2Label.text = String(format: "%@ 2", NSLocalizedString("color", comment: ""))
        self.color3Label.text = String(format: "%@ 3", NSLocalizedString("color", comment: ""))
        self.color4Label.text = String(format: "%@ 4", NSLocalizedString("color", comment: ""))
        self.color5Label.text = String(format: "%@ 5", NSLocalizedString("color", comment: ""))
        self.color6Label.text = String(format: "%@ 6", NSLocalizedString("color", comment: ""))
        self.color7Label.text = String(format: "%@ 7(%@)", NSLocalizedString("color", comment: ""), NSLocalizedString("noCustom", comment: ""))
        
        self.color7Lum.text = NSLocalizedString("liuguang", comment: "")
        
        self.color1Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        self.color2Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        self.color3Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        self.color4Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        self.color5Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        self.color6Send.setTitle(NSLocalizedString("预览", comment: ""), for: UIControl.State.normal)
        
        self.color1Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        self.color2Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        self.color3Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        self.color4Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        self.color5Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        self.color6Clean.setTitle(NSLocalizedString("cleanColor", comment: ""), for: UIControl.State.normal)
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightButton.setTitle(NSLocalizedString("save", comment: ""), for: UIControl.State.normal)
        rightButton.addTarget(self, action: #selector(rightClick), for: UIControl.Event.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    @objc func rightClick() -> Void {
        SLPBLEManager.shared()?.bleNox(DataManager.shared()?.peripheral, waveColorListConfig: self.colorList!, timeout: 0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed {
                Utils.showMessage(NSLocalizedString("save_succeed", comment: ""), controller: self)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                Utils.showDeviceOperationFailed(-1, at: self)
            }
        })
    }
    
    func cleanColor(_ colorId: Int) -> Void {
        if !self.cleaned {
            let alertVc = UIAlertController(title: "清空灯光颜色", message: "清空后用户挥手控制灯光时不再出现此颜色的灯光，是否确认删除此颜色的灯光？", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                    let okAction = UIAlertAction(title: "确定", style: .default, handler: {
                        action in
                        let color = self.colorList![colorId]
                        color.valid = 0
                        if colorId == 0 {
                            self.color1R.text = ""
                            self.color1G.text = ""
                            self.color1B.text = ""
                            self.color1W.text = ""
                        } else if colorId == 1 {
                            self.color2R.text = ""
                            self.color2G.text = ""
                            self.color2B.text = ""
                            self.color2W.text = ""
                        } else if colorId == 2 {
                            self.color3R.text = ""
                            self.color3G.text = ""
                            self.color3B.text = ""
                            self.color3W.text = ""
                        } else if colorId == 3 {
                            self.color4R.text = ""
                            self.color4G.text = ""
                            self.color4B.text = ""
                            self.color4W.text = ""
                        } else if colorId == 4 {
                            self.color5R.text = ""
                            self.color5G.text = ""
                            self.color5B.text = ""
                            self.color5W.text = ""
                        } else if colorId == 5 {
                            self.color6R.text = ""
                            self.color6G.text = ""
                            self.color6B.text = ""
                            self.color6W.text = ""
                        }
                    })
            alertVc.addAction(cancelAction)
            alertVc.addAction(okAction)
            self.present(alertVc, animated: true, completion: nil)
            self.cleaned = true
            return
        }
        
        var validCount = 0
        for color in self.colorList! {
            if color.valid == 1 {
                validCount = validCount + 1
            }
        }
        
        if validCount <= 3 {
            Utils.showMessage(NSLocalizedString("不得少于3种颜色", comment: ""), controller: self)
            return
        }
        
        let color = self.colorList![colorId]
        color.valid = 0
    }
    
    func sendColor(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ w: UInt8, _ colorId: Int) -> Void {
        let isOpen = SLPBLEManager.shared()?.blueToothIsOpen()
        if !(isOpen!) {
            Utils.showMessage(NSLocalizedString("phone_bluetooth_not_open", comment: ""), controller: self);
            return
        }
        
        let light = SLPLight()
        light.r = r
        light.g = g
        light.b = b
        light.w = w
        SLPBLEManager.shared()?.bleNox(DataManager.shared()?.peripheral, operationCode: 1, previewCustomColor: light, timeout: 0, completion: { (status: SLPDataTransferStatus, data: Any?) in
            if status != SLPDataTransferStatus.succeed {
                Utils.showDeviceOperationFailed(-1, at: self)
            }
        })
    }
    
    @IBAction func sendColor1(_ sender: Any) {
        let valueR = self.color1R.text!.count > 0
        let valueG = self.color1G.text!.count > 0
        let valueB = self.color1B.text!.count > 0
        let valueW = self.color1W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color1R.text!)
            let g = UInt8(self.color1G.text!)
            let b = UInt8(self.color1B.text!)
            let w = UInt8(self.color1W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor1(_ sender: Any) {
        self.cleanColor(0)
    }
    
    
    @IBAction func sendColor2(_ sender: Any) {
        let valueR = self.color2R.text!.count > 0
        let valueG = self.color2G.text!.count > 0
        let valueB = self.color2B.text!.count > 0
        let valueW = self.color2W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color2R.text!)
            let g = UInt8(self.color2G.text!)
            let b = UInt8(self.color2B.text!)
            let w = UInt8(self.color2W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor2(_ sender: Any) {
        self.cleanColor(1)
    }
    
    @IBAction func sendColor3(_ sender: Any) {
        let valueR = self.color3R.text!.count > 0
        let valueG = self.color3G.text!.count > 0
        let valueB = self.color3B.text!.count > 0
        let valueW = self.color3W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color3R.text!)
            let g = UInt8(self.color3G.text!)
            let b = UInt8(self.color3B.text!)
            let w = UInt8(self.color3W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor3(_ sender: Any) {
        self.cleanColor(2)
    }
    
    @IBAction func sendColor4(_ sender: Any) {
        let valueR = self.color4R.text!.count > 0
        let valueG = self.color4G.text!.count > 0
        let valueB = self.color4B.text!.count > 0
        let valueW = self.color4W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color4R.text!)
            let g = UInt8(self.color4G.text!)
            let b = UInt8(self.color4B.text!)
            let w = UInt8(self.color4W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor4(_ sender: Any) {
        self.cleanColor(3)
    }
    
    @IBAction func sendColor5(_ sender: Any) {
        let valueR = self.color5R.text!.count > 0
        let valueG = self.color5G.text!.count > 0
        let valueB = self.color5B.text!.count > 0
        let valueW = self.color5W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color5R.text!)
            let g = UInt8(self.color5G.text!)
            let b = UInt8(self.color5B.text!)
            let w = UInt8(self.color5W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor5(_ sender: Any) {
        self.cleanColor(4)
    }
    
    @IBAction func sendColor6(_ sender: Any) {
        let valueR = self.color6R.text!.count > 0
        let valueG = self.color6G.text!.count > 0
        let valueB = self.color6B.text!.count > 0
        let valueW = self.color6W.text!.count > 0
        if valueR && valueG && valueB && valueW {
            let r = UInt8(self.color6R.text!)
            let g = UInt8(self.color6G.text!)
            let b = UInt8(self.color6B.text!)
            let w = UInt8(self.color6W.text!)
            
            let rValid = (r! >= 0) && (r! <= 255);
            let gValid = (g! >= 0) && (g! <= 255);
            let bValid = (b! >= 0) && (b! <= 255);
            let wValid = (w! >= 0) && (w! <= 255);
            if !(rValid && gValid && bValid && wValid)  {
                Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
                return
            }
            
            self.sendColor(r!, g!, b!, w!, 0)
        } else {
            Utils.showMessage(NSLocalizedString("input_0_255", comment: ""), controller: self)
        }
    }
    
    @IBAction func cleanColor6(_ sender: Any) {
        self.cleanColor(5)
    }
}
