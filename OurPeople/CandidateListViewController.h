//
//  CandidateListViewController.h
//  OurPeople
//
//  Created by Brendan Grieve on 23/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CandidateDetails.h"

@interface CandidateListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
    
{
    IBOutlet UITableView *TV;
}

@property (strong, nonatomic) IBOutlet UISegmentedControl *Segment;

-(IBAction)ChangeSegment:(id)sender;

@property (nonatomic, strong) NSString *Location;
@property (nonatomic, strong) NSString *Role;
@property (strong, nonatomic) IBOutlet UILabel *LocationLabel;

@property (strong, nonatomic) Candidate *SelectedCandidate;

@property (nonatomic, strong) NSArray *Candidates;

@end
