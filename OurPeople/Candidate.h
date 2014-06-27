//
//  Candidate.h
//  OurPeople
//
//  Created by Brendan Grieve on 25/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Candidate : NSObject

@property (nonatomic, strong) NSString *FirstName;
@property (nonatomic, strong) NSString *SurName;
@property (nonatomic, strong) NSString *Location;
@property (nonatomic, strong) NSString *Role;
@property (nonatomic, strong) UIImage *Picture;

@end
