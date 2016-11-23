//
//  LGLTagsFrame.h
//  LGLSearch-Dome
//
//  Created by 李国良 on 2016/10/15.
//  Copyright © 2016年 李国良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LGLTagsFrame : NSObject

/*
 *  @params tagsArray 标签名称数组
 */
@property (nonatomic, strong) NSArray * tagsArray;

/*
 *  @params tagsTotalHeight 标签的总高度
 */
@property (nonatomic, assign) CGFloat tagsTotalHeight;

/*
 *  @params tagsFrames 每个标签的frame数组
 */
@property (nonatomic, strong) NSMutableArray *tagsFrames;

/*
 *  @params tagsMargin 标签左右之间的间隔 默认是10  （请在给tagsArray赋值之前设置）
 */
@property (nonatomic, assign) CGFloat tagsMargin;

/*
 *  @params tagdPadding 标签上下之间的间隔 默认是10 （请在给tagsArray赋值之前设置）
 */
@property (nonatomic, assign) CGFloat tagsLineMargin;

/*
 *  @params tagdPadding 标签内部的上下左右的间隔 （默认是10） （请在给tagsArray赋值之前设置）
 */
@property (nonatomic, assign) CGFloat tagdPadding;

@end
