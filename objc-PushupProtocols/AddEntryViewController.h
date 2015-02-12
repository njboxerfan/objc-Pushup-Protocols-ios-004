//
//  AddEntryViewController.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEntryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *numberOfPushupsTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *timePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *numberOfStudentsTextField;

@end
