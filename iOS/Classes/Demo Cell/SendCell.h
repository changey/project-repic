//
//  SendCell.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>

@interface SendCell : UITableViewCell{
    IBOutlet UIButton *check;
    IBOutlet UIImageView *imgv;
    IBOutlet UILabel *name;
    IBOutlet UIImageView *check_v;
    
    NSString *check_s;
    
    int check_i;
}
@property (strong, nonatomic) NSString *check_s;

@property (strong, nonatomic) IBOutlet UIImageView *check_v;

@property (strong, nonatomic) IBOutlet UIImageView *imgv;
@property (strong, nonatomic) IBOutlet UILabel *name;

@property (strong, nonatomic) IBOutlet UIButton *check;

-(IBAction) check_a;

@end
