//
//  ViewController.m
//  SHRuntimeDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "ViewController.h"
#import "Man.h"
#import "Woman.h"
#import "Man+AddProperty.h"
#import <objc/message.h>
@interface ViewController ()

@property (nonatomic,assign)int param;
@property (nonatomic,copy) NSMutableArray *paramArr;
@end

@implementation ViewController
- (IBAction)changeMethod:(id)sender {
    Woman *woman = [[Woman alloc]init];
    //多用女人工作的方法
    [woman womanWork];
}
//动态添加方法
- (IBAction)addMethod:(id)sender {
    Man *man = [[Man alloc]init];
    //动态 添加swimming这个方法  
    [man performSelector:@selector(swimming)];
    
    [man performSelector:@selector(swimming:) withObject:@"和队友"];
}
//动态添加属性
- (IBAction)addProperty:(id)sender {
    Man *man = [[Man alloc]init];
    man.name = @"好男人";
    NSLog(@"name:  %@",man.name);
}
//获取某个类的成员属性
- (IBAction)getIvars:(id)sender {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        //取出成员属性
        Ivar ivar = ivarList[i];
        //取出成员属性名
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)] ;
        //取出成员属性类型
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)] ;
        
        NSLog(@"%@   %@",propertyName,propertyType);
    }
}



@end
