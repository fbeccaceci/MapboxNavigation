#ifdef RCT_NEW_ARCH_ENABLED
#import "MapboxNavigationView.h"

#import "../generated/RNMapboxNavigationViewSpec/ComponentDescriptors.h"
#import "../generated/RNMapboxNavigationViewSpec/EventEmitters.h"
#import "../generated/RNMapboxNavigationViewSpec/Props.h"
#import "../generated/RNMapboxNavigationViewSpec/RCTComponentViewHelpers.h"

#import "MapboxNavigation-Swift-Cxx-Umbrella.hpp"

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface MapboxNavigationView () <RCTMapboxNavigationViewViewProtocol, MapboxNavigationViewContentDelegate>

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
    _view.delegate = self;
    
    self.contentView = _view;
  }
  
  return self;
}

- (std::shared_ptr<const MapboxNavigationViewEventEmitter>)getEventEmitter
{
  if (!self->_eventEmitter) {
    return nullptr;
  }
  
  assert(std::dynamic_pointer_cast<MapboxNavigationViewEventEmitter const>(self->_eventEmitter));
  return std::static_pointer_cast<MapboxNavigationViewEventEmitter const>(self->_eventEmitter);
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(props);
    
  if (oldProps == nullptr) {
    NSNumber *nsNitroId = [NSNumber numberWithDouble:newViewProps.nitroId];
    [self setNitroId:nsNitroId ];
  }
  
  if (oldViewProps.styleUrl != newViewProps.styleUrl) {
    NSString *nsString = [NSString stringWithUTF8String:newViewProps.styleUrl.c_str()];
    [self->_view setStyleUrl: nsString];
  }
  
  if (oldViewProps.puckType != newViewProps.puckType) {
    NSString *nsString = [NSString stringWithUTF8String:newViewProps.puckType.c_str()];
    [self->_view setPuckType: nsString];
  }
  
  UIEdgeInsets oldViewportPadding = UIEdgeInsetsMake(oldViewProps.viewportPadding.top,
                                                     oldViewProps.viewportPadding.left,
                                                     oldViewProps.viewportPadding.bottom,
                                                     oldViewProps.viewportPadding.right);
  
  UIEdgeInsets newViewportPadding = UIEdgeInsetsMake(newViewProps.viewportPadding.top,
                                                   newViewProps.viewportPadding.left,
                                                   newViewProps.viewportPadding.bottom,
                                                  newViewProps.viewportPadding.right);
  if (!UIEdgeInsetsEqualToEdgeInsets(newViewportPadding, oldViewportPadding)) {
    [self->_view setViewportPadding: newViewportPadding];
  }
  
  
  CGPoint oldLogoMargin = CGPointMake(oldViewProps.logoMargin.x, oldViewProps.logoMargin.y);
  CGPoint newLogoMargin = CGPointMake(newViewProps.logoMargin.y, newViewProps.logoMargin.y);
  if (!CGPointEqualToPoint(oldLogoMargin, newLogoMargin)) {
    [self->_view setLogoMargin: newLogoMargin];
  }
  
  [super updateProps:props oldProps:oldProps];
}

// Override `nitroId` setter to throw `self` into global map
- (void)setNitroId:(NSNumber*)nitroId {
  [self->_view setNitroId: nitroId];
}

Class<RCTComponentViewProtocol> MapboxNavigationViewCls(void)
{
  return MapboxNavigationView.class;
}

- (void)mapboxNavigationViewContent:(MapboxNavigationViewContent * _Nonnull)mapboxNavigationView didUpdateNavigationCameraState:(NSString * _Nonnull)navigationCameraState {
  const auto eventEmitter = [self getEventEmitter];
  if (eventEmitter) {
    eventEmitter->onNavigationCameraStateChange(MapboxNavigationViewEventEmitter::OnNavigationCameraStateChange{
      .payload = [navigationCameraState cStringUsingEncoding:NSUTF8StringEncoding]
    });
  }
}


@end
#endif
