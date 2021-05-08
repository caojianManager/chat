//
//  ChatDBOneChatRecord.m
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import "ChatDBOneChatRecord.h"

@implementation ChatDBOneChatRecord
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"chatId"      : OneChatColumnChatId,
             @"userId"      : OneChatColumnUserId,
             @"isRead"      : OneChatColumnIsRead,
             @"lastId"      : OneChatColumnLastId,
             @"time":OneChatColumnTime,
             @"status":OneChatColumnStatus,
             @"data":OneChatColumnData

             };
}



- (NSString *)dataString {
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self.data options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}
@end
