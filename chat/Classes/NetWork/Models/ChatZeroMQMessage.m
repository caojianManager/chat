//
//  ChatZeroMQMessage.m
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import "ChatZeroMQMessage.h"

@implementation ChatZeroMQMessage
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"msgId"      : @"msgid",
              @"msgType"    : @"msgtype",
              @"sourceId"   : @"sourceid",
              @"targetId"   : @"targetid",
              @"timeStamp"  : @"timestamp",
              @"lastId"     : @"lastid",
              @"referIds"   : @"referids",
              @"skinId"     : @"skinid",
              @"chatId"     : @"chatid"};
}

@end
