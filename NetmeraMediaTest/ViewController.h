//
//  ViewController.h
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/12/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *urlField;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) NSData *imageData;


- (IBAction)loadImage:(id)sender;
- (IBAction)submitImageToNetmera:(id)sender;
- (IBAction)showImageList:(id)sender;

@end
