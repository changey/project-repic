
//
//  MIMPieChart.m
//  MIMChartLib
//
//  Created by Eric Chang on 01/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MIMColor : NSObject {
    
}
+(NSDictionary *)GetColorAtIndex:(int)index;
+(void)InitColors;
+(void)InitGreenTintColors;
+(void)InitFragmentedBarColors;
+(NSInteger)sizeOfColorArray;
+(void)nonAdjacentGradient;
+(void)lightGradients;
+(void)nonAdjacentPlainColors;

@end
