---
  tags: custom protocol, key value collection operators
  languages: objc
---

Pushup Protocols
=======

### Goals 
- Send data back through an app using custom protocols with delegates. 
- Get some practice with reading other people's code
- Learn about Key Value Collection Operators

### Objective 

**A fellow programmer has written an exercise tracker, but it isn't quite finished. Let's make it work.**

## Instructions

- Add a custom protocol and delegate to get stats for a new exercise log entry to the `StatsViewController` from the `AddEntryViewController`.
- Add a custom protocol and delegate to get stats for a new exercise option to the `AddExerciseViewController` to the `AddEntryViewController`.
- Use segue delegate methods to pass data forward to each view controller from prior view controllers.
- Attach the `UIButtons` from our storyboard to their associated controllers for use as `IBAction`s, and then write the code to make them work.

- No tests for this one,  but if you want to do it correctly, you will not use unwind segues, NSNotificationCenter, or blocks to pass data around (to the extent you are already familiar with some or all of these methods.) You will also not have any singleton objects in your program.

## Hints

- There are a couple of errors that the fellow programmer has left in the program that you may want to deal with along the way that have nothing to do with custom delegate / protocols. However, none of them are required to be fixed to make the program work under "ideal" conditions.

- Also, don't forget to take a look at how the methods to get the statistics work! While we won't lecture on KVC Collection Operators, they can be quite a nice quick win!