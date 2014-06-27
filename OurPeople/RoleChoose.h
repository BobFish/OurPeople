//
//  RoleChoose.h
//  OurPeople
//
//  Created by Brendan Grieve on 24/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CandidateListViewController.h"

NSString *RowSelected;

@interface RoleChoose: UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *LocationTemp;
@property (nonatomic, strong) NSString *LocationTempText;

- (IBAction)ContinueButton:(id)sender;

@end