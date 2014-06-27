//
//  CandidatesTableCell.h
//  OurPeople
//
//  Created by Brendan Grieve on 24/06/2014.
//  Copyright (c) 2014 Fujitsu. All rights reserved.
//

//Hello

#import <UIKit/UIKit.h>

@interface CandidatesTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *NameLabel;
@property (nonatomic, weak) IBOutlet UILabel *LocationLabel;
@property (nonatomic, weak) IBOutlet UILabel *RoleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ThumbnailImageView;

@end
