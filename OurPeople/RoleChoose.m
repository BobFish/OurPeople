//
//  RoleChoose.m
//  OurPeople
//
//  Created by Brendan Grieve on 24/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import "RoleChoose.h"

@interface RoleChoose ()
{
    NSArray *Roles;
}
@end

@implementation RoleChoose

@synthesize LocationTemp;
@synthesize LocationTempText;

- (IBAction)ContinueButton:(id)sender{
    [self performSegueWithIdentifier:@"fred2" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Roles = @[ @"All", @".NET Developer", @"Buisness Analyst", @"Senior Developer C,C++", @"Senior Dev .NET, Java, C#", @"Java Application Developer"];
    LocationTemp.text = LocationTempText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView*)component{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [Roles count];
}

-(NSString *)pickerView:(UIPickerView *)pickerview titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    RowSelected = [Roles objectAtIndex:row];
    return [Roles objectAtIndex:row];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 320;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Item Selected %ld", (long)row);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"fred2"]) {
        CandidateListViewController *destViewController = segue.destinationViewController;
        destViewController.Location = [NSString stringWithFormat:@"%@", self.LocationTemp.text];
        destViewController.Role = [NSString stringWithFormat:@"%@", RowSelected];
    }
}
@end
