#import "ScanPlugin.h"
#import "CustomizedViewMethodCallHandler.h"

@implementation ScanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* customizedViewChannel = [FlutterMethodChannel
      methodChannelWithName:@"customizedViewChannel"
            binaryMessenger:[registrar messenger]];
  CustomizedViewMethodCallHandler* customizedViewInstance = [[CustomizedViewMethodCallHandler alloc] init];
    customizedViewInstance.channel = customizedViewChannel;
  [registrar addMethodCallDelegate:customizedViewInstance channel:customizedViewChannel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
//  if ([@"getPlatformVersion" isEqualToString:call.method]) {
//    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//  } else {
//    result(FlutterMethodNotImplemented);
//  }
}

@end
