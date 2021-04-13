//
// Created by 林辉 on 2021/4/12.
//

#import "CustomizedViewMethodCallHandler.h"
#import <ScanKitFrameWork/ScanKitFrameWork.h>

@interface  CustomizedViewMethodCallHandler()<DefaultScanDelegate>
@property(copy, nonatomic) FlutterResult result;
@end

@implementation CustomizedViewMethodCallHandler


- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"customizedView" isEqualToString:call.method]) {
     [self customizedView:call result:result];
      self.result = result;
  } else {
    result(FlutterMethodNotImplemented);
  }
}

-(void) customizedView:(FlutterMethodCall*)call result:(FlutterResult)result{
    FlutterAppDelegate* delegate = (FlutterAppDelegate*)[[UIApplication sharedApplication]delegate];
    FlutterViewController* rootVC = (FlutterViewController*)delegate.window.rootViewController;
    
    HmsScanOptions *options = [[HmsScanOptions alloc] initWithScanFormatType:ALL Photo:FALSE];
    HmsDefaultScanViewController *hmsDefaultScanViewController = [[HmsDefaultScanViewController alloc]initDefaultScanWithFormatType:options];
    hmsDefaultScanViewController.defaultScanDelegate = self;
    [rootVC.view addSubview:hmsDefaultScanViewController.view];
    [rootVC addChildViewController:hmsDefaultScanViewController];
    [rootVC didMoveToParentViewController:hmsDefaultScanViewController];
    rootVC.navigationController.navigationBarHidden = YES;

}

//DefaultScan Delegate
- (void)defaultScanDelegateForDicResult:(NSDictionary *)resultDic{
//    [self toastResult:resultDic];
   self. result(nil);
    if(self.channel!= nil){
        [self.channel invokeMethod:@"CustomizedViewResponse" arguments:resultDic];
    }
}

- (void)defaultScanImagePickerDelegateForImage:(UIImage *)image{
    NSDictionary *dic = [HmsBitMap bitMapForImage:image withOptions:[[HmsScanOptions alloc] initWithScanFormatType:ALL Photo:true]];
//    [self toastResult:dic];
    self. result(nil);
    if(self.channel!=nil){
        [self.channel invokeMethod:@"CustomizedViewResponse" arguments:dic];
    }
}

@end
