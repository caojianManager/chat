//
//  ChatDBUserTable.m
//  chat
//
//  Created by jian cao on 2021/4/25.
//

#import "ChatDBUserTable.h"

@interface ChatDBUserTable()

@end

@implementation ChatDBUserTable
- (NSString *)tableName {
    return @"muser";
}

- (void)createOrUpdateTableIfNeeded {

    [self.dbQueue inDatabase:^(FMDatabase *db) {
        if (![db tableExists:@"muser"]) {
            [db executeUpdate:@"CREATE TABLE muser (userid integer primary key, username text, college text, collegenum integer, ownclass text,  identitycard integer, atcampus text, grade integer,majorname text,isrealchat integer)"];
  
        }
        else {
       
        }
    }];
}

- (BOOL)insertRecord:(ChatDBUserRecord *)record {
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"REPLACE INTO muser (userid, username, college, collegenum, ownclass, identitycard, atcampus, grade,majorname,isrealchat) VALUES (%@, '%@', '%@', '%@', '%@', '%@', '%@', '%@','%@','%@')", record.userId, record.userName, record.college,record.collegeNum,record.ownClass,record.identityCard,record.atCampus,record.grade,record.majorName,record.isRealChat];
        NSLog(@"SQL: %@", sql);
        result = [db executeUpdate:sql];
    }];
    return result;
}

- (NSArray<ChatDBUserRecord *> *)recordWithPredicate:(ChatDBPredicate *)predicate {
    __block NSMutableArray *result = [[NSMutableArray alloc] init];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = nil;
        sql = [NSString stringWithFormat:@"select * from muser %@", predicate.sqlWhereString];
        NSLog(@"SQL: %@", sql);
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            [result addObject:[[ChatDBUserRecord alloc] initWithDBResultSet:rs]];
        }
        [rs close];
    }];
    return result;
}
@end
