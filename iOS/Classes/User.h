//
//  User.h
//  NB_list
//
//  Created by mac on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface User : NSObject {
	NSString *correct;
	NSString *total;

    
    NSString *instructions;
	
	
}
@property (nonatomic, retain) NSMutableDictionary *keys;
@property (nonatomic,strong) NSString *correct;
@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *instructions;

+ (User *)sharedUser;
@end
