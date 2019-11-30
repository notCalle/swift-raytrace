import XCTest

import raytraceTests

var tests = [XCTestCaseEntry]()
tests += toleranceOperatorTests.allTests()
tests += pointTests.allTests()
tests += vectorTests.allTests()
tests += rayTests.allTests()
XCTMain(tests)
