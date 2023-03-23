//
//  ReferenceType_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
@_exported import ReferenceTypeTestToolkit


///
extension ReferenceType_tests {
    
    ///
    func test_objectID () {
        
        /// Since `ReferenceType.objectID` is an action with side-effects we test all permutations of assertions about the two object IDs
        func assertions <Object1: ReferenceType, Object2: ReferenceType> (_ object1: Object1, _ object2: Object2) {
            
            ///
            XCTAssertEqual(object1.objectID, object1.objectID)
            
            ///
            XCTAssertNotEqual(object1.objectID, object2.objectID)
            
            ///
            XCTAssertNotEqual(object2.objectID, object1.objectID)
            
            ///
            XCTAssertEqual(object2.objectID, object2.objectID)
        }
        
        /// Repeat the assertions twice because side-effects involved
        func repeatedAssertions
            <Object1: ReferenceType,
             Object2: ReferenceType>
            (_ object1: Object1,
             _ object2: Object2) {
            
            ///
            assertions(object1, object2)
            assertions(object1, object2)
        }
        
        ///
        final class Foo: ReferenceType { }
        
        ///
        let foo1 = Foo()
        let foo2 = Foo()
        
        ///
        repeatedAssertions(foo1, foo2)
        
        /// Check that a second type does not cause problems
        final class Bar: ReferenceType { }
        
        ///
        let bar1 = Bar()
        let bar2 = Bar()
        
        ///
        repeatedAssertions(foo1, bar1)
        repeatedAssertions(bar1, bar2)
        repeatedAssertions(bar1, foo2)
        repeatedAssertions(foo1, bar2)
        
        /// Check that subclassing does not cause problems
        class Baz: ReferenceType { }
        class Bop: Baz { }
        
        ///
        let baz = Baz()
        let bop = Bop()
        
        ///
        repeatedAssertions(baz, bop)
        repeatedAssertions(baz, foo1)
        repeatedAssertions(bop, bar2)
    }
}
