//
//  CandidateDetails.m
//  OurPeople
//
//  Created by Brendan Grieve on 25/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import "CandidateDetails.h"

@interface CandidateDetails ()

@end

@implementation CandidateDetails

@synthesize candidate;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Draws Details about the selected candidate.
    self.Name.text = [NSString stringWithFormat:@"%@ %@", candidate.FirstName, candidate.SurName];
    self.Location.text = [NSString stringWithFormat:@"Location: %@", candidate.Location];
    self.Role.text = [NSString stringWithFormat:@"%@", candidate.Role];
    self.Role.adjustsFontSizeToFitWidth = YES;
    self.CandidatePicture.image = candidate.Picture;
    
    //Makes sure the text fits into the label.
    //self.Name.adjustsFontSizeToFitWidth = YES;
    //self.Location.adjustsFontSizeToFitWidth = YES;
    //self.Role.adjustsFontSizeToFitWidth = YES;
}

- (IBAction)BackButton:(id)sender {
    [self performSegueWithIdentifier:@"backtolist" sender:self];
}

- (IBAction)EmailButton:(id)sender {
    //when the email button is pressed do this.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end