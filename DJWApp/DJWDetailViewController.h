//
//  DJWDetailViewController.h
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJWDetailViewController : UIViewController

    @property (strong, nonatomic) id detailItem;

    @property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
