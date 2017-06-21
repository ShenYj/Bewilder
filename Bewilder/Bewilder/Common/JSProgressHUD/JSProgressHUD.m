//
//  JSProgressHUD.m
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/26.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import "JSProgressHUD.h"
#import "JSLoadIngView.h"

static JSProgressHUD *_instanceType = nil;

@interface JSProgressHUD ()
// 自定义的加载视图
@property (nonatomic,strong) JSLoadIngView *loadIngView;


@end

@implementation JSProgressHUD

+ (instancetype)sharedProgressHUD
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceType = [[self alloc] init];
        _instanceType.frame = [UIScreen mainScreen].bounds;
    });
    return _instanceType;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpProgressView];
    }
    return self;
}

- (void)setUpProgressView
{
    // 自定义模式
    self.mode = MBProgressHUDModeCustomView;
    // 隐藏后不从当前父视图中移除
    self.removeFromSuperViewOnHide = NO;
    // 限制最小尺寸
    self.minSize = CGSizeMake(160,160);
    // 文字颜色
    self.contentColor = [UIColor blackColor];
    // 渐变
    self.animationType = MBProgressHUDAnimationFade;
    // 设置自定义视图
    self.customView = self.loadIngView;
    // 透明度为0(小于等于0.01),相当于hidden,无法响应触摸事件
    self.bezelView.color = [UIColor clearColor];
    
//    CATransform3D rotationTransform = CATransform3DMakeRotation((360*180.0)/(M_PI), 0, 0, -1);
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
//    animation.duration  =  1;
//    animation.autoreverses = NO;
//    animation.cumulative = YES;
//    animation.fillMode = kCAFillModeForwards;
//    animation.repeatCount = 100;
//    [self.loadIngView.layer addAnimation:animation forKey:nil];
//    self.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
}

- (void)js_showHUDTo:(UIView *)view animated:(BOOL)animated
{
    [view addSubview:_instanceType];
    [_instanceType showAnimated:YES];
}

- (void)setNoticeString:(NSString *)noticeString
{
    _noticeString = noticeString;
    self.loadIngView.contentLabel.text = noticeString;
    
}

#pragma mark
#pragma mark - lazy

- (JSLoadIngView *)loadIngView {
    if (!_loadIngView) {
        _loadIngView = [[JSLoadIngView alloc] init];
    }
    return _loadIngView;
}

- (void)setUpProgressHUD1
{
    /*
     要将一个MBProgressHUD显示出来，1，创建对象；2，将HUD添加到view上；3，调用show方法
     隐藏，1，hide:方法；  2，hide: afterDelay: 方法
     其它的用法都是特殊的设置等
     */
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] init];
//    [self.view addSubview:HUD];
    //    HUD.mode = MBProgressHUDModeIndeterminate;//菊花，默认值
    //    HUD.mode = MBProgressHUDModeDeterminate;//圆饼，饼状图
    //    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;//进度条
    HUD.mode = MBProgressHUDModeAnnularDeterminate;//圆环作为进度条
    //    HUD.mode = MBProgressHUDModeCustomView; //需要设置自定义视图时候设置成这个
    //    HUD.mode = MBProgressHUDModeText; //只显示文本
    
    //1,设置背景框的透明度  默认0.8
    HUD.opacity = 1;
    //2,设置背景框的背景颜色和透明度， 设置背景颜色之后opacity属性的设置将会失效
    HUD.color = [UIColor redColor];
    HUD.color = [HUD.color colorWithAlphaComponent:1];
    //3,设置背景框的圆角值，默认是10
    HUD.cornerRadius = 20.0;
    //4,设置提示信息 信息颜色，字体
    HUD.labelColor = [UIColor blueColor];
    HUD.labelFont = [UIFont systemFontOfSize:13];
    HUD.labelText = @"Loading...";
    //5,设置提示信息详情 详情颜色，字体
    HUD.detailsLabelColor = [UIColor blueColor];
    HUD.detailsLabelFont = [UIFont systemFontOfSize:13];
    HUD.detailsLabelText = @"LoadingLoading...";
    //6，设置菊花颜色  只能设置菊花的颜色
    HUD.activityIndicatorColor = [UIColor blackColor];
    //7,设置一个渐变层
    HUD.dimBackground = YES;
    //8,设置动画的模式
    //    HUD.mode = MBProgressHUDModeIndeterminate;
    //9，设置提示框的相对于父视图中心点的便宜，正值 向右下偏移，负值左上
    HUD.xOffset = -80;
    HUD.yOffset = -100;
    //10，设置各个元素距离矩形边框的距离
    HUD.margin = 0;
    //11，背景框的最小大小
    HUD.minSize = CGSizeMake(50, 50);
    //12设置背景框的实际大小   readonly
    CGSize size = HUD.size;
    //13,是否强制背景框宽高相等
    HUD.square = YES;
    //14,设置显示和隐藏动画类型  有三种动画效果，如下
    //    HUD.animationType = MBProgressHUDAnimationFade; //默认类型的，渐变
    //    HUD.animationType = MBProgressHUDAnimationZoomOut; //HUD的整个view后退 然后逐渐的后退
    HUD.animationType = MBProgressHUDAnimationZoomIn; //和上一个相反，前近，最后淡化消失
    //15,设置最短显示时间，为了避免显示后立刻被隐藏   默认是0
    //    HUD.minShowTime = 10;
    //16,
    /*
     // 这个属性设置了一个宽限期，它是在没有显示HUD窗口前被调用方法可能运行的时间。
     // 如果被调用方法在宽限期内执行完，则HUD不会被显示。
     // 这主要是为了避免在执行很短的任务时，去显示一个HUD窗口。
     // 默认值是0。只有当任务状态是已知时，才支持宽限期。具体我们看实现代码。
     @property (assign) float graceTime;
     
     // 这是一个标识位，标明执行的操作正在处理中。这个属性是配合graceTime使用的。
     // 如果没有设置graceTime，则这个标识是没有太大意义的。在使用showWhileExecuting:onTarget:withObject:animated:方法时，
     // 会自动去设置这个属性为YES，其它情况下都需要我们自己手动设置。
     @property (assign) BOOL taskInProgress;
     */
    //17,设置隐藏的时候是否从父视图中移除，默认是NO
    HUD.removeFromSuperViewOnHide = NO;
    //18,进度指示器  模式是0，取值从0.0————1.0
    //    HUD.progress = 0.5;
    //19,隐藏时候的回调 隐藏动画结束之后
    HUD.completionBlock = ^(){
        NSLog(@"abnnfsfsf");
    };
    //设置任务，在hud上显示任务的进度
    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
    
//    [HUD show:YES];
    
    //两种隐藏的方法
//    [HUD hide:YES];
    [HUD hide:YES afterDelay:5];

}

@end
