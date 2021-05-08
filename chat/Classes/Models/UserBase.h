//
//  UserBase.h
//  chat
//
//  Created by jian cao on 2021/4/22.
//

#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserBase : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy) NSString *userId; //学号
@property (nonatomic,copy) NSString *userName; //用户姓名
@property (nonatomic,copy) NSString *college; //学院
@property (nonatomic,assign) NSNumber *collegeNum; //学院编号
@property (nonatomic,copy) NSString *ownClass; //班级
@property (nonatomic,copy) NSString *identityCard; //身份证号
@property (nonatomic,copy) NSString *atCampus; //是在校园
@property (nonatomic,assign) NSNumber *grade; //年级
@property (nonatomic,copy) NSString *majorName; //专业名称
@property (nonatomic,assign) NSNumber *isRealChat;  //是否为正在聊天用户 默认为0->没有在聊天。1->


+ (instancetype) getUserBase:(NSString *) jsonStr;

@end

NS_ASSUME_NONNULL_END
