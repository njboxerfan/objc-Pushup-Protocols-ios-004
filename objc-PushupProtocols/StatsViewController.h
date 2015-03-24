//
//  ViewController.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEntryViewController.h"

@interface StatsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, AddEntryDelegate>

@property (strong, nonatomic) NSMutableArray *exercises;

-(void)addWorkout:(FISWorkout *)workout;

@end

