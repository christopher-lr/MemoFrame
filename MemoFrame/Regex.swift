//
//  Regex.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation

class Regex {

    
    func verifiserEpost(tekst: String) -> Bool {
        
    // "\\." betyr at første "\" escaper neste "\" slik at  "." betyr "match any character"
    let monster = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
    if tekst.range(of: monster, options: .regularExpression) != nil {
        
        // bare for sjekk, print skal ikke være med i endelig program
        print("Email godkjent")
        return true
            
        } else {
            
        print("Email feil")
        return false
        }
        
    }

    func verifiserAlder(tekst: String) -> Bool {
    
    let monster = "[1850-2017]"
    
    if tekst.range(of: monster, options: .regularExpression) != nil {
        
        print("Alder godkjent")
        return true
        
        } else {
        
        print("Alder feil")
        return false
        }
        
    }


    func verifiserPassord(tekst: String) -> Bool {
    
    let monster = "[A-Za-z0-9]"
    
    if tekst.range(of: monster, options: .regularExpression) != nil {
        
        print("Alder godkjent")
        return true
        
        } else {
        
        print("Alder feil")
        return false
        }
        
    }

}


