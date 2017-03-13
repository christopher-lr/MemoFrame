//
//  Innlogging.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
