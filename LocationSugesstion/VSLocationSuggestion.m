//
//  VSLocationSuggestion.m
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "VSLocationSuggestion.h"

@interface VSLocationSuggestion ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, strong) CLLocation *position;
@end

@implementation VSLocationSuggestion
+(NSArray *)suggestionsFromDictionaries:(NSArray *)dictionaries
{
    NSMutableArray *array = [@[] mutableCopy];
    [dictionaries enumerateObjectsUsingBlock:^(NSDictionary *suggestionDict, NSUInteger idx, BOOL *stop) {
        [array addObject:[[self alloc] initWithDictionary:suggestionDict]];
    }];
    
    return [array copy];
}

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _country = dict[@"country"];
        CLLocationDegrees latitude = [dict[@"geo_position"][@"latitude"] doubleValue];
        CLLocationDegrees longitude =[dict[@"geo_position"][@"longitude"] doubleValue];
        _position = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
    return self;
}
@end
