//
//  Config.swift
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation


// HACK: found no useable small active ini file project

struct Config {
    
    var sections : [Section] = []
    
    
    
    struct Section {
        var header = String()
        var value : [String:String] = [:]
        init (name : String) {
            header = name
        }
    }
    
}


extension Config {
    
    func createDefaultConfig (to : String) -> Config {
        var result = Config ()
        guard (to == "git") else {
            return result
        }
        var core : Config.Section = .init(name: "core")
        core.value ["repositoryformatversion"] = "0"
        core.value ["filemode"] = "false"
        core.value ["bare"] = "false"
        
        result.sections.append(core)
        
        return result
    }
}

