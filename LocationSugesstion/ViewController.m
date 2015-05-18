//
//  ViewController.m
//  LocationSugesstion
//
//  Created by Manuel Meyer on 18.05.15.
//  Copyright (c) 2015 Manuel Meyer. All rights reserved.
//

#import "ViewController.h"
#import "VSLocationSuggestion.h"
#import <OFAViewPopulator.h>
#import <OFASectionPopulator.h>
#import "VSSuggestionDataSource.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OFAViewPopulator *viewPopultor;
@property (strong, nonatomic) VSSuggestionDataSource *dataSource;
- (IBAction)textChanged:(UITextField *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[VSSuggestionDataSource alloc] initWithNetworkController:self.networkController];
    
    OFASectionPopulator *sectionPopulator = [[OFASectionPopulator alloc] initWithParentView:self.tableView
                                                                               dataProvider:self.dataSource
                                                                             cellIdentifier:^NSString *(id obj, NSIndexPath *indexPath) {
        return @"Cell";
    } cellConfigurator:^(VSLocationSuggestion *obj, UITableViewCell *cell, NSIndexPath *indexPath) {
        cell.textLabel.text = obj.name;
    }];
    
    sectionPopulator.objectOnCellSelected = ^(VSLocationSuggestion *suggestion, UIView *cell, NSIndexPath *indexPath ){
        NSString * string =[NSString stringWithFormat:@"%@, %@ (%f %f)", suggestion.name, suggestion.country, suggestion.position.coordinate.latitude, suggestion.position.coordinate.longitude];
        
        UIAlertController *avc = [UIAlertController alertControllerWithTitle:@"Selected" message:string preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           ;
                                       }];
        [avc addAction:cancelAction];
        [self presentViewController:avc animated:YES completion:NULL];
    };
    self.viewPopultor = [[OFAViewPopulator alloc] initWithSectionPopulators:@[sectionPopulator]];

}


- (IBAction)textChanged:(UITextField *)sender
{
    NSString *s = sender.text;
    if ([s length]) {
        [self.dataSource enteredStringForSuggestions:s];
    }
}
@end;