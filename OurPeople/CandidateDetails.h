//
//  CandidateDetails.h
//  OurPeople
//
//  Created by Brendan Grieve on 25/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Candidate.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>


@interface CandidateDetails : UIViewController

@property (strong, nonatomic) Candidate *candidate;

@property (strong, nonatomic) IBOutlet UILabel *Name;
@property (strong, nonatomic) IBOutlet UILabel *Location;
@property (strong, nonatomic) IBOutlet UILabel *Role;

@property (strong, nonatomic) IBOutlet UIImageView *CandidatePicture;

- (IBAction)BackButton:(id)sender;
- (IBAction)EmailButton:(id)sender;

@end
