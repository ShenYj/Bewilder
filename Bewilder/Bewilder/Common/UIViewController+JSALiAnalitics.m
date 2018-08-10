//
//  UIViewController+JSALiAnalitics.m
//  Bewilder
//
//  Created by ecg on 2018/8/10.
//  Copyright © 2018年 ShenYj. All rights reserved.
//

#import "UIViewController+JSALiAnalitics.h"

@implementation UIViewController (JSALiAnalitics)


+ (void)load {
    NSString *className = NSStringFromClass(self.class);
    NSLog(@"%@", className);
    [self replaceOrExchangeMethodOriginSelector:@selector(viewDidAppear:) SwizzledSelector:@selector(my_viewDidAppear:)];
    [self replaceOrExchangeMethodOriginSelector:@selector(viewDidDisappear:) SwizzledSelector:@selector(my_viewDidDisappear:)];
}

- (void)my_viewDidAppear:(BOOL)animated {
    NSString *className = NSStringFromClass(self.class);
    [MobClick beginLogPageView:className];
    [self my_viewDidAppear:animated];
}

- (void)my_viewDidDisappear:(BOOL)animated {
    NSString *className = NSStringFromClass(self.class);
    [MobClick endLogPageView:className];
    [self my_viewDidDisappear:animated];
}

+ (void)replaceOrExchangeMethodOriginSelector:(SEL)originSelector
                             SwizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class,originSelector);
    Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) { class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
