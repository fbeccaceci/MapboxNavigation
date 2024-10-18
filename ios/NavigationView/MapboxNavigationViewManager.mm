#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "Utils.h"

@interface MapboxNavigationViewManager : RCTViewManager
@end

@implementation MapboxNavigationViewManager

RCT_EXPORT_MODULE(MapboxNavigationView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

@end
