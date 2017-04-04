//
//  Demo.swift
//  MemoFrame
//
//  Created by Muddasar Hussain on 30.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Demo: UIViewController{
    
    
    @IBOutlet weak var neste: UIButton!

    @IBOutlet weak var avslutt: UIButton!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var svar: UIButton!
    
    @IBOutlet weak var bildeRamme: UIImageView!
    
    @IBOutlet var samling: [UIImageView]!
    
    @IBOutlet weak var poeng: UILabel!
    
    @IBOutlet weak var poengsum: UILabel!
    
    @IBOutlet weak var bilde: UILabel!
    
    @IBOutlet weak var bildenr: UILabel!
    
    private var bildeArray: [UIImage] = []
    
    private var label: UILabel? = nil
    
    private var startKnapp: Bool = false
    
    private var bilder:[UIImage] = []
    
    private var imageIndex: NSInteger = 0
    
    private var bildeId : Int? = nil
    
    private var valgtBilde :Int? = nil
    
    private var poengBilde :Int = 0
    
    private var påBilde:Int = 0
    
    private var valgteBilder : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    neste.isHidden = true
    avslutt.isHidden = true
    poeng.isHidden = true
    poengsum.isHidden = true
    bilde.isHidden = true
    bildenr.isHidden = true
    svar.isHidden = true
    tekst()
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped)) // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped)) // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
    
    }

    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                print("User swiped right")
                
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = bilder.count-1
                    valgtBilde = imageIndex
                    bildeRamme.image = bilder[imageIndex]
                    
                    
                }
                valgtBilde = imageIndex
                bildeRamme.image = bilder[imageIndex]
                
            case UISwipeGestureRecognizerDirection.left:
                print("User swiped Left")
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex > bilder.count-1 {
                    
                    imageIndex = 0
                    valgtBilde = imageIndex
                    bildeRamme.image = bilder[imageIndex]
                    
                }
                valgtBilde = imageIndex
                bildeRamme.image = bilder[imageIndex]
                
            default:
                break //stops the code/codes nothing.
                
                
            }
            
        }
        
        
    }
    

    
    private func tekst(){
        bildeRamme.backgroundColor = UIColor.white
        label = UILabel(frame: bildeRamme.bounds)
        label?.text = "Her komer intro tekst"
        bildeRamme.addSubview(label!)
    }
    
private func startGame(){
    
    let headers : HTTPHeaders = [
        "newUser":"newuser"
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
                
                Alamofire.request("http://www.gruppe18.tk:8080/api/images",method: .get,headers:headers).validate().responseJSON { response in
                    
                    
                    if let result = response.result.value {
                        let JSON = result as! NSDictionary
                        let images = JSON.object(forKey: "images") as? NSArray
                        var objCArray = NSMutableArray(array: images!)
                        if let swiftArray = objCArray as NSArray as? [String] {
                            
                            if(swiftArray.count>0){
                            
                                for i in swiftArray{
                                    Alamofire.request(i).responseImage { response in
                                        if let image = response.result.value {
                                            self.bilder.append(image)
                                        }
                                    }
                         
                                }
                                
                                
                            }
                            else{
                                let alert = UIAlertController(title: "Melding", message: "Feil ved å motta bilder", preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                        }
                        //velykket registrering

             }
        }
    }
            else{
                let alert = UIAlertController(title: "Melding", message: "Feil ved kobling til server", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
 }
}
}
   private func random(size:Int)->Int{
        let randomNum:UInt32 = arc4random_uniform(UInt32(size))
        let someInt:Int = Int(randomNum)
        return someInt
    }

    private func sjekk(index:Int)->Int{
        var tall :Int = random(size: index)
        var finnes:Bool = false
        var ok:Bool = true
        
        if(valgteBilder.isEmpty){
            valgteBilder.append(tall)
            return tall
        }
        while(ok){
        for i in valgteBilder{
            if(i == tall){
            finnes = true
            }
        }
            if(!finnes){
            valgteBilder.append(tall)
            return tall
            }
         tall = random(size: index)
        finnes = false
        }
        return tall
    }
    
    func alternativer(){
      for i in bilder{
        bildeRamme.image = i
        }
    }
    
    
    
    @IBAction func start(_ sender: UIButton) {
        label?.text = ""
        
        poeng.isHidden = false
        poengsum.isHidden = false
        bilde.isHidden = false
        bildenr.isHidden = false
        start.isHidden = true
        startKnapp = true
        startGame()
        neste.isHidden = false
        
        
    }
    
  
    
    @IBAction func neste(_ sender: UIButton) {
        valgtBilde = bilder.count-1
        påBilde+=1
        bildeRamme.image = nil
        bildenr.text = "\(påBilde) av \(bilder.count)"
        bildeId = sjekk(index: bilder.count)
        
        bildeRamme.image = bilder[bildeId!]
        neste.isHidden = true
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
        self.bildeRamme.image = nil

        }
        let when1 = DispatchTime.now() + 4 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when1) {
            self.alternativer()
           
   self.neste.isHidden = true
   self.svar.isHidden = false
            
        }
        
        
        
 
    }
    @IBAction func svar(_ sender: UIButton) {
     
        if(påBilde>bilder.count-1){
            if(self.bildeId == self.valgtBilde || self.bildeId == 0 && valgtBilde == nil){
                self.poengBilde+=1
                self.poengsum.text = "\(poengBilde)"
            }
            self.svar.isHidden = true
            self.bildeRamme.image = nil
            self.avslutt.isHidden = false
        }
        else{
        self.neste.isHidden = false
        self.svar.isHidden = true
        
            if(self.bildeId == self.valgtBilde || self.bildeId == 0 && valgtBilde == nil){
            self.poengBilde+=1
            self.poengsum.text = "\(poengBilde)"
        }

        self.bildeRamme.image = nil
        
        
        }
    }
    
    @IBAction func avslutt(_ sender: UIButton) {
       self.dismiss(animated: true, completion: nil)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
