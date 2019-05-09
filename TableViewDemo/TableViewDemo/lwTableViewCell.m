//
//  lwTableViewCell.m
//  TableViewDemo
//
//  Created by 刘文强 on 2019/3/26.
//  Copyright © 2019年 LWQ. All rights reserved.
//

#import "lwTableViewCell.h"
#import <Masonry.h>
@implementation lwTableViewCell

- (void)setModel:(lwmodel *)model
{
    _model = model;
    
    _descL.text = model.desc;
    
    NSLog(@"*******%f***************",CGRectGetMaxY(self.bounds));
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(100, 100));
            make.top.equalTo(self.contentView).offset(10);
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
        }];
        _icon.backgroundColor = [UIColor brownColor];
        self.descL = [[UILabel alloc] init];
        self.descL.numberOfLines = 0;
        [self.contentView addSubview:self.descL];
        [self.descL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.icon.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
//        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self);
//        }];
        
        
        
    }
    return self;
}

@end
