//
//  BasicListViewController.m
//  TestMR2_3_3
//
//  Created by Richard Wylie on 28/07/2014.
//  Copyright (c) 2014 sigmundfridge. All rights reserved.
//

#import "BasicListViewController.h"
#import "Test1.h"

@interface BasicListViewController ()

@property(nonatomic, weak)IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSFetchedResultsController *frc;

@end

@implementation BasicListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSFetchedResultsController*)frc {
//    if(!_frc) {
//        _frc = [Test1 MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"lName" ascending:YES];
//    }
    return _frc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateFRC];
    
}

- (void)updateFRC {
    NSLog(@"Starting FRC");
    self.frc = [Test1 MR_fetchAllGroupedBy:@"lName" withPredicate:nil sortedBy:@"lName" ascending:YES];
    NSLog(@"UpdatedFRC");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rows = [self.frc.sections[section] numberOfObjects];
    return rows;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.frc.sections.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Test1 *item = [self.frc objectAtIndexPath:indexPath];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"basic"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"basic"];
    }
    cell.textLabel.text = item.lName;
    return cell;
}
@end
