//
//  ChatDBEntity.h
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatDBEntity : NSObject
+ (instancetype)entityWithDictionary:(NSDictionary *)dictionary;

- (NSString *)sqlSetString;
@end

NS_ASSUME_NONNULL_END
