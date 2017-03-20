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
import JWT
import CryptoSwift


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
     
        //sett inn regex som sjekker alle verdier er riktig så legg inn parameters
        
        let parameters: Parameters = [
            "email": epostFelt.text!,
            "passord": passordFelt.text!,
            "land":country,
            "alder" : fodselsaarFelt.text!,
            "kjonn": kjonnvalgt
        ]
        
    //Modifisert header for brukere som vil registrerer
         let headers : HTTPHeaders = [
            "newUser":"newuser"
        ]
        //gjør kall til server for å få en token
        Alamofire.request("http://www.gruppe18.tk:8080",headers:headers).responseJSON { response in
   
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let err = JSON.object(forKey: "Error") as! Bool
                if(!err){
                  let token = JSON.object(forKey: "Token") as! String
                    //etter å ha fått token prøver vi å registrere en bruker
                    
                    let headers : HTTPHeaders = [
                        "x-access-token": token
                    ]
                    
                    Alamofire.request("http://www.gruppe18.tk:8080/api/users",method: .post,parameters:parameters,headers:headers).validate().responseJSON { response in
                        

                        if let result = response.result.value {
                            let JSON = result as! NSDictionary
                            let err = JSON.object(forKey: "Error") as! Bool
                            let msg = JSON.object(forKey: "Message") as! String
                            //velykket registrering
                            if(!err){
                                //her skal man kunne gå til et annet view, kan bruke msg for å gi brukern melding om at bruker er lagt til.
                                print(msg)
                                
                            }
                            else{
                                //blir på samme view men brukeren får opp meling fra varabelen msg
                                if(msg.isEmpty)
                                {
                                    print("Registrering feilet, prøv igjen eller kontakt admin")
                            }else{
                                print(msg)
                             }
                            }
                        }
                    }
                }
                    //dersom første token feiler
                else{
              print(response)
             }
      }
    }
     
   
       
        
 
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
