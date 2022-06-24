//
//  ValidationServiceTests.swift
//  UnitTestExampleTests
//
//  Created by M3ts LLC on 6/23/22.
//

import XCTest
@testable import UnitTestExample // If can not find the class, don't forget to import this...

// Source : https://www.youtube.com/watch?v=P-Zow2yVx4o

// MARK: - ValidationServiceTests
class ValidationServiceTests: XCTestCase {
    
    var validation: ValidationService! // Initailize the validatioin
    
    // MARK: - Setup and tearDown Override need it
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    // MARK: - Test Username
    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUsername("Lee McCormick"))
        // XCTAssertNoThrow(try validation.validateUsername("L")) --> This will throw the error becasuse the username is too short, test is failed
    }
    
    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        XCTAssertThrowsError(try validation.validateUsername(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_username_is_too_short() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        XCTAssertThrowsError(try validation.validateUsername("l")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_username_is_too_long() throws {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        let username = "This is the long user name 13216549848653416549849463189864618616841468468"
        XCTAssertTrue(username.count > 20)
        XCTAssertThrowsError(try validation.validateUsername(username)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    // MARK: - Test Password
    func test_is_valid_password() throws {
        XCTAssertNoThrow(try validation.validatePassword("password1"))
        //     XCTAssertNoThrow(try validation.validatePassword("password12345678910121314151617181920"))--> This will throw the error becasuse the password is too long, test is failed
    }
    
    func test_password_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        XCTAssertThrowsError(try validation.validatePassword(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_password_is_too_short() throws {
        let expectedError = ValidationError.passwordTooShort
        var error: ValidationError?
        XCTAssertThrowsError(try validation.validatePassword("l")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_password_is_too_long() throws {
        let expectedError = ValidationError.passwordTooLong
        var error: ValidationError?
        let password = "This is the long user name 13216549848653416549849463189864618616841468468"
        XCTAssertTrue(password.count > 20)
        XCTAssertThrowsError(try validation.validatePassword(password)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
}
