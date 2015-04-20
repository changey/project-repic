    //
//  User.m
//  NB_list
//
//  Created by mac on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "User.h"
static User *sharedUser = nil;
@implementation User
//@synthesize username;
//@synthesize password;
@synthesize instructions, correct, total;


#pragma mark -
#pragma mark Singleton Methods
/*- (id)init
{
	if ( self = [super init] )
	{
		self.keys = [[NSMutableDictionary alloc] init];
	}
	return self;
	
}*/

+ (User *)sharedUser {
	if(sharedUser == nil){
		sharedUser = [[super allocWithZone:NULL] init];
	}
	return sharedUser;
}
+ (id)allocWithZone:(NSZone *)zone {
	return [[self sharedManager] retain];
}
- (id)copyWithZone:(NSZone *)zone {
	return self;
}
- (id)retain {
	return self;
}
- (unsigned)retainCount {
	return NSUIntegerMax;
}
- (void)release {
	//do nothing
}
- (id)autorelease {
	return self;
}
@end