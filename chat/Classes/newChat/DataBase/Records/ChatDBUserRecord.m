//
//  ChatDBUserRecord.m
//  chat
//
//  Created by jian cao on 2021/4/24.
//

#import "ChatDBUserRecord.h"


@implementation ChatDBUserRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"userId"      : UserColumnUserId,
             @"userName"   : UserColumnuserName,
             @"college" : UserColumncollege,
             @"collegeNum"   : UserColumncollegeNum,
             @"ownClass"  : UserColumnownClass,
             @"identityCard"       : UserColumnidentityCard,
             @"atCampus": UserColumnatCampus,
             @"grade"       : UserColumngrade,
             @"majorName": UserColumnmajorName,
             @"isRealChat": UserColumnisRealChat
             };
}


- (instancetype)initWithUser:(UserBase *)user {
    self = [super init];
    if (self) {
        self.userId = user.userId;
        self.userName = user.userName;
        self.college = user.college;
        self.collegeNum = user.collegeNum;
        self.ownClass = user.ownClass;
        self.identityCard = user.identityCard;
        self.atCampus = user.atCampus;
        self.grade = user.grade;
        self.majorName = user.majorName;
        self.isRealChat = user.isRealChat;
    }
    return self;
}
@end
