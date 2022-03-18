//
//  ResendOTPUnitTests.swift
//  UnitTest_2FATests
//
//  Created by Ahmed Sadiq on 18/03/2022.
//

import XCTest
@testable import UnitTest_2FA
class ResendOTPUnitTests: XCTestCase {

    // RESEND OTP API UNIT TESTS
    
    // UNIT TESTS FOR RESEND OTP EMPTY STRING
    func test_ResendOTPAPIResponse_With_EmptyString_Returns_Error() {
       
        // ARRANGE
        let request = OTPViewModel()
        request.resendOTP(msisdn: "", phoneNumber: "", countryCode: "")
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
    
    // UNIT TESTS FOR WHEN WE ENTER THE INVALID PHONE_NUMBER
    func test_ResendOTPAPIResponse_With_InvalidPhoneFormat_Returns_Error(){

        // ARRANGE
        let request = OTPViewModel()
        request.resendOTP(msisdn: "+923024715186", phoneNumber: "3024715186", countryCode: "+92")
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

}
