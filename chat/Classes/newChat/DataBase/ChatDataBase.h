//
//  ChatDataBase.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>
#import "ChatDBPredicate.h"
#import "ChatDBEntity.h"
#import "ChatDBUserTable.h"
#import "ChatDBOneChatTable.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatDataBase : NSObject

@property (nonatomic, strong, readonly) ChatDBUserTable *userTable;
@property (nonatomic, strong, readonly) ChatDBOneChatTable *oneChatTable;


//类方法
+ (ChatDataBase *) getInstance;

- (NSString *)currentUserChatFolderPath;

- (void)loadDB;
- (void)unloadDB;
@end

NS_ASSUME_NONNULL_END
