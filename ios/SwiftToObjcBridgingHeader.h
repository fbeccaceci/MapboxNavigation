//
//  SwiftToObjcBridgingHeader.h
//  Pods
//
//  Created by Fabrizio Beccaceci on 17/10/24.
//

#ifndef SwiftToObjcBridgingHeader_h
#define SwiftToObjcBridgingHeader_h

// This is required because inside MapboxNavigation-Swift.h the nitrmodules HybridContext is used but not imported correctly
// manual import is needed until a fix comes
#import <NitroModules/HybridContext.hpp>
#import <NitroModules/PromiseHolder.hpp>
#import "MapboxNavigation-Swift-Cxx-Bridge.hpp"

#import <MapboxNavigation-Swift.h>

#endif /* SwiftToObjcBridgingHeader_h */