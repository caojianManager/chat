//
//  ChatDBPredicate.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatDBPredicate : NSObject
+ (instancetype)predicateWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)predicateWithDictionary:(NSDictionary *)dictionary orderColumn:(NSString *)orderColumn  isOrderByDesc:(BOOL)isOrderByDesc limitCount:(NSUInteger)limitCount;

- (NSString *)sqlWhereString;
@end

NS_ASSUME_NONNULL_END
