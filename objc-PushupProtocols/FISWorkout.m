//
//  Workout.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISWorkout.h"
#import "FISExercise.h"

@implementation FISWorkout

-(instancetype)initWithExercise:(FISExercise *)exercise Reps:(NSNumber *)reps sets:(NSNumber *)sets numberOfWorkoutBuddies:(NSNumber *)workoutBuddies timeStamp:(NSDate *)timestamp {
    
    self = [super init];
    if (self) {
        self.reps = reps;
        self.sets = sets;
        self.numberOfWorkoutBuddies = workoutBuddies;
        self.timestamp = timestamp;
        self.exercise = exercise;
    }
    
    return self;
}

-(NSDate *)computedDate {

    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents *dateComponentsAtMidnight = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.timestamp];

    NSDate *dateAtMidnight = [calendar dateFromComponents:dateComponentsAtMidnight];
    
    return dateAtMidnight;
}


@end
