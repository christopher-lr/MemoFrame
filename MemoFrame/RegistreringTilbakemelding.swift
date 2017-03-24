//
//  RegistreringTilbakemelding.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegistreringTilbakemelding: UIViewController {
    
    //var passedData: Bruker -> egentlig skal ta imot en brukerklasse og bruke dets get metoder for å putte i de ulike labelene
    
    @IBOutlet weak var epostTilbakemelding: UILabel!
    @IBOutlet weak var fodselsaar: UILabel!
    @IBOutlet weak var kjonn: UILabel!
    @IBOutlet weak var land: UILabel!
    @IBOutlet weak var passord: UILabel!
    
    var passedData: [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (key, value) in passedData {
            if(key == "email"){
                epostTilbakemelding.text = value
                }
            else if(key == "passord"){
                passord.text = value
            }
            else if(key == "land"){
                land.text = value
            }
            else if(key == "alder"){
                fodselsaar.text = value
            }
            else if(key == "kjonn"){
                kjonn.text = value
            }
        }
    }
    @IBAction func sendInfo(_ sender: UIButton) {
       
        var parameters: Parameters = [
            "email":"",
            "passord": "",
            "land":"",
            "alder" :"" ,
            "kjonn": ""
        ]
        for (key, value) in passedData {
            if(key == "email"){
                parameters.updateValue(value, forKey: key)
            }
            else if(key == "passord"){
                parameters.updateValue(value, forKey: key)
            }
            else if(key == "land"){
                parameters.updateValue(value, forKey: key)
            }
            else if(key == "alder"){
                parameters.updateValue(value, forKey: key)
            }
            else if(key == "kjonn"){
                parameters.updateValue(value, forKey: key)
            }
        }

        
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
                    //etter å ha fått token prøver vi å registrere en bruker
                    
                    let headers : HTTPHeaders = [
                        "x-access-token": token
                    ]
                    Alamofire.request("http://www.gruppe18.tk:8080/api/users/sendInfo",method: .post,parameters:parameters,headers:headers)
                    
                    let alert = UIAlertController(title: "Melding", message: "Informasjonen ble sendt til din registrerte email!", preferredStyle: UIAlertControllerStyle.alert)

                    self.present(alert, animated: true, completion: nil)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        switch action.style{
                        case .default:
                            //sleep(5)
                            self.performSegue(withIdentifier: "ok", sender: nil)
                            
                        case .cancel:
                            print("cancel")
                            
                        case .destructive:
                            print("destructive")
                        }
                    }))
                    }
                
                }
                    //dersom første token feiler
                else{
                    print("Melding ble ikke sendt")
                }
            } // <-- Slutt av if statement? trenger å gjøre mer ryddig
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
