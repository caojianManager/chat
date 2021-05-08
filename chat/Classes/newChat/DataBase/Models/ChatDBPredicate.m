//
//  ChatDBPredicate.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDBPredicate.h"

@interface ChatDBPredicate()

@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, assign) NSUInteger limitCount;
@property (nonatomic, strong) NSString *orderByColumn;
@property (nonatomic, assign) BOOL isOrderByDesc;

@end

@implementation ChatDBPredicate
+ (instancetype)predicateWithDictionary:(NSDictionary *)dictionary {
    return [self predicateWithDictionary:dictionary orderColumn:@"" isOrderByDesc:NO limitCount:0];
}

+ (instancetype)predicateWithDictionary:(NSDictionary *)dictionary orderColumn:(NSString *)orderColumn isOrderByDesc:(BOOL)isOrderByDesc limitCount:(NSUInteger)limitCount {
    ChatDBPredicate *predicate = [[ChatDBPredicate alloc] init];
    if (predicate) {
        predicate.dictionary = dictionary;
        predicate.orderByColumn = orderColumn;
        predicate.isOrderByDesc = isOrderByDesc;
        predicate.limitCount = limitCount;
    }
    return predicate;
}

- (NSString *)sqlWhereString {
    NSMutableString *whereString = [[NSMutableString alloc] initWithString:@""];
    
    NSMutableArray *whereComponetns = [[NSMutableArray alloc] init];
    for(NSString *key in self.dictionary.allKeys) {
        if ([self.dictionary[key] isKindOfClass:[NSString class]]) {
            [whereComponetns addObject:[NSString stringWithFormat:@"%@ = '%@'", key, self.dictionary[key]]];
        }
        else {
            [whereComponetns addObject:[NSString stringWithFormat:@"%@ = %@", key, self.dictionary[key]]];
        }
    }
    if (whereComponetns.count > 0) {
        [whereString appendString:[NSString stringWithFormat:@"where %@",[whereComponetns componentsJoinedByString:@" and "]]];
    }
    
    if (self.orderByColumn.length > 0) {
        if (self.isOrderByDesc) {
            [whereString appendString:[NSString stringWithFormat:@" order by %@ desc", self.orderByColumn]];
        }
        else {
            [whereString appendString:[NSString stringWithFormat:@" order by %@ asc", self.orderByColumn]];
        }
    }
    
    if (self.limitCount > 0) {
        [whereString appendString:[NSString stringWithFormat:@" limit 0, %ld", (long)self.limitCount]];
    }
    
    return whereString;
}
@end
