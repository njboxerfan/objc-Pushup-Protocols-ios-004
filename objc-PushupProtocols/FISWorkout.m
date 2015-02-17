//
//  Workout.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISWorkout.h"

@implementation FISWorkout

- (instancetype)init
{
    return [self initWithReps:@10 sets:@1 numberOfWorkoutBuddies:@0 timeStamp:[NSDate date]];
}

-(instancetype)initWithReps:(NSNumber *)reps sets:(NSNumber *)sets numberOfWorkoutBuddies:(NSNumber *)workoutBuddies timeStamp:(NSDate *)timestamp {
    
    self = [super init];
    if (self) {
        self.reps = reps;
        self.sets = sets;
        self.numberOfWorkoutBuddies = workoutBuddies;
        self.timestamp = timestamp;
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
