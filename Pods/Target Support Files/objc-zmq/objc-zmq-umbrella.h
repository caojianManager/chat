#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "zmq.hpp"
#import "ZMQContext.h"
#import "ZMQException.h"
#import "ZMQObjC.h"
#import "ZMQSocket.h"
#import "zmq.h"
#import "zmq_utils.h"

FOUNDATION_EXPORT double objc_zmqVersionNumber;
FOUNDATION_EXPORT const unsigned char objc_zmqVersionString[];

