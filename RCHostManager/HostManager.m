//
//  HostManager.m
//  dada
//
//  Created by dow-np-162 on 2018/8/8.
//  Copyright © 2018年 dow. All rights reserved.
//

#import "HostManager.h"

#import "HostConfig.h"

static HostManager * _manager = nil;

@interface HostManager()

@property (nonatomic, copy) NSString *apiServer;

@property (nonatomic, copy) NSString *imageServer;

@property (nonatomic, copy) NSString *webServer;

@end


@implementation HostManager

+ (void)changeToHost:(NSString *)hostName {
    [[HostManager shared] changeToHost:hostName];
}

- (void)changeToHost:(NSString *)hostName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:hostName forKey:SELECT_HOST];
    self.apiServer = [API_PROPERTY valueForKey:hostName];
    self.imageServer = [IMAGE_PROPERTY valueForKey:hostName];
    self.webServer = [WEB_PROPERTY valueForKey:hostName];
}

#pragma mark- class method
+ (NSString *)apiServer {
    return HostManager.shared.apiServer;
}

+ (NSString *)imageServer {
    return HostManager.shared.imageServer;
}

+ (NSString *)webServer {
    return HostManager.shared.webServer;
}

#pragma mark-  getter
+ (NSString *)selectedHostName {
    return DEFAULT_SERVER_HOST;
}

- (NSString *)apiServer {
    if (!_apiServer) {
        NSString *hostName = DEFAULT_SERVER_HOST;
        _apiServer = [API_PROPERTY valueForKey:hostName];
    }
    return _apiServer;
}

- (NSString *)imageServer {
    if (!_imageServer) {
        NSString *hostName = DEFAULT_SERVER_HOST;
        _imageServer = [IMAGE_PROPERTY valueForKey:hostName];
    }
    return _imageServer;
}

- (NSString *)webServer {
    if (!_webServer) {
        NSString *hostName = DEFAULT_SERVER_HOST;
        _webServer = [WEB_PROPERTY valueForKey:hostName];
    }
    return _webServer;
}

#pragma mark- 单例
+ (HostManager *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[super allocWithZone:NULL] init];
    });
    return _manager;
}

+(id)allocWithZone:(struct _NSZone *)zone {
    return [HostManager shared];
}

-(id)copyWithZone:(struct _NSZone *)zone {
    return [HostManager shared];
}

#pragma mark- 服务器配置
+ (NSArray *)hosts {
    return [API_PROPERTY allKeys];
}

@end
