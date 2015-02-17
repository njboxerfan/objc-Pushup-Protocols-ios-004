//
//  AddEntryViewController.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatsViewController;
@class FISWorkout;
#import "AddExerciseViewController.h"

@interface AddEntryViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *numberOfExerciseTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSetsTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *numberOfStudentsTextField;

@end
