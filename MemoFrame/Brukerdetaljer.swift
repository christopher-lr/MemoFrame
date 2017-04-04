//
//  Brukerdetaljer.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 13.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class Brukerdetaljer: UIViewController {
    
    //MARK: Feilmelding
    @IBOutlet weak var emailFeilmelding: UILabel!
    @IBOutlet weak var repeterEmailFeilmelding: UILabel!
    @IBOutlet weak var passordFeilmelding: UILabel!
    @IBOutlet weak var repeterPassordFeilmelding: UILabel!
    
    
    @IBOutlet weak var epostFelten: UITextField!
    
    @IBOutlet weak var epostFeltto: UITextField!
    
    @IBOutlet weak var gammelPassord: UITextField!
    
    @IBOutlet weak var nyPassord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailFeilmelding.isHidden = true
        repeterEmailFeilmelding.isHidden = true
        passordFeilmelding.isHidden = true
        repeterPassordFeilmelding.isHidden = true
    }
    
    /* Funksjoner for å endre feilmelding */
    
    /* Hvis email eller passord er feil/ikke følger regex vis = "Du må taste dette mønsteret osv osv"
 
       Hvis email eller passord er samme som før vis = "Vennligst velg et nytt passord/email enn den gamle som er registrert"
 
    */ 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endre(_ sender: UIButton) {
        
        emailFeilmelding.isHidden = true
        repeterEmailFeilmelding.isHidden = true
        passordFeilmelding.isHidden = true
        repeterPassordFeilmelding.isHidden = true
        
    let regex = Regex()
        var epost :Bool = false
        var veriepost:Bool = false
        var likeEmail :Bool = false
        var pass: Bool = false
        
    if(regex.verifiserEpost(tekst: epostFelten.text!)){
    epost = true
     }
    if(regex.verifiserEpost(tekst: epostFeltto.text!)){
    veriepost = true
     }
     if(epostFelten == epostFeltto){
        likeEmail = true
    }
    if(gammelPassord.text! != nil && nyPassord.text! != nil){
            pass = true
        }
     if(!epost){
        emailFeilmelding.isHidden = false
    }
    if(!veriepost){
            repeterEmailFeilmelding.isHidden = false
        }
    if(!likeEmail){
            repeterEmailFeilmelding.isHidden = false
    }
    if(!pass){
        passordFeilmelding.isHidden = false
        repeterPassordFeilmelding.isHidden = false
        }
    else if(epost && veriepost && likeEmail && pass) {
        //her kommer kode for å endre passord. MERK: det er enda ikke sjekket om passord er riktig!
        
        let alert = UIAlertController(title: "Melding", message: "Passord oppdatert!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        print("ok")
        }
        
 }
}
