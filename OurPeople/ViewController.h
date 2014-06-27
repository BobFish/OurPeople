//
//  ViewController.h
//  OurPeople
//
//  Created by Brendan Grieve on 23/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoleChoose.h"

NSString *RowSelected;

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)DisplayButton:(id)sender;

@end