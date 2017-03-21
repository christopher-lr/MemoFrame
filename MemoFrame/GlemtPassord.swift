//
//  GlemtPassord.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class GlemtPassord: UIViewController {
    
    @IBOutlet weak var beskrivelse: UILabel!
    @IBOutlet weak var epostInput: UITextField!
    @IBOutlet weak var feilmelding: UILabel!
    
    @IBOutlet weak var epostFelt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beskrivelse.text = "Vennligst skriv inn gyldig e-mail adresse under for å få tilsendt et midlertidig passord på e-mail for å denne brukeren. "
        
        feilmelding.isHidden = true
    }
    
 
    @IBAction func glemtPassord(_ sender: UIButton) {
        
        let parameters: Parameters = [
            "email": epostFelt.text!
        ]
  
        //Modifisert header for brukere som vil registrerer
        let headers : HTTPHeaders = [
            "newUser":"newuser"
        ]
        Alamofire.request("http://www.gruppe18.tk:8080",headers:headers).responseJSON { response in

            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let err = JSON.object(forKey: "Error") as! Bool
                if(!err){
                let token = JSON.object(forKey: "Token") as! String
                    
 
                    
                    let headers : HTTPHeaders = [
                        "x-access-token": token
                    ]
                    Alamofire.request("http://www.gruppe18.tk:8080/api/users/reset",method: .post,parameters:parameters,headers:headers).validate().responseJSON { response in
                        
                        
                        if let result = response.result.value {
                            let JSON = result as! NSDictionary
                            let err = JSON.object(forKey: "Error") as! Bool
                            let msg = JSON.object(forKey: "Message") as! String
                            if(!err){
                                //her skal man kunne gå til et annet view, kan bruke msg for å gi brukern melding om at bruker er lagt til.
                                print(msg)
                                
                            }
                             else{
                            print(msg)

                            }
                        }
                        else{
                            //Dersom noe gikk galt ved autentisering av token eller ved å få ny passord
                            print(response.result)
                        }
                }
            }
            else{
                print("Feil oppstod,prøv igjen eller kontakt admin")
            }
        }
      }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
