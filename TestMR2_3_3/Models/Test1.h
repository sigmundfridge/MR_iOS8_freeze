//
//  Test1.h
//  TestMR2_3_3
//
//  Created by Richard Wylie on 28/07/2014.
//  Copyright (c) 2014 sigmundfridge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Test1 : NSManagedObject

@property (nonatomic, retain) NSString * aUuid;
@property (nonatomic, retain) NSString * bName;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * fName;
@property (nonatomic, retain) NSString * lName;
@property (nonatomic, retain) NSNumber * itemDeleted;

@end
