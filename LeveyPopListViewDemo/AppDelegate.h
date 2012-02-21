//
//  AppDelegate.h
//  LeveyPopListViewDemo
//
//  Created by Levey on 2/21/12.
//  Copyright (c) 2012 Levey. All rights reserved.
//

#import "LeveyPopListView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, LeveyPopListViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) NSArray *options;
@end
