//
//  HostConfig.h
//  dada
//
//  Created by dow-np-162 on 2018/8/8.
//  Copyright © 2018年 dow. All rights reserved.
//

#ifndef HostConfig_h
#define HostConfig_h

/// api服务配置
#define API_PROPERTY @{\
    @"正式服务器": @"https://api.aaa.com",\
    @"开发服务器": @"http://192.168.4.70:2222",\
    @"测试服务器": @"http://api.test.cn",\
    @"***服务器": @"http://192.168.6.71"\
}

/// 图片服务配置
#define IMAGE_PROPERTY @{\
    @"正式服务器": @"https://img.aaa.com",\
    @"开发服务器": @"http://192.168.4.70:2222",\
    @"测试服务器": @"http://api.test.cn",\
    @"***服务器": @"http://192.168.6.71"\
}

/// 网页服务配置
#define WEB_PROPERTY @{\
    @"正式服务器": @"https://web.aaa.com",\
    @"开发服务器": @"http://192.168.4.70:2222",\
    @"测试服务器": @"http://api.test.cn",\
    @"***服务器": @"http://192.168.6.71"\
}

#define SELECT_HOST @"SELECT_HOST"

/** 非正式环境 **/
#if DEBUG

#define HOST_SERVER [[NSUserDefaults standardUserDefaults] valueForKey:SELECT_HOST]
#define DEFAULT_SERVER_HOST (HOST_SERVER ? HOST_SERVER : @"测试服务器")

/**  正式环境  **/
#else

#define DEFAULT_SERVER_HOST @"正式服务器"

#endif


#endif /* HostConfig_h */
