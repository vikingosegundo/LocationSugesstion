//
//  AppDelegate.m
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "AppDelegate.h"
#import "VSNetworkController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window.rootViewController setValue:[[VSNetworkController alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.goeuro.com/api/v2/"]]
                                      forKey:@"networkController"];
    return YES;
}

@end
