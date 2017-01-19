//
//  AppDelegate.m
//  Model
//
//  Created by liyuchang on 15/8/10.
//  Copyright (c) 2015年 liyuchang. All rights reserved.
//

#import "AppDelegate.h"
#import "IUser_Request.h"
#import "NSObject+Entity.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    {
//        bgroup =     {
//            address = "<null>";
//            bgroupId = 1000016;
//            city = "<null>";
//            createTimeStr = "2015-07-26 07:03:33";
//            email = "<null>";
//            expireDayStr = "<null>";
//            mobilephone = "<null>";
//            name = "<null>";
//            province = "<null>";
//            remark = "<null>";
//            status = 1;
//            statusStr = normal;
//            telphone = "<null>";
//            website = "<null>";
//        };
//        code = "<null>";
//        edition =     {
//            channel = 0;
//            channelStr = normal;
//            day = 3600;
//            editionId = 1;
//            name = "\U666e\U901a\U7248";
//            price = 0;
//            status = 1;
//            statusStr = normal;
//        };
//        message = "<null>";
//        roles =     (
//                     {
//                         children = "<null>";
//                         name = "\U5165\U5e93";
//                         rank = 1;
//                         uroleId = 100;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U8bbe\U7f6e\U5bc6\U7801";
//                         rank = 10;
//                         uroleId = 401;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U9500\U552e\U5229\U6da6";
//                         rank = 11;
//                         uroleId = 402;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5ba2\U6237\U4fe1\U606f";
//                         rank = 12;
//                         uroleId = 403;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U8ba2\U5355\U7ba1\U7406";
//                         rank = 13;
//                         uroleId = 404;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U7528\U6237\U7ba1\U7406";
//                         rank = 14;
//                         uroleId = 405;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U4f9b\U5e94\U5546\U548c\U6210\U672c";
//                         rank = 15;
//                         uroleId = 406;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5546\U54c1\U524d\U7f00\U5e8f\U53f7";
//                         rank = 16;
//                         uroleId = 407;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U8bbe\U7f6e";
//                         rank = 17;
//                         uroleId = 500;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U65b0\U589e\U5546\U54c1";
//                         rank = 2;
//                         uroleId = 101;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U9000\U8d27";
//                         rank = 3;
//                         uroleId = 105;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5df2\U6709\U5546\U54c1";
//                         rank = 3;
//                         uroleId = 102;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5165\U5e93\U6279\U6b21";
//                         rank = 4;
//                         uroleId = 103;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5546\U54c1\U4fe1\U606f";
//                         rank = 5;
//                         uroleId = 104;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U5e93\U5b58";
//                         rank = 6;
//                         uroleId = 200;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U51fa\U5e93";
//                         rank = 7;
//                         uroleId = 300;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U51fa\U5e93\U8bb0\U5f55";
//                         rank = 8;
//                         uroleId = 301;
//                     },
//                     {
//                         children = "<null>";
//                         name = "\U7ba1\U7406";
//                         rank = 9;
//                         uroleId = 400;
//                     }
//                     );
//        success = 1;
//        user =     {
//            admin = 1;
//            adminStr = admin;
//            answer = "<null>";
//            companyname = "<null>";
//            createTimeStr = "2015-07-26 07:03:33";
//            email = "<null>";
//            lastLoginTimeStr = "<null>";
//            mobilephone = "<null>";
//            name = 18918539507;
//            password = "<null>";
//            qq = "<null>";
//            question = "<null>";
//            status = 1;
//            statusStr = enable;
//            telphone = "<null>";
//            userId = 1000016;
//            username = 18918539507;
//            usernum = "<null>";
//            weixin = "<null>";
//        };
//    }

    IUser_Request *req = [IUser_Request EntityFromContainer:@{@"a":@(1),
                                                              @"array":@[@{
                                                                             @"a":@[@"a1",@"a2"],
                                                                             @"b":@[@"b1",@"b2"]
                                                                             },
                                                                         @{
                                                                             @"a":@[@"a1",@"a2"],
                                                                             @"b":@[@"b1",@"b2"]
                                                                             }],
                                                              @"role":@{
                                                                      @"a":@[@"a1",@"a2"],
                                                                      @"b":@[@"b1",@"b2"]
                                                                      }}];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
