//
//  MainViewController.m
//  Demo
//
//  Created by Mrss on 15/12/26.
//  Copyright © 2015年 expai. All rights reserved.
//

#import "MainViewController.h"
#import "MSSAutoresizeLabelFlow.h"
#import "MSSAutoresizeLabelFlowConfig.h"

@interface MainViewController ()

@property (nonatomic,strong) MSSAutoresizeLabelFlow *flow;
@property (weak, nonatomic) IBOutlet UISwitch *animatedSwitch;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    MSSAutoresizeLabelFlowConfig *config = [MSSAutoresizeLabelFlowConfig shareConfig];
    config.backgroundColor = [UIColor lightGrayColor];
    config.textFont = [UIFont fontWithName:@"Times New Roman" size:15];
    NSArray *array = @[@"Adele",@"Alicia Keys",@"Ariana Grande",@"Avril Lavigne",@"Beyoncé",@"Britney Spears",@"Celine Dion",@"Katy Perry",@"Rihanna"];
    self.flow = [[MSSAutoresizeLabelFlow alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 1) titles:array selectedHandler:^(NSUInteger index, NSString *title) {
        NSLog(@"%lu %@",index,title);
    }];
    [self.view addSubview:self.flow];
}

- (IBAction)insert:(id)sender {
    [self.flow insertLabelWithTitle:@"Taylor Swift" atIndex:1 animated:self.animatedSwitch.isOn];
}

- (IBAction)batchInsert:(id)sender {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:1];
    [set addIndex:3];
    [self.flow insertLabelsWithTitles:@[@"Taylor Swift",@"Lana Del Rey"] atIndexes:set animated:self.animatedSwitch.isOn];
}

- (IBAction)delete:(id)sender {
    [self.flow deleteLabelAtIndex:1 animated:self.animatedSwitch.isOn];
}

- (IBAction)batchDelete:(id)sender {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:0];
    [set addIndex:2];
    [self.flow deleteLabelsAtIndexes:set animated:self.animatedSwitch.isOn];
}

- (IBAction)reload:(id)sender {
    NSArray *array = @[@"Akon",@"Bob Dylan",@"Chris Brown",@"Eminem",@"James Blunt",@"Jason Mraz",@"Jay-Z",@"John Lennon",@"Justin Timberlake",@"Robbie Williams",@"Sam Smith",@"Usher",@"Justin Bieber"];
    [self.flow reloadAllWithTitles:array];
}


@end
