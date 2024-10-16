#ifdef RCT_NEW_ARCH_ENABLED
#import "MapboxNavigationView.h"

#import "generated/RNMapboxNavigationViewSpec/ComponentDescriptors.h"
#import "generated/RNMapboxNavigationViewSpec/EventEmitters.h"
#import "generated/RNMapboxNavigationViewSpec/Props.h"
#import "generated/RNMapboxNavigationViewSpec/RCTComponentViewHelpers.h"

#import <MapboxNavigation-Swift.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

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

    _view = [[MapboxNavigationViewContent alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<MapboxNavigationViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> MapboxNavigationViewCls(void)
{
    return MapboxNavigationView.class;
}

@end
#endif
