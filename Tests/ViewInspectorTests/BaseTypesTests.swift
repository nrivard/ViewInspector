import XCTest
import SwiftUI
@testable import ViewInspector

final class BaseTypesTests: XCTestCase {
    
    func testInspectionErrorDescription() throws {
        let desc1 = InspectionError.typeMismatch(factual: "1", expected: "2")
            .localizedDescription
        let desc2 = InspectionError.attributeNotFound(label: "1", type: "2")
            .localizedDescription
        let desc3 = InspectionError.viewIndexOutOfBounds(index: 5, count: 3)
            .localizedDescription
        let desc4 = InspectionError.viewNotFound(parent: "Optional<Text>").localizedDescription
        let desc5 = InspectionError.modifierNotFound(parent: "Text", modifier: "onAppear").localizedDescription
        let desc6 = InspectionError.notSupported("Not supported").localizedDescription
        XCTAssertEqual(desc1, "Type mismatch: 1 is not 2")
        XCTAssertEqual(desc2, "2 does not have '1' attribute")
        XCTAssertEqual(desc3, "Enclosed view index '5' is out of bounds: '0 ..< 3'")
        XCTAssertEqual(desc4, "View for Optional<Text> is absent")
        XCTAssertEqual(desc5, "Text does not have 'onAppear' modifier")
        XCTAssertEqual(desc6, "ViewInspector: Not supported")
    }
    
    func testBindingExtension() {
        let sut = Binding(wrappedValue: false)
        XCTAssertFalse(sut.wrappedValue)
        sut.wrappedValue = true
        XCTAssertTrue(sut.wrappedValue)
    }
}
