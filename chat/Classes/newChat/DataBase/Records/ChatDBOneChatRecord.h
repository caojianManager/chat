//
//  ChatDBOneChatRecord.h
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import <Foundation/Foundation.h>
#import "ChatDBRecordBase.h"

NS_ASSUME_NONNULL_BEGIN

//聊天id
static NSString *const OneChatColumnChatId = @"chatid";
//用户id
static NSString *const OneChatColumnUserId = @"userid";
//时间
static NSString *const OneChatColumnTime = @"time";
//是否已读
static NSString *const OneChatColumnIsRead = @"isread";

//状态 发false 还是接true
static NSString *const OneChatColumnStatus = @"status";
//数据
static NSString *const OneChatColumnData = @"data";

static NSString *const OneChatColumnLastId = @"lastid";


@interface ChatDBOneChatRecord : ChatDBRecordBase<ChatDBRecordProtocol>
@property (nonatomic, assign) NSInteger chatId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, assign) BOOL isRead;
@property (nonatomic, assign) BOOL status;
@property (nonatomic, copy) NSString *data;
@property (nonatomic, assign) long long lastId;


@end

NS_ASSUME_NONNULL_END
