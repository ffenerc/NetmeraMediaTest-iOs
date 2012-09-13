//
//  ListViewController.m
//  NetmeraMediaTest
//
//  Created by Serhat SARI on 9/12/12.
//  Copyright (c) 2012 Netmera. All rights reserved.
//

#import "ListViewController.h"
#import "Netmera/Netmera.h"
#import "MediaDetailViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize mediaArray;
@synthesize mediaTableView;

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

    mediaArray = [[NSMutableArray alloc] init];
    NetmeraService *service=[[NetmeraService alloc]initWithName:@"MediaTest Images"];
    [service searchInBackgroundWithBlock:^(NSArray *netmeraContentArray, NSError *error) {
        for (NetmeraContent *content in netmeraContentArray) {
            [mediaArray addObject:content];
        }
        [mediaTableView reloadData];
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return mediaArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier=@"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NetmeraContent *content = [mediaArray objectAtIndex:indexPath.row];
    NetmeraMedia *newmedia = [content getNetmeraMedia:@"image"];

    UIFont *titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:12.0];
    [[cell textLabel] setFont:titleFont];
    
    UIFont *detailFont = [UIFont fontWithName:@"Georgia" size:10.0];
    [[cell detailTextLabel] setFont:detailFont];
    
    cell.textLabel.text = [content getString:@"originUrl"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [newmedia getUrlWithPhotoSize:THUMBNAIL]];

    
    NSData *data = [NSData dataWithContentsOfURL:[newmedia getUrlWithPhotoSize:THUMBNAIL]];
    
    [[cell imageView] setImage:[UIImage imageWithData:data]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MediaDetailViewController *detailView = [[MediaDetailViewController alloc] initWithNibName:@"MediaDetailViewController" bundle:nil];
    detailView.content = [mediaArray objectAtIndex:indexPath.row];
    
    [self presentModalViewController:detailView animated:YES];
    [detailView release];
}

- (void)viewDidUnload
{
    [self setMediaTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backToUpload:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc {
    [mediaTableView release];
    [super dealloc];
}
@end
