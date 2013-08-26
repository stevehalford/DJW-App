//
//  DJWDetailViewController.m
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import "DJWDetailViewController.h"

@interface DJWDetailViewController ()
- (void)configureView;
@end

@implementation DJWDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSString* htmlString = [NSString stringWithFormat:
                                @"<html>"
                                "<head>"
                                "<style type=\"text/css\">"
                                "body { font-family:Helvetica; font-size: 14; word-wrap: break-word;}"
                                "h1 { font-size:18;}"
                                "h2 { font-size:16; font-weight: normal; color: grey;}"
                                "</style>"
                                "</head>"
                                "<body>"
                                "<h1>%@</h1>"
                                "<h2>at %@ in %@</h2>",
                                [self.detailItem valueForKey:@"title"],
                                [self.detailItem valueForKey:@"company"],
                                [self.detailItem valueForKey:@"city"]
                            ];

        htmlString = [htmlString stringByAppendingString:[self.detailItem valueForKey:@"descriptionText"]];
        htmlString = [htmlString stringByAppendingString:@"</body></html>"];

        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"\r\n"   withString:@"<br />"];

        [_webView loadHTMLString:htmlString baseURL:nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
