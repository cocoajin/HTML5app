//
//  RootViewController.m
//  HTML5app
//
//  Created by cocoa on 13-10-8.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "RootViewController.h"
#import "SVWebViewController.h"

#define kBaseURL @"http://h5.cocoajin.org"
#define kHtml @".html"

@interface RootViewController ()

@end

@implementation RootViewController

{
    NSMutableArray *listArray;
    SVWebViewController *svWebView;
    NSMutableArray *webArray;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    style = UITableViewStyleGrouped;
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"HTML5 app Test";
    self.clearsSelectionOnViewWillAppear = NO;

    listArray = [[NSMutableArray alloc]initWithCapacity:10];
    [listArray addObject:@"JQMobile Hello World!"];
    
    
    
    webArray = [[NSMutableArray alloc]initWithCapacity:10];
    [webArray addObject:@"index"];
    

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [listArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment =  NSTextAlignmentCenter;
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    svWebView = [[SVWebViewController alloc]initWithAddress:[self requestTheWebPage:indexPath.row]];
    [self.navigationController pushViewController:svWebView animated:YES];
    
}


- (NSString *)requestTheWebPage:(int )num
{
    NSString *url = [NSString stringWithFormat:@"%@/%@%@",kBaseURL,[webArray objectAtIndex:num],kHtml];
    static int i = 0;
    if (i <1) {
        NSLog(@"line(%d):访问接口： %@",__LINE__,url);
    }
    i++;
    return url;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
