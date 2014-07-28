//
//  Test1+Custom.m
//  TestMR2_3_3
//
//  Created by Richard Wylie on 28/07/2014.
//  Copyright (c) 2014 sigmundfridge. All rights reserved.
//

#import "Test1+Custom.h"

@implementation Test1 (Custom)
+(instancetype) createRandomEntityInContext:(NSManagedObjectContext*)context{
    Test1 *output = [Test1 MR_createEntityInContext:context];
    output.bName = [Test1 randomStringOfLength:10];
    output.aUuid = [[NSUUID UUID] UUIDString];
    output.email = [Test1 randomStringOfLength:6];
    output.email = [NSString stringWithFormat:@"%@%@",output.email, @"@@example.com"];
    output.fName = [Test1 randomStringOfLength:10];
    output.lName = [Test1 randomStringOfLength:10];
    return output;
}

+(NSString*)randomStringOfLength:(int)length {
    static NSString *letters = @"abcdefghijlmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for(int i=0;i<length;i++) {
        [string appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    return string;
}

-(NSString*)initial {
//    NSLog(@"Initial : %@", [self.lName substringToIndex:1]);
    return [self.lName substringToIndex:1];
}

@end
