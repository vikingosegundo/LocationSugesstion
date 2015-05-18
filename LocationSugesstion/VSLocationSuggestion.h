//
//  VSLocationSuggestion.h
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface VSLocationSuggestion : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, strong, readonly) CLLocation *position;

+(NSArray *)suggestionsFromDictionaries:(NSArray *)dictionaries;
@end
