//
//  Repository.swift
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation
import KnightLife

public class Repository {
    
    init (){}

    var rootPath : String?
    var config : Config?
    
    // MARK: mgit init command
    public static func cmdInit (forPath path: String) -> Repository? {
        var result = Repository()
        
        if IOFacade.exists(atPath: path) {
            if IOFacade.isDirectory(atPath: path) {
                let dotGitDir = path + "/.git"
                if IOFacade.exists(atPath: dotGitDir) && IOFacade.isDirectory(atPath: dotGitDir) {
                    print ("existing repository found")
                    return nil
                }
                else {
                    print ("create new repository")
                    try? FileManager.default.createDirectory(atPath: dotGitDir+"/objects", withIntermediateDirectories: true)
                    try? FileManager.default.createDirectory(atPath: dotGitDir+"/refs/tags", withIntermediateDirectories: true)
                    try? FileManager.default.createDirectory(atPath: dotGitDir+"/refs/heads", withIntermediateDirectories: true)

                    var filePath = dotGitDir+"/description"
                    try? "Unnamed repository; edit this file 'description' to name the repository."
                        .write(to: URL(fileURLWithPath: filePath), atomically: true, encoding: String.Encoding.utf8)
                    filePath = dotGitDir+"/HEAD"
                    try? "ref: refs/heads/main\n"
                        .write(to: URL(fileURLWithPath: filePath), atomically: true, encoding: String.Encoding.utf8)
                    
                    result.config = Config.createDefaultConfig()
                    filePath = dotGitDir+"/config"
                    try? result.config!.description
                        .write(to: URL(fileURLWithPath: filePath), atomically: true, encoding: String.Encoding.utf8)

                    print ("Initialized empty Git repository in \(dotGitDir)")
                    
                    result.rootPath = path
                }
            }
            else {
                print ("today I cannot create a repository in a file")
                return nil
            }
        }
        else {
            print ("OK you want I create your directory...")
            try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            guard let created = cmdInit(forPath: path) else {
                try? FileManager.default.removeItem(atPath: path)
                return nil
            }
            return created
        }
        
        return result
    }
    
}
