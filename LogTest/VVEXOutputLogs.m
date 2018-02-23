//
//  VVEXOutputLogs.m
//  LogTest
//
//  Created by VVEX on 15/12/30.
//  Copyright © 2015年 VVEXmac. All rights reserved.
//

#import "VVEXOutputLogs.h"

#define VVEXFileDictionary NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

static NSString *dateStr;

@interface VVEXOutputLogs ()

@end

@implementation VVEXOutputLogs


///  创建日志管理的单例
///  @return 单例
+(instancetype)shearLogManager
{
    static VVEXOutputLogs *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSDate* date = [NSDate date];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        dateStr = [formatter stringFromDate:date];
        
        manager = [[self alloc] init];
    });
    return manager;
}
///  输出日志
///
///  @param logs 日志内容
///  @param type 日志类型
-(void)outputLogs:(NSString *)logs type:(VVEXoutputLogType)type
{
    
    NSString* path;
    switch (type) {
        case VVEXoutputLogTypeDefault:
             path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
            path = [path stringByAppendingPathComponent:@"Default"];
            break;
        case VVEXoutputLogTypeDesc:
             path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
            path = [path stringByAppendingPathComponent:@"Desc"];
            break;
            
        case VVEXoutputLogTypeError:
             path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
            path = [path stringByAppendingPathComponent:@"Error"];
            break;
        default:
            break;
    }

     BOOL result = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];

    if (result) {
        NSString* filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"Log_%@.txt", dateStr]];
        logs = [logs stringByAppendingString:@"\r\n"];
        NSMutableData* strData = [logs dataUsingEncoding:NSUTF8StringEncoding].mutableCopy;
        uint8_t* sdata = [strData mutableBytes];
        NSOutputStream *outStream = [NSOutputStream outputStreamToFileAtPath:filePath append:YES];
        [outStream open];
        [outStream write:sdata maxLength:strData.length];
        [outStream close];
        outStream = nil;
    }
    else
    {
        
    }
}



#pragma make -删除日志

///  删除所有的日志
-(void)deleteAllLogs
{
//    [self deleteErrorLogs];
//    [self deleteDescLogs];
//    [self deleteDefaultLogs];
    NSError *error = nil;
    ///  删除文件夹
if([[NSFileManager defaultManager] removeItemAtPath:[VVEXFileDictionary stringByAppendingPathComponent:@"Logs"] error:&error] != YES){
    NSLog(@"错误----%@",error);
}
  
}

///  删除错误日志
-(void)deleteErrorLogs
{
    NSError *error = nil;
    NSString *path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
    path = [path stringByAppendingPathComponent:@"Error"];
    if([[NSFileManager defaultManager] removeItemAtPath:path error:&error] != YES){
        NSLog(@"错误----%@",error);
    }
}

///  删除默认日志
-(void)deleteDefaultLogs
{
    NSError *error = nil;
    NSString *path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
    path = [path stringByAppendingPathComponent:@"Default"];
    if([[NSFileManager defaultManager] removeItemAtPath:path error:&error] != YES){
        NSLog(@"错误----%@",error);
    }
}

///  删除描述日志
-(void)deleteDescLogs
{
    NSError *error = nil;
    NSString *path = [VVEXFileDictionary stringByAppendingPathComponent:@"Logs"];
    path = [path stringByAppendingPathComponent:@"Desc"];
    if([[NSFileManager defaultManager] removeItemAtPath:path error:&error] != YES){
        NSLog(@"错误----%@",error);
    }
}


/////  创建文件
/////
/////  @return 是否成功
//- (BOOL)creatLogsFile
//{
//    NSFileManager* fileManager = [NSFileManager defaultManager];
//    NSString* documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSString* path = [documentsDirectory stringByAppendingPathComponent:@"Logs"];
//
//    BOOL result = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//    if (result) {
//        NSString* filePath = [path stringByAppendingPathComponent:@"logs.txt"];
//        BOOL resultFile = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
//        return resultFile;
//    }
//    else {
//        return result;
//    }
//}

@end
