import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(toleranceOperatorTests.allTests),
        testCase(pointTests.allTests),
        testCase(vectorTests.allTests),
        testCase(rayTests.allTests),
        testCase(intersectionTests.allTests),
        testCase(hitTests.allTests),
        testCase(sphereTests.allTests),
    ]
}
#endif
