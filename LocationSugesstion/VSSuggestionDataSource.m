//
//  VSSuggestionDataSource.m
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "VSSuggestionDataSource.h"
#import "VSNetworkController.h"
#import "VSLocationSuggestion.h"

@interface VSSuggestionDataSource ()
@property (nonatomic, copy) void (^available)(void);
@property (nonatomic, strong) VSNetworkController *networkController;
@end


@implementation VSSuggestionDataSource
@synthesize sectionObjects;

-(instancetype)initWithNetworkController:(VSNetworkController *)networkController
{
    self = [super init];
    if (self) {
        _networkController = networkController;
    }
    return self;
}

-(void)dataAvailable:(void (^)(void))available
{
    _available = available;
}

-(void)setNewSuggestions:(NSArray *)suggetsions
{
    self.sectionObjects = suggetsions;
    self.available();
}

-(void)enteredStringForSuggestions:(NSString *)s
{
    __weak typeof(self) weakSelf = self;
    [self.networkController suggestionsForString:s responseHandler:^(NSArray *responseObj, NSError *error) {
        typeof(weakSelf) self = weakSelf;
        if (self) {
            if (!error && responseObj) {
                NSArray *suggestion = [VSLocationSuggestion suggestionsFromDictionaries:responseObj];
                [self setNewSuggestions:suggestion];
            }
        }
    }];
}


@end
