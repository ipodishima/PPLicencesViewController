//
//  LicenceHTML.h
//  PPLicenceViewController
//
//  Created by Jérémy Lagrue on 2014-06-09.
//  Copyright (c) 2014 Wasappli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LicencesHTML : NSObject

@property (nonatomic, strong, readonly) NSString *stringHTML;

- (void) loadInWebview:(UIWebView*)webview;

@end
