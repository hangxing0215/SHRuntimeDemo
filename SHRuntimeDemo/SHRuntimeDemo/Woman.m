//
//  Woman.m
//  SHRuntimeDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "Woman.h"
#import "Man.h"
#import <objc/message.h>
@implementation Woman
- (void)womanWork
{
    NSLog(@"女人在干活");
}

//在load方法中进行方法交换
+ (void)load
{
    //获取要调用的方法
   Method method1 = class_getInstanceMethod(self, @selector(womanWork));
    //获取要换的方法
    //获取Man类中的work方法
   Method method2 = class_getInstanceMethod([Man class], @selector(work));
    //交换
    method_exchangeImplementations(method1, method2);
}
@end
