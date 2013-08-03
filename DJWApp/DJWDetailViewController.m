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
        //'description' on the end of each line - what does it refer to? I can't seem to use anything else
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"title"] description];

        //Can I use the DJWJob subtitleText method here instead of repeating the same code?
        self.subtitleTextView.text = [[NSString stringWithFormat:@"at %@ in %@", [self.detailItem valueForKey:@"company"], [self.detailItem valueForKey:@"city"]] description];

        self.textView.text = [[self.detailItem valueForKey:@"descriptionText"] description];
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
