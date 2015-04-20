//
//  ImageViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "ImageViewController.h"
#import "User2.h"
#import <QuartzCore/QuartzCore.h>
#import "TPKeyboardAvoidingScrollView.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

@synthesize imageButton, btnImage, ctextView;
@synthesize scrollView, viewsend, caption, save, placeholderLabel;

-(IBAction)caption_a{
    if (caption_i==0){
      [caption setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
      caption_i=1;
    }
    else{
      [caption setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
      caption_i=0;
    }
}

-(IBAction)save_a{
    if (save_i==0){
        [save setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        save_i=1;
    }
    else{
        [save setImage:[UIImage imageNamed:@"uncheck.png"] forState:UIControlStateNormal];
        save_i=0;
    }
}

-(IBAction)send{
    User2 *user=[User2 sharedUser];
    user.captions=ctextView.text;
    
    if(self.viewsend == nil) {
        SendViewController *secondxib =
        [[SendViewController alloc] initWithNibName:@"SendViewController" bundle:[NSBundle mainBundle]];
        secondxib.btnImage=btnImage;
        self.viewsend = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewsend animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, ctextView.frame.size.width - 20.0, 34.0)];
//    [placeholderLabel setText:@"Captions"];
//    // placeholderLabel is instance variable retained by view controller
//    [placeholderLabel setBackgroundColor:[UIColor clearColor]];
//    //[placeholderLabel setFont:[challengeDescription font]];
//    [placeholderLabel setTextColor:[UIColor lightGrayColor]];
//    
//    [ctextView addSubview:placeholderLabel];
    
    //ctextView = [[UITextView alloc]init];
    ctextView.delegate = self;
    
    caption_i=0;
    save_i=0;
    
    [imageButton setImage:btnImage forState:UIControlStateNormal];
    [imgv setImage:imgv.image];
    
    [ctextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [ctextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [ctextView.layer setBorderWidth: 1.0];
    [ctextView.layer setCornerRadius:12.0f];
    [ctextView.layer setMasksToBounds:NO];
    ctextView.layer.shouldRasterize = YES;
    [ctextView.layer setShadowRadius:2.0f];
    ctextView.layer.shadowColor = [[UIColor blackColor] CGColor];
    ctextView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    ctextView.layer.shadowOpacity = 1.0f;
    ctextView.layer.shadowRadius = 1.0f;
    
    ctextView.text = @"Captions";
    ctextView.textColor = [UIColor lightGrayColor];
    
    [super viewDidLoad];

}

//- (void) textViewDidChange:(UITextView *)theTextView
//{
//    if(![ctextView hasText]) {
//        [ctextView addSubview:placeholderLabel];
//    } else if ([[ctextView subviews] containsObject:placeholderLabel]) {
//        [placeholderLabel removeFromSuperview];
//    }
//}
//
//- (void)textViewDidEndEditing:(UITextView *)theTextView
//{
//    if (![ctextView hasText]) {
//        [ctextView addSubview:placeholderLabel];
//    }
//}

- (void) loadInterface {
    //CARREGA TEXTVIEW PARA DIGITAR MENSAGEM
    ctextView = [[UITextView alloc]init];
    ctextView.delegate = self;
    
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    ctextView.text = @"";
    ctextView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    NSLog(@"lala");
    
    if(ctextView.text.length == 0){
        ctextView.textColor = [UIColor lightGrayColor];
        ctextView.text = @"Captions";
        [ctextView resignFirstResponder];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    User2 *user=[User2 sharedUser];
    imgv.image=user.imgv.image;
    UIImage *image=[UIImage imageNamed:@"logo57.jpg"];
    imgv.image=user.image;
    [imageButton setImage:btnImage forState:UIControlStateNormal];
    user.captions=@"";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
