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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateFRC];
    
}

- (void)updateFRC {
    NSLog(@"Starting FRC");
    self.frc = [Test1 MR_fetchAllGroupedBy:@"initial" withPredicate:nil sortedBy:@"lName" ascending:YES];
    if(self.multipleCalls) {
        self.frc = nil;
        NSLog(@"First grouped FRC loaded");
        self.frc = [Test1 MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"lName" ascending:YES];
        self.frc = nil;
        NSLog(@"Second nil Loaded");
        self.frc = [Test1 MR_fetchAllGroupedBy:@"initial" withPredicate:nil sortedBy:@"lName" ascending:YES];
        self.frc = nil;
        NSLog(@"Third grouped Loaded");
    }
    NSLog(@"Ending FRC");
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

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Test1 *item = [self.frc objectAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
    return [item.lName substringToIndex:1];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!self.multipleCalls) [self performSegueWithIdentifier:@"tableToTable" sender:self];
}

@end
