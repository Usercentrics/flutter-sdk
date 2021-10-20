#import "UsercentricsPlugin.h"
#if __has_include(<usercentrics_sdk/usercentrics_sdk-Swift.h>)
#import <usercentrics_sdk/usercentrics_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "usercentrics_sdk-Swift.h"
#endif

@implementation UsercentricsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUsercentricsPlugin registerWithRegistrar:registrar];
}
@end
