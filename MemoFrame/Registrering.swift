//
//  Registrering.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import PopupDialog


class Registrering: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Feilmeldingtekst
    // 13.03.2017 forandret variabel fra alder til fødselsdato ettersom dette er mer praktisk mtp at det ikke gir mening å endre alder i brukerinstillinger
    
    @IBOutlet weak var epostFeilmelding: UILabel!
    @IBOutlet weak var fodselsaarFeilmelding: UILabel!
    @IBOutlet weak var passordFeilmelding: UILabel!
    
    @IBOutlet weak var epostFelt: UITextField!
    
    @IBOutlet weak var fodselsaarFelt: UITextField!
    
    @IBOutlet weak var passordFelt: UITextField!
    
    
    // Segmentkontroll og pickerview
    @IBOutlet weak var kjonn: UISegmentedControl!
    
    @IBOutlet weak var landPicker: UIPickerView!
    
    let pickerViewElements = ["Norge", "Sverige", "Danmark"]
    
    var country : String = "Norge"
    
    var kjonnvalgt = "Mann"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Skjuler feilmeldinger
        
        epostFeilmelding.isHidden = true
        fodselsaarFeilmelding.isHidden = true
        passordFeilmelding.isHidden = true
        
        // Ulike verdier for kjønn
        kjonn.setTitle("Mann", forSegmentAt: 0)
        kjonn.setTitle("Kvinne", forSegmentAt: 1)
        
        // setter delegate og datasource for pickerview
        landPicker.delegate = self
        landPicker.dataSource = self
        

        
    }

    // MARK: pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        country = pickerViewElements[row]
        return pickerViewElements[row]
    }
    
    @IBAction func kjonnValg(_ sender: UISegmentedControl) {
        if(sender.isEnabledForSegment(at: 0))
        {
            kjonnvalgt = "Mann"
            }
        else
        {
            kjonnvalgt = "Kvinne"
        }
        
    }
    
    @IBAction func registrerBruker(_ sender: UIButton) {
        
        let parameters: Parameters = [
            "email": epostFelt.text!,
            "passord": passordFelt.text!,
            "land":country,
            "alder" : fodselsaarFelt.text!,
            "kjonn": kjonnvalgt
        ]
    
        let headers: HTTPHeaders = [
            "X-Requested-With" : "XMLHttpRequest",
            "Accept": "application/json",
            "X-Access-Token": "secretString"
        ]

        Alamofire.request("http://www.gruppe18.tk:8080/api/users", method: .post, parameters: parameters, headers: headers).validate().responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
        
     }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
