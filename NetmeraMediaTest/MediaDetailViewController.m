//
//  MediaDetailViewController.m
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/13/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "MediaDetailViewController.h"

@interface MediaDetailViewController ()

@end

@implementation MediaDetailViewController
@synthesize content;
@synthesize thumbnailImageView;
@synthesize smallImageView;
@synthesize mediumImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NetmeraMedia *newmedia = [content getNetmeraMedia:@"image"];
    
    NSData *data1 = [NSData dataWithContentsOfURL:[newmedia getUrlWithPhotoSize:THUMBNAIL]];
    
    [thumbnailImageView setImage:[UIImage imageWithData:data1]];
    
    NSData *data2 = [NSData dataWithContentsOfURL:[newmedia getUrlWithPhotoSize:SMALL]];
    
    [smallImageView setImage:[UIImage imageWithData:data2]];
    
    NSData *data3 = [NSData dataWithContentsOfURL:[newmedia getUrlWithPhotoSize:MEDIUM]];
    
    [mediumImageView setImage:[UIImage imageWithData:data3]];
    
}

- (void)viewDidUnload
{
    [self setThumbnailImageView:nil];
    [self setSmallImageView:nil];
    [self setMediumImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)closeClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc {
    [thumbnailImageView release];
    [smallImageView release];
    [mediumImageView release];
    [super dealloc];
}
@end
