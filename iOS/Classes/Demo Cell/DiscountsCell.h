//
//  DiscountsCell.h
//  NB_list
//
//  Created by Eric Chang on 10/11/12.
//
//

#import <UIKit/UIKit.h>

@interface DiscountsCell : UITableViewCell{
    IBOutlet UILabel *stateLabel;
	IBOutlet UILabel *capitalLabel;
    IBOutlet UIButton *button;
    IBOutlet UIImageView *imgv;
    IBOutlet UILabel *address;
    
    IBOutlet UILabel *item;
    IBOutlet UILabel *discount;
    IBOutlet UILabel *expiration;
}
@property (nonatomic,retain) IBOutlet UILabel *item;
@property (nonatomic,retain) IBOutlet UILabel *discount;
@property (nonatomic,retain) IBOutlet UILabel *expiration;

@property (nonatomic,retain) IBOutlet UILabel *stateLabel;
@property (nonatomic,retain) IBOutlet UILabel *capitalLabel;
@property (nonatomic,retain) IBOutlet UIButton *button;
@property (nonatomic,retain) IBOutlet UIImageView *imgv;
@property (nonatomic,retain) IBOutlet UILabel *address;

@end
