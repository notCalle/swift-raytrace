import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(toleranceOperatorTests.allTests),
        testCase(pointTests.allTests),
        testCase(vectorTests.allTests),
        testCase(rayTests.allTests),
    ]
}
#endif
