//
//  ChatZeroMQMessage.h
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
NS_ASSUME_NONNULL_BEGIN

@interface ChatZeroMQMessage : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *content;    //显示文字
@property (nonatomic, assign) NSInteger msgId;     //本身的msg id
@property (nonatomic, strong) NSString *msgType;    //"text", "image", "forward","voice","localsong" , "custom"
@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *targetId;
@property (nonatomic, strong) NSString *image;      // custom类型时显示的图片链接

@property (nonatomic, strong) NSString *type;       //"0" "1" 群组消息 个人私信
@property (nonatomic, strong) NSString *timeStamp;  //时间戳
@property (nonatomic, assign) long long lastId;     //本消息的lastid 一般只有群组的loadmore时候才需要用到。

@property (nonatomic, assign) NSInteger chatId;
@end

NS_ASSUME_NONNULL_END
