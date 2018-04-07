//
//  Man+AddProperty.m
//  SHRuntimeDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "Man+AddProperty.h"
#import <objc/message.h>
@implementation Man (AddProperty)
//分类中添加属性，必须实现这两个方法
//第一个参数：给那个对象添加
- (void)setName:(NSString *)name
{
    //第一个参数：给那个对象添加
    //第二个参数：添加个什么属性
    //第三个参数：属性赋值
    //第四个参数：属性的类型
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY);
}
- (NSString *)name
{
   return objc_getAssociatedObject(self, @"name");
}
@end
