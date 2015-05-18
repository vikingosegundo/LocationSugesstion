//
//  VSSuggestionDataSource.h
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OFADataProvider.h>
@class VSNetworkController;
@interface VSSuggestionDataSource : NSObject <OFADataProvider>

-(instancetype)initWithNetworkController:(VSNetworkController *)networkController;
-(void)setNewSuggestions:(NSArray *)suggetsions;

-(void)enteredStringForSuggestions:(NSString *)suggestionString;
@end
