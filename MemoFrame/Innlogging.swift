//
//  Innlogging.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Innlogging: UIViewController {
    
    
    // MARK: Ikoner
    @IBOutlet weak var nyBrukerIkon: UIImageView!
    @IBOutlet weak var facebookIkon: UIImageView!
    @IBOutlet weak var kodeIkon: UIImageView!
    @IBOutlet weak var informasjonIkon: UIImageView!
    
    // MARK: Knapper
    @IBOutlet weak var nyBrukerKnapp: UIButton!
    @IBOutlet weak var facebookKnapp: UIButton!
    @IBOutlet weak var kodeKnapp: UIButton!
    @IBOutlet weak var informasjonKnapp: UIButton!
    
    @IBOutlet weak var epost: UITextField!
    @IBOutlet weak var passord: UITextField!
    
    // MARK: Feilmelding
    @IBOutlet weak var feilmelding: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // setter feilmelding til false
        feilmelding.isHidden = true
        
        // setter tilsvarende ikoner
        nyBrukerIkon.image = UIImage (named:"add-contact")
        facebookIkon.image = UIImage (named:"facebook")
        kodeIkon.image = UIImage (named:"code")
        informasjonIkon.image = UIImage (named:"question")
        
        // setter tilsvarende knapper
        nyBrukerKnapp.layer.cornerRadius = 2
        nyBrukerKnapp.layer.borderWidth = 2
        nyBrukerKnapp.layer.borderColor = UIColor.init(red: 230/255, green: 126/255, blue: 34/255, alpha: 0.75).cgColor
        
        facebookKnapp.layer.cornerRadius = 2
        facebookKnapp.layer.borderWidth = 2
        facebookKnapp.layer.borderColor = UIColor.init(red: 45/255, green: 72/255, blue: 155/255, alpha: 0.75).cgColor
        
        kodeKnapp.layer.cornerRadius = 2
        kodeKnapp.layer.borderWidth = 2
        kodeKnapp.layer.borderColor = UIColor.init(red: 155/255, green: 89/255, blue: 182/255, alpha: 0.75).cgColor
        
        informasjonKnapp.layer.cornerRadius = 2
        informasjonKnapp.layer.borderWidth = 2
        informasjonKnapp.layer.borderColor = UIColor.init(red: 67/255, green: 190/255, blue: 204/255, alpha: 0.75).cgColor
        
                
    }
    
    @IBAction func logginn(_ sender: UIButton) {
        
        // verifikasjon med Regex
        let regex = Regex()
        var gyldigEpost: Bool = false
        var gyldigPassord: Bool = false
        var gyldigAlt: Bool = false

        
        if (regex.verifiserEpost(tekst: epost.text!)) {
            gyldigEpost = true
        } else {
            feilmelding.isHidden = false
        }
        if (regex.verifiserPassord(tekst: passord.text!)) {
            gyldigPassord = true
        } else {
            feilmelding.isHidden = false
        }
        if (gyldigEpost && gyldigPassord) {
            gyldigAlt = true
        }

       if (gyldigAlt) {
        let headers : HTTPHeaders = [
            "newUser":"newuser"
        ]
        
        let parameters: Parameters = [
            "email": epost.text!,
            "passord": passord.text!,
            ]
        
        Alamofire.request("http://www.gruppe18.tk:8080",method: .post,headers:headers).validate().responseJSON { response in
            
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let err = JSON.object(forKey: "Error") as! Bool
                if(!err){
                    var token = JSON.object(forKey: "Token") as! String
                    //etter å ha fått token prøver vi å logge inn bruker
                    let headers : HTTPHeaders = [
                        "x-access-token": token
                    ]
                    Alamofire.request("http://www.gruppe18.tk:8080/api/authenticate",method: .post,parameters:parameters,headers:headers).validate().responseJSON { response in
                        
                        
                        if let result = response.result.value {
                            let JSON = result as! NSDictionary
                            let err = JSON.object(forKey: "Error") as? Bool
                            let msg = JSON.object(forKey: "Message") as! String
                            
                            //velykket registrering
                            if(!err!){
                                token = JSON.object(forKey: "Token") as! String
                                //her skal man kunne gå til et annet view, kan bruke msg for å gi brukern melding om at bruker er lagt til.og token for å ta med videre.
                               var array = ["Token":token,"Email":self.epost.text!]
                               
                               self.performSegue(withIdentifier: "Innlogget", sender: array)
         
                            }
                            else{
                                let alert = UIAlertController(title: "Melding", message: msg, preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.present(alert, animated: true, completion: nil)

                            }
                            
                        }
                        else{
                            print(response.result.value)
                        }
                    }
                }
                
            }
            else{
                print("Feil ved inlogging, prøv igjen eller kontakt admin")
                
                // Hvis feil ved innlogging vis "feilmelding" = true
            }
        }
        
        }
    }
    
    // forbereder data til å bli flyttet fra denne viewen tl en annen via en segue
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Innlogget" {
            
            if let destination = segue.destination as? Hovedmeny {
                
                // må være samme type som det variabelen som skal ta imot i det andre viewet
                destination.info = sender as? [String]
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
