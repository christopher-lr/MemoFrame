//
//  Bruker.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 22.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation

struct Bruker {
    
    /*init (epost: String, alder: Int, kjonn: String, land: String, passord: String) {
        
        self.epost = epost
        self.alder = alder
        self.kjonn = kjonn
        self.land = land
        self.passord = passord
     
     init fungerer bare i en klasse... kan ikke bruke både init og setters getters sammen i en klasse?
     
    }*/
    
    private var epost: String {
        
        get {
            
            return self.epost
        }
        
        set {
            
            self.epost = (newValue)
        }
    }
    
    private var alder: Int
    private var kjonn: String
    
    private var land: String {
        
        get {
            
            return self.land
        }
        
        set {
            
            self.land = (newValue)
        }
    }
    
    private var passord: String {
        
        get {
            
            return self.passord
        }
        
        set {
            
            self.passord = (newValue)
        }
    }

}
