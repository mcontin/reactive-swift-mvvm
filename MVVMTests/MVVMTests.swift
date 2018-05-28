//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by Mattia on 26/08/2017.
//  Copyright © 2017 Mattia. All rights reserved.
//

import XCTest
import RxSwift
@testable import MVVM

class MVVMTests: XCTestCase {
    
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapArray() {
        let expectation = XCTestExpectation(description: "Map a JSON with an array as root")

        API.getPosts()
            .subscribe(onSuccess: { posts in
                expectation.fulfill()
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
