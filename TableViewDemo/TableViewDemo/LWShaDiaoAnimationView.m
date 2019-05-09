//
//  LWShaDiaoAnimationView.m
//  TableViewDemo
//
//  Created by 刘文强 on 2019/5/8.
//  Copyright © 2019年 LWQ. All rights reserved.
//

#import "LWShaDiaoAnimationView.h"
#import <YYKit.h>
@interface LWShaDiaoAnimationView()

@property (nonatomic, strong) NSTimer * lwTimer;
@property (nonatomic, strong) NSMutableArray * viewsMutableArray;
@property (nonatomic, strong) UIView * outItemView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL jiaBool;
@property (nonatomic, assign) BOOL topBool;


@end
@implementation LWShaDiaoAnimationView

CGFloat lw_y = 150;
CGFloat lw_w = 50;
CGFloat lw_h = 50;
CGFloat lw_x = 50;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        _jiaBool = NO;
        _index = 2;
        self.viewsMutableArray = [NSMutableArray new];
        
        self.lwTimer  = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
     
            [self start];
        }];
        [[NSRunLoop currentRunLoop] addTimer:_lwTimer forMode:NSRunLoopCommonModes];
        
        [self confiUI];
        
    }
    return self;
}

- (void)start
{
    
    UIView *item1 = self.viewsMutableArray[self->_index];
    
    [UIView animateWithDuration:.5 animations:^{
        
        if (!_topBool) {
            
            item1.frame = CGRectMake(item1.left, item1.top - lw_h - 20, lw_w, lw_h);
            
            self->_outItemView.frame = CGRectMake(self.outItemView.left, self.outItemView.top - lw_h - 20, lw_w, lw_h);
        }else{
            item1.frame = CGRectMake(item1.left, item1.top + lw_h + 20, lw_w, lw_h);
            
            self->_outItemView.frame = CGRectMake(self.outItemView.left, self.outItemView.top + lw_h + 20, lw_w, lw_h);

        }
        
    } completion:^(BOOL finished) {
        
        [self.viewsMutableArray removeObject:item1];
        [self.viewsMutableArray insertObject:self->_outItemView atIndex:_index];
        self.outItemView = item1;
        
        if (_index == 0) {
            _index++;
        }else if (_index == self.viewsMutableArray.count+1)
            {
                _index--;
            }
        else{
            _index = (_jiaBool) ? _index+1 :_index-1;
        }
        [UIView animateWithDuration:0.5 animations:^{
            
            self.outItemView.frame = CGRectMake(lw_x + _index * lw_w + (_index-1)*20, self.outItemView.top, lw_w, lw_h);
            
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}


- (void)confiUI
{
    
    
    for (int i = 0; i<5; i++) {
        UIView *itemView = [[UIView alloc] init];
        itemView.backgroundColor = [UIColor redColor];
        itemView.frame = CGRectMake(lw_x + lw_w * i + i*20, lw_y, lw_w, lw_h);
        [self addSubview:itemView];
        if (i == 4) {
            _outItemView = itemView;
            UIView *itemview3 = self.viewsMutableArray[2];
            _outItemView.frame = CGRectMake(itemview3.left, itemview3.bottom + 20, lw_w, lw_h);
            _topBool = NO;
        }else{
            [self.viewsMutableArray addObject:itemView];
            }
    }
    
    
}


@end
