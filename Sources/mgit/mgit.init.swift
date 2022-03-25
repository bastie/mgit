//
//  init command
//  
//
//  Created by Sebastian Ritter on 25.03.22.
//

import Foundation

extension mgit {
    
    public func initRepository (param : [String]) {
        if let repo = Repository.getInstance(forPath: param[0]){
            print("Repository object created")
        }
        else {
            print ("no repository object created")
        }
    }
}
