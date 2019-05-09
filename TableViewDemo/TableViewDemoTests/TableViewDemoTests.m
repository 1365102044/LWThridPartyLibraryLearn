//
//  TableViewDemoTests.m
//  TableViewDemoTests
//
//  Created by 刘文强 on 2018/11/9.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TableViewDemoTests : XCTestCase

@end

@implementation TableViewDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSArray *arr = @[@2,@3,@4,@1];
    NSMutableArray *arrr = [NSMutableArray new];
    for (NSString *inde in arr) {
        
        if ([inde integerValue] == 3) {
            continue;
        }
        [arrr addObject:inde];
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testExample1 {
    /**
     
     a : 0010
     b : 0100
     a^= b  a = 0110
            b : 0100
     
     
     
     */
    int a = 2;
    int b = 4;
    
    a ^= b;
    b ^= a;
    a ^= b;
    
    a = ~b;
    
    NSLog(@"---------%d---------%d",a,b);
}

@end
