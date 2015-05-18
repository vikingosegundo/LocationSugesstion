//
//  VSNetworkController.m
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "VSNetworkController.h"

@interface VSNetworkController ()
@property (nonatomic, strong) NSURL *baseURL;

@end


@implementation VSNetworkController
-(instancetype)initWithBaseURL:(NSURL *)baseURL
{
    self = [super init];
    if (self) {
        _baseURL = baseURL;
    }
    return self;
}

-(void)suggestionsForString:(NSString *)suggestionString
            responseHandler:(void(^)(id responseObj, NSError *error))responseHandler
{
    NSURL *url = [self.baseURL URLByAppendingPathComponent:[NSString stringWithFormat:@"position/suggest/en/%@", suggestionString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               responseHandler([NSJSONSerialization JSONObjectWithData:data options:0 error:nil], connectionError);
                           }];
}
@end
