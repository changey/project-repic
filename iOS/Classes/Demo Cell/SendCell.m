//
//  SendCell.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "SendCell.h"

@implementation SendCell

@synthesize check, imgv, name, check_v, check_s;

-(IBAction)check_a{
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
