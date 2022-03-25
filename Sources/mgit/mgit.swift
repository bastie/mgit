//
//  Program entry point
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation
import ArgumentParser


@main
struct mgit : ParsableCommand{
    
//    @Option(name: [.customLong("clone")])
    @Flag(name: [.customShort("v"), .customLong("verbose", withSingleDash: true)], help: "print some informations")
    var logInfo : Bool = false
    
    @Flag(name: [.customShort("V"), .customLong("verbose", withSingleDash: false)], help: "print more informations")
    var logDeveloper : Bool = false
    
    /*
    @Argument
    var clone : String
    @Argument
    var add : String
    @Argument
    var checkout : String
    @Argument
    var commit : String
    @Argument
    var `init` : String
    @Argument
    var rm : String
*/
    @Argument (help: "clone,add,checkout,commit,init,rm")
    var command : String
     
    @Argument
    var files : [String]

    func run() throws {
        if logInfo {
            print("\(CommandLine.arguments[0].split(separator: "/")[CommandLine.arguments[0].split(separator: "/").count-1]) started")
        }
        else if logDeveloper {
            print ("\(CommandLine.arguments[0]) started with call: \n\(CommandLine.arguments)")
        }
        
        switch (command) {
        case "init":
            initRepository(param: files)
            break
        default:
            let task = Process();
            if #available(macOS 10.13, *) {
                // like run without parameters
                task.executableURL = URL(fileURLWithPath: CommandLine.arguments[0])
                try? task.run()
            } else {
                // Fallback on earlier versions
            }
            mgit.exit()
        }
    }
}


