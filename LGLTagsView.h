//
//  LGLTagsView.h
//  LGLSearch-Dome
//
//  Created by 李国良 on 2016/10/17.
//  Copyright © 2016年 李国良. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TagSelectBlock)(NSString * tagName);

@interface LGLTagsView : UIView

/**
 *  @params frame 高度请传 LGLTagsFrame的  tagsTotalHeight
 *  @params tagsFrame 请传 LGLTagsFrame 的 tagsFrames
 */
- (instancetype)initWithFrame:(CGRect)frame tagsFrame:(NSMutableArray *)tagsFrame selectTagBlock:(TagSelectBlock)block;

/*
 *  @params isSelected 是是否要有选中的效果 默认有选中的效果
 */
@property (nonatomic, assign) BOOL isSelected;

/*
 *  @params tagsSelectedColor 是修改选中tag的背景色颜色（默认 orange） 在没有选中效果的时候设置无效
 */
@property (nonatomic, strong) UIColor * tagsSelectedColor;

@end
