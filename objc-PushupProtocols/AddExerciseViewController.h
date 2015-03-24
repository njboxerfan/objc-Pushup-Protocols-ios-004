//
//  AddExerciseViewController.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/13/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FISExercise;

@protocol AddExerciseDelegate <NSObject>

-(void)addExercise:(FISExercise *)exercise;
- (void)updateUI;

@end

@interface AddExerciseViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *exercisePicker;
@property (weak, nonatomic) IBOutlet UITextField *exerciseName;

@property (strong, nonatomic) id<AddExerciseDelegate> myDelegate;

@end
