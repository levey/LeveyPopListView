//
//  AppDelegate.m
//  LeveyPopListViewDemo
//
//  Created by Levey on 2/21/12.
//  Copyright (c) 2012 Levey. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize infoLabel = _infoLabel;
@synthesize options = _options;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIButton *demoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoBtn setTitle:@"Show List" forState:UIControlStateNormal];
    demoBtn.frame = CGRectMake(100, 220, 120, 44);
    [demoBtn addTarget:self action:@selector(showListView) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:demoBtn];
    
    _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    _infoLabel.textAlignment = UITextAlignmentCenter;
    [self.window addSubview:_infoLabel];
    _options = [NSArray arrayWithObjects:
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"facebook.png"],@"img",@"Facebook",@"text", nil],
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"twitter.png"],@"img",@"Twitter",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"tumblr.png"],@"img",@"Tumblr",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"google-plus.png"],@"img",@"Google+",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"linkedin.png"],@"img",@"LinkedIn",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"pinterest.png"],@"img",@"Pinterest",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"dribbble.png"],@"img",@"Dribbble",@"text", nil], 
                 [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"deviant-art.png"],@"img",@"deviantArt",@"text", nil], 
                 nil];
        
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showListView {
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"Share Photo to..." options:_options handler:^(NSInteger anIndex) {
        _infoLabel.text = [NSString stringWithFormat:@"You have selected %@", _options[anIndex]];
    }];
//    lplv.delegate = self;
    [lplv showInView:self.window animated:YES];
}

#pragma mark - LeveyPopListView delegates
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    _infoLabel.text = [NSString stringWithFormat:@"You have selected %@",_options[anIndex]];
}
- (void)leveyPopListViewDidCancel {
    _infoLabel.text = @"You have cancelled";
}

@end
