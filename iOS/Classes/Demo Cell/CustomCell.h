//
//  CustomCell.h
//  tabbartest
//
//  Created by Eric Chang on 7/1/12.
//
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
	IBOutlet UILabel *stateLabel;
	IBOutlet UILabel *capitalLabel;
    IBOutlet UIButton *button;
    IBOutlet UIImageView *imgv;
    IBOutlet UILabel *address;
    IBOutlet UILabel *mer_name;
    IBOutlet UILabel *mer_address;
    IBOutlet UILabel *name;
    
    IBOutlet UILabel *time;
}

@property (nonatomic,retain) IBOutlet UILabel *time;

@property (nonatomic,retain) IBOutlet UILabel *name;

@property (nonatomic,retain) IBOutlet UILabel *mer_name;
@property (nonatomic,retain) IBOutlet UILabel *mer_address;

@property (nonatomic,retain) IBOutlet UILabel *stateLabel;
@property (nonatomic,retain) IBOutlet UILabel *capitalLabel;
@property (nonatomic,retain) IBOutlet UIButton *button;
@property (nonatomic,retain) IBOutlet UIImageView *imgv;
@property (nonatomic,retain) IBOutlet UILabel *address;

@end
