
//
//  MIMPieChart.m
//  MIMChartLib
//
//  Created by Eric Chang on 01/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
typedef enum
{
    REDTINT,
    GREENTINT,
    BEIGETINT
    

}TINTCOLOR;

@interface MIMPieChart : UIView {
    
    NSArray* itemArray;
    NSArray* nameArray;
    NSArray* myColorArray; 
    
    float radius;

    BOOL valuesReadFromCSV;
    NSMutableArray *valueArray;
    UIColor *backgroundColor;
    BOOL enableBottomTitles;
    NSMutableArray *titleArray;
    NSInteger tintValue;
    
    @private
    float _centerX;
    float _centerY;
    NSMutableArray *angleArrays;
    int selectedPie;
    BOOL returnBackToOriginalLocation;
    TINTCOLOR tint;
    
    
}
@property(nonatomic,retain)NSArray* itemArray;
@property(nonatomic,retain)NSArray* nameArray;
@property(nonatomic,retain)NSArray* myColorArray;
@property(nonatomic,assign)float radius;
@property(nonatomic,assign)NSInteger tintValue;
@property(nonatomic,retain)UIColor *backgroundColor;
@property(nonatomic,assign)BOOL enableBottomTitles;
@property(nonatomic,retain)NSMutableArray *titleArray;
@property(nonatomic,assign) TINTCOLOR tint;

-(void)findCenter;
-(void)readFromCSV:(NSString*)path  TitleAtColumn:(int)tcolumn  DataAtColumn:(int)dcolumn;
-(void)drawPieChart;
-(void)drawBottomTitlesText;
-(int)findQuadrant:(CGPoint)touchPoint;

@end
