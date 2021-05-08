//
//  ChatDBEntity.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDBEntity.h"


@interface ChatDBEntity()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation ChatDBEntity

+ (instancetype)entityWithDictionary:(NSDictionary *)dictionary {
    ChatDBEntity *entity = [[ChatDBEntity alloc] init];
    if (entity) {
        entity.dictionary = dictionary;
    }
    return entity;
}

- (NSString *)sqlSetString {
    NSMutableString *setString = [[NSMutableString alloc] initWithString:@""];
    NSMutableArray *setComponents = [[NSMutableArray alloc] init];
    for(NSString *key in self.dictionary.allKeys) {
        if ([self.dictionary[key] isKindOfClass:[NSString class]]) {
            [setComponents addObject:[NSString stringWithFormat:@"%@ = '%@'", key, self.dictionary[key]]];
        }
        else {
            [setComponents addObject:[NSString stringWithFormat:@"%@ = %@", key, self.dictionary[key]]];
        }
    }
    if (setComponents.count > 0) {
        [setString appendString:[setComponents componentsJoinedByString:@" , "]];
    }
    return setString;
}
@end
