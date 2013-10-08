//
//  WebPageViewController.m
//  HTML5app
//
//  Created by cocoa on 13-10-8.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "WebPageViewController.h"

@interface WebPageViewController ()

@end

@implementation WebPageViewController

{
    UIWebView *theWebView;
}

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
    //self.navigationController.navigationBar.hidden = YES;
    theWebView =[[UIWebView alloc]initWithFrame:self.view.bounds];
    theWebView.scalesPageToFit = YES;
    theWebView.delegate = self;
    NSURL *aURL = [NSURL URLWithString:@"http://ququplay.github.com/jquery-mobile-flat-ui-theme"];
    [theWebView loadRequest:[NSURLRequest requestWithURL:aURL]];
    
    
    [self.view addSubview:theWebView];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)viewWillDisappear:(BOOL)animated
{
    [theWebView stopLoading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
