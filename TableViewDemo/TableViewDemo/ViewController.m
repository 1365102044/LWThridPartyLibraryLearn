//
//  ViewController.m
//  TableViewDemo
//
//  Created by 刘文强 on 2018/11/9.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <YYKit.h>
#import "lwTableViewCell.h"
#import "lwmodel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView+WebCache.h>
#import <SDWebImageCompat.h>
#import <AFNetworking.h>
#import "LWShaDiaoAnimationView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UITableView * mainTableView;
@property (nonatomic, strong) NSMutableArray * heightArray;
@property (nonatomic, strong) lwTableViewCell * tempcell;

@end

@implementation ViewController


- (void)requestUrl
{
    NSString *url = @"v2/clientAPP/app/banner_promotion";
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://192.168.1.222"]];
    [manager POST:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"\n\n---------------------downloadProgress:%@\n\n",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n\n*********************responseObject:%@\n\n",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"\n\n=====================error:%@\n\n",error);
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self requestUrl];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"lw";
    lwTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[lwTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    lwmodel *model = self.dataArray[indexPath.row];
    cell.descL.text = model.desc;
    [cell.icon sd_setShowActivityIndicatorView:YES];
    [cell.icon sd_setImageWithURL:@"https://upload-images.jianshu.io/upload_images/1136939-6046837ca4d764b0.png?imageMogr2/auto-orient/" completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    UIImage *im =  SDScaledImageForKey(@"keys",[UIImage imageNamed:@"6.6-1"]);
    _mainTableView.backgroundView = [[UIImageView alloc] initWithImage:im];
    
     float hei =  [cell systemLayoutSizeFittingSize:CGSizeMake(tableView.frame.size.width, 0) withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityFittingSizeLevel].height;
//    NSLog(@"-----------------%f",hei);
    model.cellheight = hei;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    lwmodel *model = self.dataArray[indexPath.row];
//    NSLog(@"*****************%f",model.cellheight);
    return  (model.cellheight != 0?model.cellheight:UITableViewAutomaticDimension);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self.view addSubview:self.mainTableView];
//    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];

    
    LWShaDiaoAnimationView *animationView = [[LWShaDiaoAnimationView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:animationView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray*)heightArray
{
    if (!_heightArray) {
        _heightArray = [[NSMutableArray alloc] init];
    }
    return _heightArray;
}
- (UITableView*)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
//        _mainTableView.rowHeight = UITableViewAutomaticDimension;
//        _mainTableView.estimatedRowHeight = 100;
    }
    return _mainTableView;
}
- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        NSArray *tem = @[@"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家sdas大大为恶趣味欧全文uasdjladasd",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接全额撒大声地发送到发地方收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了恶趣味群三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉按了三等奖达拉接收到拉大接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大ad大大地方家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达按了三等奖达拉接收到拉大拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接按了三等奖达拉接收到拉大收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大按了三等奖达拉接收到拉大大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等大事发生的奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收阿斯顿发送到发送到发送到发地方撒阿萨德法师法萨芬大事发生的发送的阿斯顿发发生的发送的阿斯顿发顺发生的发送的阿斯顿发顺发生的发送的阿斯顿发顺顺丰的到拉大锯大家",
                         @"大垃圾袋拉大锯阿大家啦大家按了三等奖达拉接收到拉大锯大家啦时间段,大垃圾袋拉大锯阿大家啦大家按了三等奖达拉发生的发送的阿斯顿发顺发生的发送的阿斯顿发顺接收到拉大锯大家"];
        for (NSString *str in tem) {
            lwmodel *model = [lwmodel new];
            model.desc = str;
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}
@end
