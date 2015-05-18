//
//  VSNetworkController.h
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSNetworkController : NSObject
-(instancetype)initWithBaseURL:(NSURL *) baseURL;

-(void)suggestionsForString:(NSString *)suggestionString
            responseHandler:(void(^)(id responseObj, NSError *error))responseHandler;
@end
