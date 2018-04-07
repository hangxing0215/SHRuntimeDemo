//
//  Man.m
//  SHRuntimeDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "Man.h"
#import <objc/message.h>
@implementation Man
//为方法交换写的方法
- (void)work
{
    NSLog(@"妹子累了  你来给干活");
}


//用这个方法来解决动态加载方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    
    //ViewController中调用swimming方法时会来到这里
    
    
    //第一个参数：给哪个对象添加方法
    //第二个参数：传进来的方法选择器
    //第三个参数：要执行的方法实现
    //第四个参数：类型：v void    @ object  : SEL
    
    //传进来的方法无参数
    if (sel == @selector(swimming)) {
        class_addMethod(self, sel, (IMP)functionName, "v@:");
        
    }
    
    //传进来的方法有参数
    if (sel == @selector(swimming:)) {
        class_addMethod(self, sel, (IMP)functionName, "v@:@");
    }
    
    return [super resolveInstanceMethod:sel];
    
}
//动态调用这个方法  系统默认添加这两个参数
void functionName(id self,SEL _cmd)
{
    NSLog(@"动态添加的方法  没有传入参数的");
}

void functionNameWithParam(id self,SEL _cmd,id param)
{
    NSLog(@"动态添加方法 有参数的  %@",param);
}


@end
