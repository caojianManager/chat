//
//  ChatDBRecordBase.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Mantle/Mantle.h>
#import "ChatDBRecordProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatDBRecordBase : MTLModel<MTLJSONSerializing ,ChatDBRecordProtocol>

@end

NS_ASSUME_NONNULL_END
