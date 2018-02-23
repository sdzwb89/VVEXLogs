//
//  ViewController.m
//  LogTest
//
//  Created by zhangbin on 15/12/29.
//  Copyright © 2015年 zhangbin. All rights reserved.
//

#import "ViewController.h"
#import "VVEXOutputLogs.h"

#define debugLog(...) NSLog(@"%@,------%s------%d",__VA_ARGS__,[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__)

//#define NSLog(FORMAT, ...) {\
//NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];\
//[dateFormatter setDateStyle:NSDateFormatterMediumStyle];\
//[dateFormatter setTimeStyle:NSDateFormatterShortStyle];\
//[dateFormatter setDateFormat:@"HH:mm:ss:SSSSSS"]; \
//NSString *str = [dateFormatter stringFromDate:[NSDate date]];\
//[dateFormatter release];\
//fprintf(stderr,"[--%s--]*[--%s--]*[--%s:%d--]\n",[str UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String],[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__);\
//}


@interface ViewController ()

@property (nonatomic, strong) NSOutputStream* oStream;
@property (nonatomic, copy) NSString* filePath;
@property(nonatomic,copy) NSString *dateStr;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    NSDate* date = [NSDate date];
    //    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //    formatter.dateFormat = @"yyyyMMddHHmmss";
    //    self.dateStr = [formatter stringFromDate:date];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    //    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:NSURLRequest];
    //    [[VVEXOutputLogs shearLogManager] outputLogs:@"错误信息" type:VVEXoutputLogTypeError];
    
//    VVEXoutPutErrorLogs(@"错误信息");
//    VVEXoutPutDescLogs(@"描述信息日志");
//    VVEXoutPutDefaultLogs(@"默认日志信息");

//    NSLog(FORMAT, @"这是打印");
//        NSLog(@"%s--%d",__FILE__,__LINE__);
//    NSLog(@"%s",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String]);
    debugLog(@"这是打印测试");
}


- (IBAction)deleteLogsClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1000:
            [[VVEXOutputLogs shearLogManager] deleteErrorLogs];
            break;
        case 1001:
            [[VVEXOutputLogs shearLogManager] deleteDescLogs];
            break;
        case 1002:
            [[VVEXOutputLogs shearLogManager] deleteDefaultLogs];
            break;
        default:
            [[VVEXOutputLogs shearLogManager] deleteAllLogs];
            break;
    }
}


///  创建文件
///
///  @return 是否成功
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
///  文件路径
///  @return 返回文件路径
//- (NSString*)filrPathwithDateStr:(NSString*)dateStr withType:(NSString *)typeStr
//{
//    NSString* documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSString* path = [documentsDirectory stringByAppendingPathComponent:@"Logs"];
//    NSString* filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@Log%@.txt", typeStr,dateStr]];
//    return filePath;
//}

///  输出日志
///
///  @param strLog 日志内容
//- (void)writeLogs:(NSString*)strLog withType:(outputLogType )type
//{
//
//    switch (type) {
//        case outputLogTypeDefault:
//               self.filePath = [self filrPathwithDateStr:self.dateStr withType:@"Default"];
//            break;
//
//        case outputLogTypeError:
//             self.filePath = [self filrPathwithDateStr:self.dateStr withType:@"Error"];
//            break;
//
//        case outputLogTypeDesc:
//             self.filePath = [self filrPathwithDateStr:self.dateStr withType:@"Desc"];
//            break;
//        default:
//            break;
//    }
//
//    strLog = [strLog stringByAppendingString:@"\r\n"];
//
//    NSMutableData* strData = [strLog dataUsingEncoding:NSUTF8StringEncoding].mutableCopy;
//    uint8_t* sdata = [strData mutableBytes];
//    self.oStream = [NSOutputStream outputStreamToFileAtPath:self.filePath append:YES];
//    [self.oStream open];
//    [self.oStream write:sdata maxLength:strData.length];
//    [self.oStream close];
//    self.oStream = nil;
//}

@end
