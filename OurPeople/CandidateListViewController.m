//
//  CandidateListViewController.m
//  OurPeople
//
//  Created by Brendan Grieve on 23/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import "CandidateListViewController.h"
#import "CandidatesTableCell.h"
#import "Candidate.h"

@interface CandidateListViewController ()
@end

@implementation CandidateListViewController
{
    NSArray *NameArray;
    NSArray *LocationArray;
    NSArray *RoleArray;
    NSArray *sortedArray;
    NSArray *LocationsortedArray;
    NSArray *CandidateArray;
    NSMutableArray *FilteredCandidates;
}

@synthesize LocationLabel;
@synthesize Location;
@synthesize Role;


- (IBAction)ChangeSegment:(id)sender {
    if (self.Segment.selectedSegmentIndex == 0) {
        sortedArray = [self.Candidates sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Candidate *candidate1 = obj1;
            Candidate *candidate2 = obj2;
            
            return [candidate1.FirstName compare:candidate2.FirstName];
        }];
    }
    if (self.Segment.selectedSegmentIndex == 1) {
        sortedArray = [self.Candidates sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Candidate *candidate1 = obj1;
            Candidate *candidate2 = obj2;
            
            return [candidate1.Role compare:candidate2.Role];
        }];
    }
    if (self.Segment.selectedSegmentIndex == 2) {
        sortedArray = [self.Candidates sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Candidate *candidate1 = obj1;
            Candidate *candidate2 = obj2;
            
            return [candidate1.Location compare:candidate2.Location];
        }];
    }
        [TV reloadData];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setupModel:(NSString *)path
{
    NSMutableArray *candidates = [[NSMutableArray alloc]init];
    
    //candidates = [NSArray arrayWithContentsOfFile:path];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NameArray = [[dict objectForKey:@"Name"] copy];
    LocationArray = [dict objectForKey:@"Location"];
    RoleArray = [dict objectForKey:@"Role"];
    CandidateArray = [dict objectForKey:@"Candidates"];
    
    
    for (NSDictionary *candidateDictionary in CandidateArray){
            Candidate *candidate = [[Candidate alloc]init];
            candidate.FirstName = [candidateDictionary objectForKey:@"Name"];
            candidate.Location = [candidateDictionary objectForKey:@"Location"];
            candidate.Role = [candidateDictionary objectForKey:@"Role"];
            candidate.SurName = [candidateDictionary objectForKey:@"Surname"];
            candidate.Picture = [UIImage imageNamed:[candidateDictionary objectForKey:@"Picture"]];
        
        if ([candidate.Location isEqual: self.Location ]){
            if ([candidate.Role isEqual: self.Role]){
            [candidates addObject:candidate];
            }
        }
        if ([self.Location isEqual: @"All"]){
            if ([self.Role isEqual: @"All"]){
                [candidates addObject:candidate];
            }
        }
        if ([self.Role isEqual: @"All"]){
            if ([candidate.Location isEqual: self.Location]){
            [candidates addObject:candidate];
            }
        }
        if ([self.Location isEqual: @"All"]){
            if ([candidate.Role isEqual: self.Role]){
                [candidates addObject:candidate];
            }
        }
    }
    
    self.Candidates = candidates;
    
    for (Candidate *candidate in candidates){
        if ([candidate.Location isEqual: self.Location]){
            [FilteredCandidates addObject:candidate];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"CandidatesTableCell" bundle:nil];
    [TV registerNib:nib forCellReuseIdentifier:@"CandidatesTableCell"];
    // Find out the path of Candidates.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Candidates" ofType:@"plist"];
    
    [self setupModel:path];
    sortedArray = [self.Candidates copy];
    LocationsortedArray = LocationArray;
    LocationLabel.adjustsFontSizeToFitWidth = YES;
    
    if ([Location isEqual: @"All"]){
        Location = [NSString stringWithFormat:@"%@ candidates from all locations", Role];
    }
    if ([Location isEqual: @"ACT"]){
        Location = [NSString stringWithFormat:@"%@ candidates from the Australian Capital Territory", Role];
    }
    if ([Location isEqual: @"Vic"]){
        Location = [NSString stringWithFormat:@"%@ candidates from Victoria", Role];
    }
    if ([Location isEqual: @"SA"]){
        Location = [NSString stringWithFormat:@"%@ candidates from South Australia", Role];
    }
    if ([Location isEqual: @"Tas"]){
        Location = [NSString stringWithFormat:@"%@ candidates from Tasmania", Role];
    }
    if ([Location isEqual: @"Qld"]){
        Location = [NSString stringWithFormat:@"%@ candidates from Queensland", Role];
    }
    if ([Location isEqual: @"NT"]){
        Location = [NSString stringWithFormat:@"%@ candidates from the Northern Territory", Role];
    }
    if ([Location isEqual: @"WA"]){
        Location = [NSString stringWithFormat:@"%@ candidates from Western Australia", Role];
    }
    if ([Location isEqual: @"NSW"]){
        Location = [NSString stringWithFormat:@"%@ candidates from New South Wales", Role];
    }
    
        LocationLabel.text = Location;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sortedArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *simpleTableIdentifier = @"CandidatesTableCell";
    
    CandidatesTableCell *cell = (CandidatesTableCell *)[tableView dequeueReusableCellWithIdentifier:@"CandidatesTableCell"];
    
    Candidate *Candidate = [sortedArray objectAtIndex:indexPath.row];
    
    cell.NameLabel.text = [NSString stringWithFormat:@"%@ %@", Candidate.FirstName, Candidate.SurName];
    cell.LocationLabel.text = Candidate.Location;
    cell.RoleLabel.text = Candidate.Role;
    cell.RoleLabel.adjustsFontSizeToFitWidth = YES;
    cell.ThumbnailImageView.image = Candidate.Picture;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.SelectedCandidate = [sortedArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ViewDetails" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewDetails"]) {
        CandidateDetails *destViewController = segue.destinationViewController;
        destViewController.candidate = self.SelectedCandidate;
    }
}

- (IBAction)BackButton:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
}

@end