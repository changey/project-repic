//
//  DetailViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/30/13.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    IBOutlet UIImageView *imgv;
    
    NSString *url;
    
    IBOutlet UITextView *txtv;
    
    NSString *captions;
}

@property(nonatomic,retain) NSString *captions;

@property(nonatomic,retain) IBOutlet UITextView *txtv;

@property(nonatomic,retain) NSString *url; 

@property(nonatomic,retain) IBOutlet UIImageView *imgv;

@end
