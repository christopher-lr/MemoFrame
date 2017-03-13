//
//  Registrering.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class Registrering: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Feilmeldingtekst
    // 13.03.2017 forandret variabel fra alder til fødselsdato ettersom dette er mer praktisk mtp at det ikke gir mening å endre alder i brukerinstillinger
    
    @IBOutlet weak var epostFeilmelding: UILabel!
    @IBOutlet weak var fodselsaarFeilmelding: UILabel!
    @IBOutlet weak var passordFeilmelding: UILabel!
    
    // Segmentkontroll og pickerview
    @IBOutlet weak var kjonn: UISegmentedControl!
    @IBOutlet weak var landPicker: UIPickerView!
    let pickerViewElements = ["Norge", "Sverige", "Danmark"]
    
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
        return pickerViewElements[row]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
