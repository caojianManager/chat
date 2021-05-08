//
//  UserBase.m
//  chat
//
//  Created by jian cao on 2021/4/22.
//

#import "UserBase.h"

@implementation UserBase


//+ (NSDateFormatter *)dateFormatter {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"];
//    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
//    return dateFormatter;
//}
////URL转换
//+ (NSValueTransformer *)URLJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}
//
//+ (NSValueTransformer *)HTMLURLJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}
//
////布尔值转换
//+ (NSValueTransformer *)isnewTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
//}
//
//
//
//
//


+ (NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
        @"userId":@"userNum",
        @"userName":@"userName",
        @"college":@"college",
        @"collegeNum":@"collegeNum",
        @"ownClass":@"ownClass",
        @"identityCard":@"identityCard",
        @"atCampus":@"atCampus",
        @"grade":@"grade",
        @"majorName":@"majorName",
        @"isRealChat":@"isRealChat"
    };
}

+ (instancetype) getUserBase:(NSString *) jsonStr{
    
    NSError *error = nil;
    NSDate *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    UserBase *user = [MTLJSONAdapter modelOfClass:UserBase.class fromJSONDictionary:dataDict error:&error];
    return user;
}

@end
