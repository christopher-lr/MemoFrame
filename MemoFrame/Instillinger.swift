//
//  Instillinger.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 13.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import UIKit

class Instillinger: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Speaker/Mute
    @IBOutlet weak var lydAktivertKnapp: UIButton!
    @IBOutlet weak var lydDeaktivertKnapp: UIButton!
    
    // PickerView
    @IBOutlet weak var spraakPicker: UIPickerView!
    let pickerViewElements = ["Norsk", "Engelsk"]
    
    // Segmentkontroll
    @IBOutlet weak var fargeblindStotte: UISegmentedControl!
    @IBOutlet weak var lydStotte: UISegmentedControl!
    
    // Beskrivelse
    @IBOutlet weak var beskrivelse: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lydDeaktivertKnapp.isHidden = true
        
        // setter delegate og datasource for pickerview
        spraakPicker.delegate = self
        spraakPicker.dataSource = self
        
        // Segmentkontroll
        fargeblindStotte.setTitle("Av", forSegmentAt: 0)
        fargeblindStotte.setTitle("På", forSegmentAt: 1)
        lydStotte.setTitle("Av", forSegmentAt: 0)
        lydStotte.setTitle("På", forSegmentAt: 1)
        
    }
    
    // MARK: Speaker/mute
    @IBAction func deaktiver(_ sender: Any) {
        
        lydAktivertKnapp.isHidden = true
        lydDeaktivertKnapp.isHidden = false
    }
    
    @IBAction func aktiver(_ sender: Any) {
        
        lydAktivertKnapp.isHidden = false
        lydDeaktivertKnapp.isHidden = true
    }
    
    // MARK: PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewElements[row]
    }
    
    // MARK: Beskrivelse knapper
    
    @IBAction func fargeblindstotteKnapp(_ sender: Any) {
        
        beskrivelse.text = "Skru på støttefunksjonalitet for fargeblinde. Dette vil endre fargene på applikasjonen og testene."
    }
    
    @IBAction func lydstotteKnapp(_ sender: Any) {
        
        beskrivelse.text = "Skru på støttefunksjonalitet for lydtale. Dette vil aktiver lydtalefunksjonen som leser opp oppgaveteksten i de ulike testene."
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
