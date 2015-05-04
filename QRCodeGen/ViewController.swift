//
//  ViewController.swift
//  QRCodeGen
//
//  Created by Gabriel Theodoropoulos on 27/4/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imgQRCode: UIImageView!
    
    @IBOutlet weak var btnAction: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    
    var qrcodeImage: CIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: IBAction method implementation
    
    @IBAction func performButtonAction(sender: AnyObject) {
        if qrcodeImage == nil {
            if textField.text == "" {
                return
            }
            
            let data = textField.text.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("Q", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter.outputImage
            
            textField.resignFirstResponder()
            
            btnAction.setTitle("Clear", forState: UIControlState.Normal)
            
            displayQRCodeImage()
        }
        else {
            imgQRCode.image = nil
            qrcodeImage = nil
            btnAction.setTitle("Generate", forState: UIControlState.Normal)
        }
        
        textField.enabled = !textField.enabled
        slider.hidden = !slider.hidden
    }
    
    
    @IBAction func changeImageViewScale(sender: AnyObject) {
        imgQRCode.transform = CGAffineTransformMakeScale(CGFloat(slider.value), CGFloat(slider.value))
    }
    
    
    // MARK: Custom method implementation
    
    func displayQRCodeImage() {
        let scaleX = imgQRCode.frame.size.width / qrcodeImage.extent().size.width
        let scaleY = imgQRCode.frame.size.height / qrcodeImage.extent().size.height
        
        let transformedImage = qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        imgQRCode.image = UIImage(CIImage: transformedImage)
    }
    

}

