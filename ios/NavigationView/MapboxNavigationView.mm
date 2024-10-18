#ifdef RCT_NEW_ARCH_ENABLED
#import "MapboxNavigationView.h"

#import "../generated/RNMapboxNavigationViewSpec/ComponentDescriptors.h"
#import "../generated/RNMapboxNavigationViewSpec/EventEmitters.h"
#import "../generated/RNMapboxNavigationViewSpec/Props.h"
#import "../generated/RNMapboxNavigationViewSpec/RCTComponentViewHelpers.h"


#import "SwiftToObjcBridgingHeader.h"

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface MapboxNavigationView () <RCTMapboxNavigationViewViewProtocol>

@end

@implementation MapboxNavigationView {
  MapboxNavigationViewContent * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<MapboxNavigationViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const MapboxNavigationViewProps>();
    _props = defaultProps;
    
    NSLog(@"Running on: %@", [NSThread isMainThread] ? @"Main Thread" : @"Background Thread");

    _view = [[MapboxNavigationViewContent alloc] init];
    
    self.contentView = _view;
  }
  
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(props);
    
  if (oldProps == nullptr) {
    NSNumber *nsNitroId = [NSNumber numberWithDouble:newViewProps.nitroId];
    [self setNitroId:nsNitroId ];
  }
  
  [super updateProps:props oldProps:oldProps];
}

// Override `nitroId` setter to throw `self` into global map
- (void)setNitroId:(NSNumber*)nitroId {
  NSLog(@"adding view to map");
  [MapboxNavigationContentRegistry.globalViewsMap setObject:_view forKey:nitroId];
}

Class<RCTComponentViewProtocol> MapboxNavigationViewCls(void)
{
  return MapboxNavigationView.class;
}

@end
#endif
