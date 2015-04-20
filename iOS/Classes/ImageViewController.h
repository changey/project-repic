//
//  ImageViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>
#import "SendViewController.h"

@class TPKeyboardAvoidingScrollView;
@class SendViewController;

@interface ImageViewController : UIViewController<UITextViewDelegate>{
    SendViewController *viewsend;
    
    IBOutlet UIImageView *imgv;
    IBOutlet UIButton *imageButton;
    IBOutlet UITextView *ctextView;
    
    IBOutlet UIButton *caption;
    IBOutlet UIButton *save;
    
    int caption_i;
    int save_i;
    
    UIImage *btnImage;
    UILabel *placeholderLabel;
    
    
}

@property (nonatomic, retain) UILabel *placeholderLabel;

@property (nonatomic, retain) IBOutlet UIButton *caption;
@property (nonatomic, retain) IBOutlet UIButton *save;

@property (nonatomic, retain) SendViewController *viewsend;

@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextView *ctextView;

@property (strong, nonatomic) UIImage *btnImage;

@property (strong, nonatomic) IBOutlet UIImageView *imgv;
@property (nonatomic, retain) IBOutlet UIButton *imageButton;

-(IBAction)send;

-(IBAction)caption_a;
-(IBAction)save_a;

@end
