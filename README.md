# VVEXLogs
ios 日志输出

一个简单的日志输出工具类
把需要的日志输出到在Document下一个txt文件中，路径可以根据实际需要自行修改  #define VVEXFileDictionary

日志可以分为3中类型
VVEXoutputLogTypeError    错误日志
VVEXoutputLogTypeDefault  默认输出
VVEXoutputLogTypeDesc     详细输出

提供了一个单例 shearLogManager 
一个实例的输出方法outputLogs:(NSString *)logs type:(VVEXoutputLogType)type

提供三个 宏  VVEXoutPutErrorLogs(a)  VVEXoutPutDefaultLogs(a)  VVEXoutPutDescLogs(a)

四个删除日志的方法
删除所有的日志       -(void)deleteAllLogs;
删除错误日志         -(void)deleteErrorLogs;
删除默认日志         -(void)deleteDefaultLogs;
删除描述日志         -(void)deleteDescLogs;
