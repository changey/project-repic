//
//  MyTableCell.h
//  NB_list
//
//  Created by Eric Chang on 7/24/12.
//
//

#import <UIKit/UIKit.h>

@interface MyTableCell : UITableViewCell{
    NSMutableArray *columns;
}
- (void)addColumn:(CGFloat)position;
@end

