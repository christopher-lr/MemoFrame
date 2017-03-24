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
        
        var regex = Regex();
        
        if (regex.verifiserEpost(tekst: epostFelt.text!) && epostFelt != nil) {
            
        let parameters: Parameters = [
            "email": epostFelt.text!
        ]
  
        //Modifisert header for brukere som vil registrerer
        let headers : HTTPHeaders = [
            "newUser":"newuser"
        ]
        Alamofire.request("http://www.gruppe18.tk:8080",headers:headers).responseJSON { response in

            let parameters: Parameters = [
                "email": self.epostFelt.text!
                ]
            
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
                                let alert = UIAlertController(title: "Melding", message: msg, preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
                                self.present(alert, animated: true, completion: nil)
                                
                                
                            }
                             else{
                                let alert = UIAlertController(title: "Melding", message: msg, preferredStyle: UIAlertControllerStyle.alert)
                                
                                self.present(alert, animated: true, completion: nil)
                                
                               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:  { action in
                                    switch action.style{
                                    case .default:
                                        self.dismiss(animated: true, completion: nil)
                                        
                                    case .cancel:
                                        print("cancel")
                                        
                                    case .destructive:
                                        print("destructive")
                                    }
                                }))
                                print(msg)

                            }
                        }
                        else{
                            //Dersom noe gikk galt ved autentisering av token eller ved å få ny passord
                            let alert = UIAlertController(title: "Melding", message: "Feil ved å motta token,prøv igjen eller kontakt support.", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                           
                           
                        }
                }
            }
            else{
                    let alert = UIAlertController(title: "Melding", message: "Feil oppstod,prøv igjen eller kontakt admin", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
                  
                    
                
            }
        }
      }
    }
            //dersom feil tastet email feiler
        else{
            
           feilmelding.isHidden = false
        }
  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
