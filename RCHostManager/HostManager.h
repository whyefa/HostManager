//
//  HostManager.h
//  dada
//
//  Created by dow-np-162 on 2018/8/8.
//  Copyright © 2018年 dow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HostManager : NSObject

/// 接口服务BaseUrl
+ (NSString *)apiServer;

/// 图片服务BaseUrl
+ (NSString *)imageServer;

/// Web服务BaseUrl
+ (NSString *)webServer;

/// 单例
+ (HostManager *)shared;

+ (NSString *)selectedHostName;

/// 配置表中 所有可选服务器名称
+ (NSArray *)hosts;

/// 切换到 hostName 服务器 (并把名称保存到本地)
+ (void)changeToHost:(NSString *)hostName;

@end
