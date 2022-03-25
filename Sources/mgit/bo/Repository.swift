//
//  Repository.swift
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation
import KnightLife

public class Repository {

    
    
    public static func getInstance (forPath path: String) -> Repository? {
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
                }
            }
            else {
                print ("today I cannot create a repository in a file")
                return nil
            }
        }
        else {
            print ("OK you want I create your directory...")
            
        }
        
        return result
    }
}
