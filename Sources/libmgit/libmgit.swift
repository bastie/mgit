import Foundation
import KnightLife
public struct libmgit {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    /// Function looking for existing ``Repository`` at path
    /// - Parameter : fromPath optional path to check
    /// - Returns : Repository or nil
    public func getRoot (fromPath : String? = nil) -> Repository? {
        var searchBase : String
        if let _ = fromPath {
            searchBase = fromPath!
        }
        else {
            searchBase = FileManager.default.currentDirectoryPath
        }
        
        var found = false
        let dotGit = "/.git"
        repeat {
            if IOFacade.exists(atPath: searchBase+dotGit) && IOFacade.isDirectory(atPath: searchBase+dotGit) {
                found = true
                break
            }
            else {
                searchBase = URL(fileURLWithPath: searchBase).deletingLastPathComponent().absoluteString
                print(searchBase)
            }
        }
        while ("file:/" != searchBase) // TODO: - works only for local file system...
        
        if found {
            print ("Found repository at path: \(searchBase)")
            let repository = Repository ()
            repository.rootPath = searchBase
            print ("READ CONFIG MISSING")
            return repository
        }
        else {
            return nil
        }
    }
}
