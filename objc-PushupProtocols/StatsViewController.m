//
//  StatsViewController.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "StatsViewController.h"
#import "FISWorkout.h"
#import "FISExercise.h"

@interface StatsViewController ()

@property (strong, nonatomic) NSMutableArray *workouts;
@property (strong, nonatomic) NSMutableArray *workoutsOfSelectedExercise;
@property (strong, nonatomic) NSNumber *totalNumberOfExercise;
@property (strong, nonatomic) NSNumber *averageExercisePerDay;
@property (strong, nonatomic) NSNumber *averageExercisePerSet;
@property (strong, nonatomic) NSNumber *averageNumberOfWorkoutBuddies;

@property (weak, nonatomic) IBOutlet UIPickerView *exercisePicker;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberOfExerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageExercisePerDayLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageExercisePerSetLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageNumberOfPeerPressuredFlatironStudentsDoingExerciseWithYouLabel;

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.workouts = [[NSMutableArray alloc] init];
    self.exercisePicker.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setWorkouts:(NSMutableArray *)workouts {
    
    _workouts = workouts;
    
    
}

-(NSMutableArray *)exercises {
    if (!_exercises) {
        FISExercise *pushups = [[FISExercise alloc] initWithName:@"Pushups"];
        pushups.muscleGroups = [[NSMutableArray alloc] initWithArray: @[@"Pectorals", @"Latissimus Dorsi"]];
        _exercises = [[NSMutableArray alloc] initWithArray:@[pushups]];
    }
    
    return _exercises;
}


- (void)updateUI {
    
    if ([self.workoutsOfSelectedExercise count] > 0) {
        self.totalNumberOfExerciseLabel.text = [self.totalNumberOfExercise stringValue];
        self.averageExercisePerDayLabel.text = [self.averageExercisePerDay stringValue];
        self.averageExercisePerSetLabel.text = [self.averageExercisePerSet stringValue];
        self.averageNumberOfPeerPressuredFlatironStudentsDoingExerciseWithYouLabel.text = [self.averageNumberOfWorkoutBuddies stringValue];
    }
    else {
        self.totalNumberOfExerciseLabel.text = @"0";
        self.averageExercisePerDayLabel.text = @"0";
        self.averageExercisePerSetLabel.text = @"0";
        self.averageNumberOfPeerPressuredFlatironStudentsDoingExerciseWithYouLabel.text = @"0";
    }
    
    [self.exercisePicker reloadAllComponents];
    
}


- (NSNumber *)totalNumberOfExercise {
    
    return [self.workoutsOfSelectedExercise valueForKeyPath:@"@sum.reps"];
}

- (NSNumber *)averageExercisePerDay {
   
    NSArray *dates = [self.workoutsOfSelectedExercise valueForKeyPath:@"@distinctUnionOfObjects.computedDate"];
    
    NSNumber *countOfDays = [dates valueForKeyPath:@"@count"];
    
    return  @([self.totalNumberOfExercise floatValue]/[countOfDays floatValue]);
}

- (NSNumber *)averageExercisePerSet {
    
    NSNumber *countOfSets = [self.workoutsOfSelectedExercise valueForKeyPath:@"@sum.sets"];
    
    return @([self.totalNumberOfExercise floatValue]/[countOfSets floatValue]);
    
}

- (NSNumber *)averageNumberOfWorkoutBuddies {
    
    NSNumber *countOfTotalWorkoutBuddies = [self.workoutsOfSelectedExercise valueForKeyPath:@"@sum.numberOfWorkoutBuddies"];
    NSNumber *countOfWorkouts = [self.workoutsOfSelectedExercise valueForKeyPath:@"@count"];
    
    return @([countOfTotalWorkoutBuddies floatValue]/[countOfWorkouts floatValue]);

}

-(NSMutableArray *)workoutsOfSelectedExercise {
    NSUInteger pickerRow = [self.exercisePicker selectedRowInComponent:0];
    
    NSPredicate *workoutFilter = [NSPredicate predicateWithFormat:@"exercise.name == %@", ((FISExercise *)self.exercises[pickerRow]).name];
    
    NSArray *filteredWorkouts = [self.workouts filteredArrayUsingPredicate:workoutFilter];
    
    if (filteredWorkouts.count > 0) {
    _workoutsOfSelectedExercise = [[NSMutableArray alloc] initWithArray:filteredWorkouts];
    }
    else {
        _workoutsOfSelectedExercise = [[NSMutableArray alloc] init];
    }
    
    return _workoutsOfSelectedExercise;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return ((FISExercise *)self.exercises[row]).name;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.exercises count];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self updateUI];
}

@end
