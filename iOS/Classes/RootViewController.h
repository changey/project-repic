//
//  RootViewController.h
//  NavApp
//
//  Created by Eric Chang on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantViewController.h"
#import "Signup2ViewController.h"
#import "MerDiscountsViewController.h"
#import "FbGraph.h"
#import "MenuViewController.h"
#import "ImageViewController.h"



@class MerchantViewController;
@class Signup2ViewController;
@class MerDiscountsViewController;
@class ASIHTTPRequest;
@class MenuViewController;
@class ImageViewController;
@class TPKeyboardAvoidingScrollView;


@interface RootViewController : UIViewController <UITextFieldDelegate>{
    
    ImageViewController *viewimage;
    
    MenuViewController *viewmenu;
    
    ASIHTTPRequest *request;
    NSString *responseString;
    
    FbGraph *fbGraph;
    
    MerDiscountsViewController *viewmerdis;
    
    IBOutlet UIImageView *imageView;
    NSArray *welcomePhotos;
    int photoCount;
    
    MerchantViewController *viewmer;
    Signup2ViewController *viewsign;
    
    IBOutlet UITextField *user;
    IBOutlet UITextField *pass;
    
    NSString *received;
    
    //sketchpad part
    CGPoint lastPoint;
	UIImageView *drawImage;
	BOOL mouseSwiped;	
	int mouseMoved;
    
    //clicker request part
    UIButton        *sendButton;
    UITextField     *nameTextField;
    UITextView      *messageTextView;
    UITextView      *responseTextView;
    NSMutableData   *receivedData;
    NSMutableData* responseData;
    NSString *trial;
    NSString *merchant_id;
}

@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (retain, nonatomic)ImageViewController *viewimage;

@property (retain, nonatomic) MenuViewController *viewmenu;

@property (retain, nonatomic) ASIHTTPRequest *request;


@property (nonatomic, retain) NSString *responseString;

@property (nonatomic, retain) FbGraph *fbGraph;

@property(nonatomic, retain) MerDiscountsViewController *viewmerdis;

@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) NSArray *welcomePhotos;

@property(nonatomic, retain) NSString *merchant_id;

@property(nonatomic, retain) MerchantViewController *viewmer;
@property(nonatomic, retain) Signup2ViewController *viewsign;

@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;

@property (nonatomic, retain) NSString *received;

//clicker request part
@property (nonatomic, retain) IBOutlet UIButton *sendButton;
@property (nonatomic, retain) IBOutlet UIButton *sendpush;
@property (nonatomic, retain) IBOutlet UITextField     *nameTextField;
@property (nonatomic, retain) IBOutlet UITextView *responseTextView;
@property (nonatomic, retain) IBOutlet UITextView *messageTextView;
@property (nonatomic, retain) NSMutableData *receivedData;
@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic) NSString *trial;

-(void)transitionPhotos;

-(IBAction)image;

-(IBAction)next;
-(IBAction)end;
-(IBAction)connect;
-(IBAction)nowifi;
-(IBAction)send;
-(IBAction)signup;
-(IBAction)signin;

-(IBAction)fbconnect;

@end
