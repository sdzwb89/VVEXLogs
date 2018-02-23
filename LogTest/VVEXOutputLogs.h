//
//  VVEXOutputLogs.h
//  LogTest
//
//  Created by VVEX on 15/12/30.
//  Copyright © 2015年 VVEXmac. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    VVEXoutputLogTypeError,
    VVEXoutputLogTypeDefault,
    VVEXoutputLogTypeDesc
} VVEXoutputLogType;

#define VVEXFileANDLine [NSString stringWithFormat:@"/**************************/ \r\nFile:%s \r\nLind:%d \r\nMessage:",__FILE__,__LINE__]

#define VVEXoutPutErrorLogs(a)  [[VVEXOutputLogs shearLogManager]outputLogs:([VVEXFileANDLine stringByAppendingString:a]) type:VVEXoutputLogTypeError]
#define VVEXoutPutDefaultLogs(a)  [[VVEXOutputLogs shearLogManager]outputLogs:([VVEXFileANDLine stringByAppendingString:a]) type:VVEXoutputLogTypeDefault]
#define VVEXoutPutDescLogs(a)  [[VVEXOutputLogs shearLogManager]outputLogs:([VVEXFileANDLine stringByAppendingString:a]) type:VVEXoutputLogTypeDesc]


@interface VVEXOutputLogs : NSObject

///  单例
///
///  @return 返回单例
+(instancetype)shearLogManager;


///  输出日志
///
///  @param logs 日志内容
///  @param type 日志类型
-(void)outputLogs:(NSString *)logs type:(VVEXoutputLogType)type;

///  删除所有的日志
-(void)deleteAllLogs;

///  删除错误日志
-(void)deleteErrorLogs;

///  删除默认日志
-(void)deleteDefaultLogs;

///  删除描述日志
-(void)deleteDescLogs;

@end
