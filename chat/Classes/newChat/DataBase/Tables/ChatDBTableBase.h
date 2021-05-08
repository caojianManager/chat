//
//  ChatDBTableBase.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

#import "ChatDBTableProtocol.h"
#import "ChatDBPredicate.h"
#import "ChatDBEntity.h"
#import "ChatDBRecordBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatDBTableBase : NSObject <ChatDBTableProtocol>
@property (nonatomic, strong, readonly) NSString *tableName;
@property (nonatomic, strong, readonly) FMDatabaseQueue *dbQueue;

- (BOOL)insertRecord:(ChatDBRecordBase *)record;
- (NSArray<ChatDBRecordBase *> *)recordWithPredicate:(ChatDBPredicate *)predicate;
- (BOOL)updateRecordWithEntity:(ChatDBEntity *)entity predicate:(ChatDBPredicate *)predicate;
- (BOOL)deleteRecordWithPredicate:(ChatDBPredicate *)predicate;
- (NSUInteger)countWithPredicate:(ChatDBPredicate *)predicate;
@end

NS_ASSUME_NONNULL_END
