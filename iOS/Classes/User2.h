//
//  User2.h
//  NB_list
//
//  Created by Eric Chang on 6/14/12.
//
//

#import <Foundation/Foundation.h>

@interface User2 : NSObject{
    NSTimer *timer;
    
    NSString *merchant_id;
    NSString *merchant_section;
    
	NSString *correct;
	NSString *total;
    
    NSString *seconds2, *minutes2;
    
    NSString *instructions;
    
    NSString *rotate1;
    
    NSString *user;
    NSString *pass;
    
    NSString *item;
    NSString *promotion;
    
    NSString *url;
    
    NSString *deviceToken;
    
    UIImageView *imgv;
    UIImage *image;
    
    NSString *date;
    NSString *date_utc;
    
    NSString *inbox;
    
    NSString *captions;
    
    NSString *messages_number;
    NSString *receiver_number;
    
    NSMutableArray *friends_selected;

	
}

@property (retain, nonatomic) NSMutableArray *friends_selected;

@property (retain, nonatomic) NSString *messages_number;
@property (retain, nonatomic) NSString *receiver_number;

@property (retain, nonatomic) NSString *date_utc;

@property (retain, nonatomic)  NSString *captions;
@property (retain, nonatomic) NSString *inbox;

@property (retain, nonatomic) NSString *date;

@property (retain, nonatomic) UIImage *image;

@property (retain, nonatomic) UIImageView *imgv;

@property (retain, nonatomic) NSString *deviceToken;

@property (retain, nonatomic) NSString *url;

@property (retain, nonatomic) NSString *item;
@property (retain, nonatomic) NSString *promotion;

@property (retain, nonatomic) NSString *merchant_id;
@property (retain, nonatomic) NSString *merchant_section;


@property (nonatomic,strong) NSString *user;
@property (nonatomic,strong) NSString *pass;


+ (User2 *)sharedUser;
@end
