//
// Created by Yohom Bao on 2019/11/22.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CLLocationHandler(NSString* method, id rawArgs, FlutterResult methodResult){    
    // CLLocation获取coordinate
    if ([@"CLLocation::get_coordinate" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            CLLocationCoordinate2D data = location.coordinate;
            
            NSValue *dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
            HEAP[@(dataValue.hash)] = dataValue;
            
            methodResult(@(dataValue.hash));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取altitude
    else if ([@"CLLocation::get_altitude" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            methodResult(@(location.altitude));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取horizontalAccuracy
    else if ([@"CLLocation::get_horizontalAccuracy" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            methodResult(@(location.horizontalAccuracy));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取verticalAccuracy
    else if ([@"CLLocation::get_verticalAccuracy" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            methodResult(@(location.verticalAccuracy));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取course
    else if ([@"CLLocation::get_course" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            methodResult(@(location.course));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取speed
    else if ([@"CLLocation::get_speed" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            methodResult(@(location.speed));
        } else {
            methodResult(nil);
        }
    }
    // CLLocation获取floor
    else if ([@"CLLocation::get_floor" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocation *location = (CLLocation *) HEAP[refId];
        
        if (location != nil) {
            CLFloor *floor = location.floor;
            
            HEAP[@(floor.hash)] = floor;
            
            methodResult(@(floor.hash));
        } else {
            methodResult(nil);
        }
        
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
