//
//  ReferenceType.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
@_exported import Foundation
@_exported import ProperValueType_module


///
public protocol ReferenceType: AnyObject { }

///
fileprivate let accessQueue = DispatchQueue(label: "objectIDAccessQueue")
fileprivate var nextObjectID = ObjectID(number: 0)
fileprivate var claimedObjectIDs: [ObjectIdentifier: ObjectID] = [:]

///
public extension ReferenceType {
    
    ///
    var systemObjectIdentifier: ObjectIdentifier {
        ObjectIdentifier(self)
    }
    
    ///
    var objectID: ObjectID {
        
        ///
        let systemIdentifier = self.systemObjectIdentifier
            
        ///
        return accessQueue.sync {
            
            ///
            if let objectID = claimedObjectIDs[systemIdentifier] {
                
                ///
                return objectID
                
            } else {
                
                ///
                let nextID = nextObjectID
                
                ///
                claimedObjectIDs[systemIdentifier] = nextID
                
                ///
                nextObjectID.increment()
                
                ///
                return nextID
            }
        }
    }
}

///
public struct ObjectID: ProperValueType {
    
    ///
    fileprivate let number: Int
    
    ///
    fileprivate mutating func increment () {
        self = ObjectID(number: number.plus(1))
    }
}

///
extension ObjectID: CustomStringConvertible {
    
    ///
    public var description: String {
        "ObjectID(\(number))"
    }
}
