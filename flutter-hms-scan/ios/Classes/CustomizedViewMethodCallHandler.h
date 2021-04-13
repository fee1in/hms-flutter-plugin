//
// Created by 林辉 on 2021/4/12.
//

#import <Flutter/Flutter.h>


@interface CustomizedViewMethodCallHandler : NSObject<FlutterPlugin>
@property (strong, nonatomic) FlutterMethodChannel *channel;
@end
