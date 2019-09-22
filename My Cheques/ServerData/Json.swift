import Foundation
import UIKit

public struct ServerData {
    
    public let error: String
    public let success: Bool
    public let token: String
    public let id : Int
    
    
    public init(error: String ,success: Bool, token: String,id: Int) {
        self.error = error
        self.success = success
        self.token = token
        self.id = id
        
    }
    
}

extension ServerData: JSONDecodable {
    
    public init?(JSON: Any) {
        guard let JSON = JSON as? [String: AnyObject] else { return nil }
        
        let error = JSON["error"]
        let success = JSON["success"]
        let token = JSON["token"]
        let id = JSON["user_id"]
        self.error = error as? String ?? ""
        self.success = success as? Bool ?? false
        self.token = token as? String ?? ""
        self.id = id as? Int ?? -1

    }
    
}


