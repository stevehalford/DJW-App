//
//  DJWDetailViewController.m
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import "DJWDetailViewController.h"
#import <Social/Social.h>

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
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"d MMMM yyyy"];
        NSString *dateString = [dateFormat stringFromDate:[self.detailItem valueForKey:@"createdAt"]];

        NSString* htmlString = [NSString stringWithFormat:
                                @"<html>"
                                "<head>"
                                "<style type=\"text/css\">"
                                "body { font-family:Helvetica; font-size: 14; word-wrap: break-word;}"
                                "h1 { font-size:18; margin: 10 0 5; }"
                                "h2 { font-size:16; font-weight: normal; color: grey; margin-top: 0; }"
                                ".date { color: grey; font-size: 12; }"
                                ".apply { text-decoration: none; display: block; color: grey; font-size: 18; margin: 20px 0; }"
                                "</style>"
                                "</head>"
                                "<body>"
                                "<h1>%@</h1>"
                                "<h2>at %@ in %@</h2>"
                                "%@"
                                "<a class=\"apply\" href=\"%@\">&raquo; View/Apply online</a>"
                                "<p class=\"date\">Published on %@</p>"
                                "</body></html>",
                                [self.detailItem valueForKey:@"title"],
                                [self.detailItem valueForKey:@"company"],
                                [self.detailItem valueForKey:@"city"],
                                [self.detailItem valueForKey:@"descriptionText"],
                                [self.detailItem valueForKey:@"url"],
                                dateString
                            ];

        htmlString = [htmlString stringByReplacingOccurrencesOfString:@"\r\n"   withString:@"<br />"];

        [_webView loadHTMLString:htmlString baseURL:nil];
    }
}

- (IBAction)sharePressed:(id)sender {
    if (NSClassFromString(@"UIActivityViewController")) {

        NSURL *urlStringToShare = [self.detailItem valueForKey:@"url"];
        NSArray *dataToShare = @[@"Check out this job on DJW", urlStringToShare];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:dataToShare
                                                                                applicationActivities:nil];
        [activityVC setValue:@"Check out this job on DJW" forKey:@"subject"];

        [self presentViewController:activityVC animated:YES completion:nil];
    }
}

-(BOOL)webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }

    return YES;
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
