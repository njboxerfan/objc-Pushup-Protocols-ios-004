//
//  AddExerciseViewController.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/13/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "AddExerciseViewController.h"
#import "FISExercise.h"

@interface AddExerciseViewController ()

@property (strong, nonatomic) NSMutableArray *muscleGroups;
@end

@implementation AddExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.exerciseName.delegate = self;
    self.exercisePicker.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)muscleGroups {
    if (!_muscleGroups) {
        _muscleGroups = [[NSMutableArray alloc] initWithArray:@[@"Quadriceps",@"Gluteals",@"Hamstrings",@"Pectorals",@"Triceps",@"Deltoids",@"Biceps",@"Rectus Abdominus", @"Obliques", @"Erector Spinae"]];
    }
    
    return _muscleGroups;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.muscleGroups[row];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.muscleGroups count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

@end
