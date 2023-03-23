//
//  XCTestCase+conformanceProofs.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
extension XCTestCase {
    
    ///
    public func proof_ReferenceType <T: ReferenceType> (_ t: T.Type) { }
    
    ///
    public func proof_ReferenceType <T: ReferenceType> (_ t: T) { }
}

///
extension ReferenceType {
    
    ///
    public func proof_ReferenceType () { }
    
    ///
    public static func proof_ReferenceType () { }
}
