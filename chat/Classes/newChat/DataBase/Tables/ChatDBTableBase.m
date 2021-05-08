//
//  ChatDBTableBase.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDBTableBase.h"

@interface ChatDBTableBase()

@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end

@implementation ChatDBTableBase
- (instancetype)initWithDBQueue:(FMDatabaseQueue *)dbQueue {
    self = [super init];
    if (self) {
        self.dbQueue = dbQueue;
    }
    return self;
}

- (void)createOrUpdateTableIfNeeded {
}

- (BOOL)updateRecordWithEntity:(ChatDBEntity *)entity predicate:(ChatDBPredicate *)predicate {
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSString * sql = [NSString stringWithFormat:@"update %@ set %@ %@", self.tableName, entity.sqlSetString, predicate.sqlWhereString];
        result = [db executeUpdate:sql];
        NSLog(@"SQL: %@ Result: %ld", sql, (long)result);
    }];
    return result;
}

- (BOOL)deleteRecordWithPredicate:(ChatDBPredicate *)predicate {
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"delete from %@ %@", self.tableName, predicate.sqlWhereString];
        result = [db executeUpdate:sql];
        NSLog(@"SQL: %@ Result: %ld", sql, (long)result);
    }];
    return result;
}

- (NSUInteger)countWithPredicate:(ChatDBPredicate *)predicate {
    __block NSUInteger count = 0;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"select count(*) from %@ %@", self.tableName, predicate.sqlWhereString];
        count = [db intForQuery:sql];
        NSLog(@"SQL: %@", sql);
    }];
    return count;
}

- (BOOL)insertRecord:(ChatDBRecordBase *)record {
    return NO;
}


- (NSArray<ChatDBRecordBase *> *)recordWithPredicate:(ChatDBPredicate *)predicate {
    return nil;
}
@end
