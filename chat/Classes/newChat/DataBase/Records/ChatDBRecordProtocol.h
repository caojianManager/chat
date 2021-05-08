//
//  ChatDBRecordProtocol.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ChatDBRecordProtocol <NSObject>
- (instancetype)initWithDBResultSet:(FMResultSet *)resultSet;
@end

NS_ASSUME_NONNULL_END
