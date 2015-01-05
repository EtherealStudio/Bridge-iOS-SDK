//
//  SBBCacheManagerTests.m
//  BridgeSDK
//
//  Created by Erin Mounts on 1/5/15.
//  Copyright (c) 2015 Sage Bionetworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
@import BridgeSDK;
#import "SBBTestBridgeObjects.h"
#import "SBBCacheManager.h"
#import "SBBTestAuthManagerDelegate.h"
#import "SBBObjectManagerInternal.h"

@interface SBBCacheManagerTests : XCTestCase

@property (nonatomic, strong) SBBCacheManager *cacheManager;

@end

@implementation SBBCacheManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    id<SBBAuthManagerProtocol> aMan = SBBComponent(SBBAuthManager);
    SBBTestAuthManagerDelegate *delegate = [SBBTestAuthManagerDelegate new];
    delegate.password = @"123456";
    aMan.authDelegate = delegate;
    _cacheManager = [SBBCacheManager cacheManagerWithDataModelName:@"TestModel" bundleId:SBBBUNDLEIDSTRING authManager:aMan];
    [SBBComponentManager registerComponent:_cacheManager forClass:[SBBCacheManager class]];
    SBBObjectManager *oMan = [SBBObjectManager objectManagerWithCacheManager:_cacheManager];
    [SBBComponentManager registerComponent:oMan forClass:[SBBObjectManager class]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [SBBComponentManager reset];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
