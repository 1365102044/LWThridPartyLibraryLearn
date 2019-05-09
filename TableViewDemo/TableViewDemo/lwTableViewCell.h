//
//  lwTableViewCell.h
//  TableViewDemo
//
//  Created by 刘文强 on 2019/3/26.
//  Copyright © 2019年 LWQ. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "lwmodel.h"
@interface lwTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel * descL;
@property (nonatomic, strong) lwmodel * model;
@property (nonatomic, strong) UIImageView * icon;

@end


