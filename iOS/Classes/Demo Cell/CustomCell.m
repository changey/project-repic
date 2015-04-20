//
//  CustomCell.m
//  tabbartest
//
//  Created by Eric Chang on 7/1/12.
//
//

#import "CustomCell.h"


@implementation CustomCell

@synthesize stateLabel;
@synthesize capitalLabel, imgv, address, mer_name, mer_address, name, time;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
