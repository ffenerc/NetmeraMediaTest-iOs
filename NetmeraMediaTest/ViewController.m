//
//  ViewController.m
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/12/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ViewController.h"
#import "Netmera/Netmera.h"
#import "DSActivityView.h"
#import "ListViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize urlField;
@synthesize imageView;
@synthesize imageData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlField.text]];
    [imageView setImage:[UIImage imageWithData:imageData]];
}

- (void)viewDidUnload
{
    [self setUrlField:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [urlField release];
    [imageView release];
    [super dealloc];
}
- (IBAction)loadImage:(id)sender {
    [self dismissKeyboard];
    imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlField.text]];
    [imageView setImage:[UIImage imageWithData:imageData]];
}

-(void) dismissKeyboard{
    [urlField setEnabled:NO];
    [urlField setEnabled:YES];
}

- (IBAction)submitImageToNetmera:(id)sender {
    [self dismissKeyboard];
    
    NetmeraMedia *media = [[NetmeraMedia alloc] initWithData:imageData];
    NetmeraContent *blog = [[NetmeraContent alloc]initWithObjectName:@"MediaTest Images"];
    [blog add:@"image" object:media];
    [blog add:@"originUrl" object:urlField.text];
    
    
    [DSBezelActivityView activityViewForView:self.view withLabel:@"Uploading..." width:100.0f];
    [blog createInBackgroundWithBlock:^(NetmeraContent *content, NSError *error) {
        [DSBezelActivityView cancelPreviousPerformRequestsWithTarget:self.view];
        [DSBezelActivityView removeView];
    }];
}

- (IBAction)showImageList:(id)sender {
    ListViewController *listView = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    [self presentModalViewController:listView animated:YES];
    [listView release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self dismissKeyboard];
    return YES;
}

@end
