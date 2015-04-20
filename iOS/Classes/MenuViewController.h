//
//  MenuViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>
#import "MerDiscountsViewController.h"
#import "InboxViewController.h"
#import "ImageViewController.h"
#import "AddfriendViewController.h"

@class MerDiscountsViewController;
@class InboxViewController;
@class ImageViewController;
@class AddfriendViewController;


@interface MenuViewController : UIViewController<UIImagePickerControllerDelegate>{
    MerDiscountsViewController *viewmer;
    InboxViewController *viewin;
    ImageViewController *viewimage;
    
    AddfriendViewController *viewadd;
    
    IBOutlet UIButton *inbox_but;
    IBOutlet UIButton *camera_but;
    
    IBOutlet UIImageView *imgv;
    IBOutlet UIImageView *img_photo;
    
}

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@property (retain, nonatomic) AddfriendViewController *viewadd;

@property (retain, nonatomic) IBOutlet UIImageView *imgv;
@property (retain, nonatomic) IBOutlet UIImageView *img_photo;

@property (retain, nonatomic) IBOutlet UIButton *inbox_but;
@property (retain, nonatomic) IBOutlet UIButton *camera_but;

@property (retain, nonatomic) ImageViewController *viewimage;

@property (retain, nonatomic) MerDiscountsViewController *viewmer;
@property (retain, nonatomic) InboxViewController *viewin;

- (IBAction)inbox;
- (IBAction)picture;

- (IBAction) Add:(id)sender;

@end
