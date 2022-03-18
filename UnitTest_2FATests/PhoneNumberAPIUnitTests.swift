//
//  PhoneNumberAPIUnitTests.swift
//  UnitTest_2FATests
//
//  Created by Ahmed Sadiq on 18/03/2022.
//

import XCTest
@testable import UnitTest_2FA

class PhoneNumberAPIUnitTests: XCTestCase {

    // PHONE_NUMBER API UNIT TESTS
    
    // UNIT TEST FOR PHONE_NUMBER API RESPONSE AND CODE SEND TO PHONE_NUMBER SUCCESSFULLY
    func test_PhoneNumberAPIResource_With_ValidRequest_Return_PhoneNumberAPIResponse() {

        // ARRANGE
        let request = PhoneNumberViewModel()
        request.registerPhoneNo(countyCode: "+92", txtPhoneNumber: "3024715186")
        let expectation = self.expectation(description: "ValidRequest_Returns_RegisterPhoneNumber")

 
        request.apiResponse = { request in
            
            // ASSERT
            XCTAssertNotNil(request)
            XCTAssertNil(request)
            XCTAssertNotNil(Constant.shared.errorMessage)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)


    }
    
    // UNIT TESTS FOR WHEN WE ENTER THE INVALID PHONE_NUMBER
    func test_PhoneNumberAPIResource_With_InvalidPhoneFormat_Returns_Error(){

        // ARRANGE
        let request = PhoneNumberViewModel()
        request.registerPhoneNo(countyCode: "+92", txtPhoneNumber: "302471518623456")
        let expectation = self.expectation(description: "InvalidPhoneFormat_Returns_Error")

        request.apiResponse = { request in
            
            // ASSERT
            XCTAssertNotNil(request)
            XCTAssertNil(request)
            XCTAssertNotNil(Constant.shared.errorMessage)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    // UNIT TESTS FOR PHONE_NUMBER EMPTY STRING
    func test_PhoneNumberAPIResource_With_EmptyString_Returns_Error(){

        // ARRANGE
        let request = PhoneNumberViewModel()
        request.registerPhoneNo(countyCode: "", txtPhoneNumber: "")
        let expectation = self.expectation(description: "EmptyString_Returns_Error")

        request.apiResponse = { request in

            // ASSERT
            XCTAssertNotNil(request)
            XCTAssertNil(request)
            XCTAssertNotNil(Constant.shared.errorMessage)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
