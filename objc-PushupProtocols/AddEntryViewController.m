//
//  AddEntryViewController.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "AddEntryViewController.h"
#import "StatsViewController.h"
#import "FISWorkout.h"
#import "FISExercise.h"

@interface AddEntryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *exerciseTableView;
@property (strong, nonatomic) NSMutableArray *exercises;

@property (nonatomic) NSInteger selectedRow;

- (IBAction)cancelTapped:(id)sender;
- (IBAction)saveWorkoutTapped:(id)sender;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberOfExerciseTextField.delegate = self;
    self.numberOfSetsTextField.delegate = self;
    self.numberOfStudentsTextField.delegate = self;
    self.exerciseTableView.delegate = self;
    self.exerciseTableView.dataSource = self;

    self.selectedRow = 1;
}

-(NSMutableArray *)exercises {
    if (!_exercises) {
        _exercises = [[NSMutableArray alloc] init];
        
        NSString *addNewExerciseEntry = @"Add new exercise";
        [_exercises addObject:addNewExerciseEntry];
        
        FISExercise *pushups = [[FISExercise alloc] initWithName:@"Pushups"];
        pushups.muscleGroups = [[NSMutableArray alloc] initWithArray: @[@"Pectorals", @"Latissimus Dorsi"]];
        
        [_exercises addObject:pushups];
        
    }
    return _exercises;
}

-(void)addExercise:(FISExercise *)exercise
{
    [self.exercises addObject:exercise];
}

- (IBAction)cancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveWorkoutTapped:(id)sender
{
    FISWorkout *workout = [[FISWorkout alloc] initWithExercise:self.exercises[self.selectedRow]
                                                          Reps:@([self.numberOfExerciseTextField.text integerValue])
                                                          Sets:@([self.numberOfSetsTextField.text integerValue])
                                        NumberOfWorkoutBuddies:@([self.numberOfStudentsTextField.text integerValue])
                                                     TimeStamp:self.datePicker.date];
    
    [self.myDelegate addWorkout:workout];
    [self.myDelegate updateUI];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)updateUI {
    [self.exerciseTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.exercises count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.row != 0 )
    {
        self.selectedRow = indexPath.row;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"exerciseCell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    
    if ([self.exercises[indexPath.row] isKindOfClass:[NSString class]]) {
        cell.textLabel.text = self.exercises[indexPath.row];
    }
    else {
        FISExercise *exercise = self.exercises[indexPath.row];
        cell.textLabel.text = exercise.name;
    }
    
    return cell;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if (self.exerciseTableView.indexPathForSelectedRow.row == 0) {
        return YES;
    }
    
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddExerciseViewController *addExerciseVC = segue.destinationViewController;
    
    addExerciseVC.myDelegate = self;
}
@end
