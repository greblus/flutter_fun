#import "NativeFiboPlugin.h"
#import <native_fibo/native_fibo-Swift.h>

@implementation NativeFiboPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeFiboPlugin registerWithRegistrar:registrar];
}
@end
