//
//  MyFirstTests.m
//  MyFirstTests
//
//  Created by たかひろ　あふそ on 2013/11/05.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MyFirstTests : XCTestCase

@end

@implementation MyFirstTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
