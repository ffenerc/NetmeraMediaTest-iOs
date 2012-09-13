//
//  ListViewController.h
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/12/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) NSMutableArray *mediaArray;
@property (retain, nonatomic) IBOutlet UITableView *mediaTableView;

- (IBAction)backToUpload:(id)sender;

@end
