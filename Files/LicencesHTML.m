//
//  LicenceHTML.m
//  PPLicenceViewController
//
//  Created by Jérémy Lagrue on 2014-06-09.
//  Copyright (c) 2014 Wasappli. All rights reserved.
//

#import "LicencesHTML.h"
#import <MMMarkdown/MMMarkdown.h>

@implementation LicencesHTML

- (id) init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *htmlPath = [path stringByAppendingPathComponent:@"licences.html"];
        _stringHTML = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[normalize:CSS]"
                                                             withString:@"<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"[BundlePath]/normalize.css\" />"];
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[style:licences]"
                                                             withString:@"<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"[BundlePath]/licences.css\" />"];
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[style:bootstrap]"
                                                             withString:@"<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"[BundlePath]/bootstrap.min.css\" />"];
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[javascript:JQUERY]"
                                                             withString:@"<script type='text/javascript' src='[BundlePath]/jquery.min.js'></script>"];
        
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[BundlePath]"
                                                             withString:[[NSBundle mainBundle] resourceURL].absoluteString];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Pods-acknowledgements" ofType:@".markdown"];
        NSString *licenceContent = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSError *error;
        NSString *content = [MMMarkdown HTMLStringWithMarkdown:licenceContent error:&error];
        [self setLicencesContent:content];
    }
    return self;
}

- (void) loadInWebview:(UIWebView*)webview
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [webview loadHTMLString:_stringHTML baseURL:[NSURL fileURLWithPath:path isDirectory:YES]];
}

- (void) setLicencesContent:(NSString*)content
{
    if ( content ) {
        _stringHTML = [_stringHTML stringByReplacingOccurrencesOfString:@"[licences:content]" withString:content];
    }
}

@end
