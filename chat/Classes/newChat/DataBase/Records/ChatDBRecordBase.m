//
//  ChatDBRecordBase.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDBRecordBase.h"

@implementation ChatDBRecordBase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

- (instancetype)initWithDBResultSet:(FMResultSet *)resultSet {
    self = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:[resultSet resultDictionary] error:nil];
    return self;
}
@end
