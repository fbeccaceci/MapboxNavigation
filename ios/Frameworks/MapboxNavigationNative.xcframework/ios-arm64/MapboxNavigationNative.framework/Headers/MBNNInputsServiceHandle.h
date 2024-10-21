// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBNNAltimeterData;
@class MBNNCompassData;
@class MBNNConfigHandle;
@class MBNNETCGateInfo;
@class MBNNHistoryRecorderHandle;
@class MBNNMotionData;
@class MBNNOdometryData;
@class MBNNRawGnssData;
@class MBNNSpeedData;

/** Inputs service interface */
NS_SWIFT_NAME(InputsServiceHandle)
__attribute__((visibility ("default")))
@interface MBNNInputsServiceHandle : NSObject

/**
 * Constructs InputsService object with given dependencies
 *
 * @param config           config handle created with `ConfigFactory`
 * @param historyRecorder  history recorder created with `HistoryRecorderHandle.build` method
 */
+ (nonnull MBNNInputsServiceHandle *)buildForConfig:(nonnull MBNNConfigHandle *)config
                                    historyRecorder:(nullable MBNNHistoryRecorderHandle *)historyRecorder __attribute((ns_returns_retained));
/** Data update */
- (void)updateOdometryDataForData:(nonnull MBNNOdometryData *)data;
- (void)updateRawGnssDataForData:(nonnull MBNNRawGnssData *)data;
- (void)updateCompassDataForData:(nonnull MBNNCompassData *)data;
- (void)updateMotionDataForData:(nonnull MBNNMotionData *)data;
- (void)updateAltimeterDataForData:(nonnull MBNNAltimeterData *)data;
- (void)updateEtcGateInfoForInfo:(nonnull MBNNETCGateInfo *)info;
- (void)updateSpeedDataForData:(nonnull MBNNSpeedData *)data;

@end
