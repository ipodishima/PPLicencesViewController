//
//  PPLicencesViewController.m
//  PPLicenceViewController
//
//  Created by Jérémy Lagrue on 2014-06-09.
//  Copyright (c) 2014 Wasappli. All rights reserved.
//

#import "PPLicencesViewController.h"
#import "LicencesHTML.h"

@interface PPLicencesViewController ()

@end

@implementation PPLicencesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LicencesHTML *licence = [LicencesHTML new];
    _webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_webview];
    [licence loadInWebview:_webview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
