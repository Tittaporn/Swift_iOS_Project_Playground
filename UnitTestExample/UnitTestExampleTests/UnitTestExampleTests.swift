//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by M3ts LLC on 6/23/22.
//

import XCTest
// import Nimble --> Another library for testing for big apps.
@testable import UnitTestExample // @testable --> To import everyting we want to test, relate to target and big app we can import everything --> import MathKit

class UnitTestExampleTests: XCTestCase {
    /* --> Unit Test --> Using this to test cases.
     XCTAssertTrue(somethingTrue)
     XCTAssertFalse(somethingFalse)
     XCTAssertNotNil(somethingNotNil)
     XCTAssertNil(somethingNil)
     */
    
    func testAddStuff() {
        let math = MathStuff()
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
    }
    
    func testMultipleStuff() {
        let math = MathStuff()
        let result = math.multipleNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 2)
       // XCTAssertEqual(result, 22) --> This will false the test, the app won't run
    }
    
    func testDivideStuff() {
        let math = MathStuff()
        let result = math.divideNumbers(x: 10, y: 2)
        XCTAssertEqual(result, 5)
    }
}

// MARK: - NOTE
/*
 https://www.youtube.com/watch?v=-eiY9eauJr0
 https://www.youtube.com/watch?v=P-Zow2yVx4o
 https://www.youtube.com/watch?v=64EwwjWw1kc
 https://x-team.com/blog/how-to-get-started-with-ios-unit-tests-in-swift/
 https://medium.com/mobil-dev/quick-and-nimble-5c90aa6b3d48
 
 *** What is a unit test? ***
 Unit tests are awesome. They not only improve the overall quality of your code, they also make it easier for you to test individual pieces of your app without having to manually run your app. Given Apple's extensive support for unit tests in Xcode and Swift, it's surprising that so few iOS developers write unit tests. It is my hope that after completing this simple tutorial, you will see just how easy it to get started with unit tests in Swift.

 A unit test is a function you write that tests something about your app. A good unit test is small. It tests just one thing in isolation. For example, if your app adds up the total amount of time your user spent doing something, you might write a test to check if this total is correct. Unit tests should be automated, and they should run fast. That way, you can run them right after you build your app to see if any code changes you introduced broke your app.

 We call these sorts problems regressions. It means your app has gone backwards in terms of functionality. In other words, some new change caused a problem and broke an existing feature. Unit tests are really helpful when it comes to stopping regressions. They test your functions to see if they produce the correct output from a set of given inputs. It’s like having a room full of robots testing your app far faster than any human ever could.

 *** What sorts of things can you test?  ***

 Pretty much everything. If it is a product of your code, you can test it. In our iOS projects, we have written unit tests for all sorts of things. Here are some more examples.

 Making sure a view controller has all of its outlets hooked up so our app doesn't crash unexpectedly when the controller is presented.
 Making sure text that is only supposed to appear on a Monday only appears on a Monday without having to wait until next Monday to find out.
 Making sure a tableview has a cell registered for a nib file that is external to it, and that it won't cause the app to crash when the tableview tries to get the cell.
 If any of those scenarios sound familiar, wouldn't it be nice to have a way to know with near 100% certainty that there won't be any problems before you run the app? That is what unit tests are for.
 
 *** Quick and Nimble ***
 Quick and Nimble are frameworks that are used in Unit tests in iOS. Quick is a testing framework and Nimble is a matching framework. They help us to write tests more easily and readably in addition to verifying how your programs behave. According to its documentation;
 Quick is a behavior-driven development framework for Swift and Objective-C.
 Nimble is a Matcher Framework for Swift and Objective-C
 */
