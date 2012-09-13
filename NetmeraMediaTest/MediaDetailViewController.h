//
//  MediaDetailViewController.h
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/13/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Netmera/Netmera.h"

@interface MediaDetailViewController : UIViewController

@property (retain, nonatomic) NetmeraContent *content;
@property (retain, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (retain, nonatomic) IBOutlet UIImageView *smallImageView;
@property (retain, nonatomic) IBOutlet UIImageView *mediumImageView;

- (IBAction)closeClicked:(id)sender;


@end
