//
//  ChatDBTableProtocol.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>

#import "FMDatabaseQueue.h"

#import "ChatDBPredicate.h"
#import "ChatDBEntity.h"
#import "ChatDBRecordBase.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ChatDBTableProtocol <NSObject>
@property (nonatomic, strong, readonly) NSString *tableName;
@property (nonatomic, strong, readonly) FMDatabaseQueue *dbQueue;

- (instancetype)initWithDBQueue:(FMDatabaseQueue *)dbQueue;

- (void)createOrUpdateTableIfNeeded;

- (BOOL)insertRecord:(ChatDBRecordBase *)record;
- (NSArray<ChatDBRecordBase *> *)recordWithPredicate:(ChatDBPredicate *)predicate;
- (BOOL)updateRecordWithEntity:(ChatDBEntity *)entity predicate:(ChatDBPredicate *)predicate;
- (BOOL)deleteRecordWithPredicate:(ChatDBPredicate *)predicate;
- (NSUInteger)countWithPredicate:(ChatDBPredicate *)predicate;

@end

NS_ASSUME_NONNULL_END
