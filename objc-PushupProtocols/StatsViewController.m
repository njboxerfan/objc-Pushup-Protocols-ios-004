//
//  ViewController.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberOfPushupsLabel;
@property (weak, nonatomic) IBOutlet UILabel *averagePushupsPerSetLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageTimeOfDayCompleted;
@property (weak, nonatomic) IBOutlet UILabel *averageNumberOfPeerPressuredFlatironStudentsDoingPushupsWithYou;

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
