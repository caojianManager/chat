//
//  ChatDBOneChatTable.m
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import "ChatDBOneChatTable.h"

@interface ChatDBOneChatTable()
@end

@implementation ChatDBOneChatTable
- (NSString *)tableName {
    return @"chat";
}

- (void)createOrUpdateTableIfNeeded {
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if (![db tableExists:@"chat"]) {
            [db executeUpdate:@"CREATE TABLE chat (chatid integer primary key autoincrement, userid integer, time text, isread integer,  status integer, data text, lastid long long integer)"];
        }
        else {
         
        }
    

    }];
}

- (BOOL)insertRecord:(ChatDBOneChatRecord *)record {
    __block NSInteger chatId = 0;
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        //去重处理
        if (record.lastId > 0) {
            NSString *hasLastIdSQL = [NSString stringWithFormat:@"select count(*) from chat where lastid = %lld", record.lastId];
            if([db intForQuery:hasLastIdSQL] > 0) {
                return;
            }
        }

        result = [db executeUpdate:@"INSERT INTO chat (userid, time, isread, status, data, lastid) VALUES (?, ?, ?, ?, ?, ?)", record.userId, @(record.time), @(record.isRead), @(record.status), record.data, @(record.lastId)];
        chatId = (NSInteger)[db lastInsertRowId];
    }];
    record.chatId = chatId;
    return result;
}

- (NSArray<ChatDBOneChatRecord *> *)recordWithPredicate:(ChatDBPredicate *)predicate {
    __block NSMutableArray *result = [[NSMutableArray alloc] init];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = nil;
        sql = [NSString stringWithFormat:@"select * from chat %@", predicate.sqlWhereString];
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            [result addObject:[[ChatDBOneChatRecord alloc] initWithDBResultSet:rs]];
        }
        [rs close];
    }];
    return result;
}
@end
