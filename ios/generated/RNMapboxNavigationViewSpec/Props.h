
/**
 * This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
 *
 * Do not edit this file as changes may cause incorrect behavior and will be lost
 * once the code is regenerated.
 *
 * @generated by codegen project: GeneratePropsH.js
 */
#pragma once

#include <react/renderer/components/view/ViewProps.h>
#include <react/renderer/core/PropsParserContext.h>

namespace facebook::react {

class MapboxNavigationViewProps final : public ViewProps {
 public:
  MapboxNavigationViewProps() = default;
  MapboxNavigationViewProps(const PropsParserContext& context, const MapboxNavigationViewProps &sourceProps, const RawProps &rawProps);

#pragma mark - Props

  double nitroId{0.0};
  std::string styleUrl{};
  std::string puckType{};
};

} // namespace facebook::react
