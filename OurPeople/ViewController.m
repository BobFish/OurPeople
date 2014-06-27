//
//  ViewController.m
//  OurPeople
//
//  Created by Brendan Grieve on 23/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
NSArray *Locations;
}


@end

@implementation ViewController

- (IBAction)DisplayButton:(id)sender{
    [self performSegueWithIdentifier:@"fred" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Locations = @[ @"All",@"ACT",@"Vic",@"SA",@"NSW",@"Tas",@"WA",@"Qld",@"NT"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView*)component{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [Locations count];
}

    -(NSString *)pickerView:(UIPickerView *)pickerview titleForRow:(NSInteger)row forComponent:(NSInteger)component{
        RowSelected = [Locations objectAtIndex:row];
        return [Locations objectAtIndex:row];
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
    if ([segue.identifier isEqualToString:@"fred"]) {
        RoleChoose *destViewController = segue.destinationViewController;
        destViewController.LocationTempText = [NSString stringWithFormat:@"%@", RowSelected ];
    }
}

@end