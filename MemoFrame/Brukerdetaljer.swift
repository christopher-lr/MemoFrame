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
    
    
}
