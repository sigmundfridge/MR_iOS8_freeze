//
//  BasicListViewController.h
//  TestMR2_3_3
//
//  Created by Richard Wylie on 28/07/2014.
//  Copyright (c) 2014 sigmundfridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic) BOOL multipleCalls;
@end
