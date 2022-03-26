//
//  Config.swift
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation


// HACK: found no useable small active ini file project

public struct Config {
    
    var sections : [Section] = []
    
    struct Section {
        var header = String()
        var value : [String:String] = [:]
        init (name : String) {
            header = name
        }
    }
    
    
}

extension Config : CustomStringConvertible {
    public var description: String {
        var desc = "; mgit config"
        for section in sections {
            desc.append("\(section.header)\n")
            for (key,value) in section.value {
                desc.append("\(key)=\(value)\n")
            }
            desc.append("\n")
        }
        return desc
    }
}

extension Config {
    
    public static func createDefaultConfig () -> Config {
        var result = Config ()
        var core : Config.Section = .init(name: "core")
        core.value ["repositoryformatversion"] = "0"
        core.value ["filemode"] = "false"
        core.value ["bare"] = "false"
        
        result.sections.append(core)
        
        return result
    }
}

