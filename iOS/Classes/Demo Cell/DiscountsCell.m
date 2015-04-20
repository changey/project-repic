//
//  DiscountsCell.m
//  NB_list
//
//  Created by Eric Chang on 10/11/12.
//
//

#import "DiscountsCell.h"

@implementation DiscountsCell

@synthesize stateLabel;
@synthesize capitalLabel, imgv, address, item, discount, expiration;

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
