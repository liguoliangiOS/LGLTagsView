//
//  LGLTagsFrame.m
//  LGLSearch-Dome
//
//  Created by 李国良 on 2016/10/15.
//  Copyright © 2016年 李国良. All rights reserved.
//

#import "LGLTagsFrame.h"
#define WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT  ([UIScreen mainScreen].bounds.size.height)

@interface LGLTagsFrame ()

@property (nonatomic, strong) UIButton * startButton;

@end

@implementation LGLTagsFrame

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tagsFrames = [NSMutableArray array];
        self.tagsMargin = 10;
        self.tagsLineMargin = 10;
        self.tagdPadding = 10;
    }
    return self;
}

- (void)setTagsArray:(NSArray *)tagsArray {
    _tagsArray = tagsArray;
    // 去掉重复的title
    NSSet * set = [NSSet setWithArray:tagsArray];
    NSArray * titleArray = [set  allObjects];
    NSArray * sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    NSArray * sort1Array = [titleArray sortedArrayUsingDescriptors:sortDesc];
    CGFloat tagsWidth = 0;
    CGFloat tagY = 10;
    NSMutableArray * frameA = [NSMutableArray array];
    for (NSString * title in sort1Array) {                     //计算出每个标题的Size
        CGSize titleSize = [self sizeWithText:title font:[UIFont systemFontOfSize:14] maxW:0];
        [frameA addObject:NSStringFromCGSize(titleSize)];
    }
    for (NSInteger i = 0; i < frameA.count; i ++) {
        CGSize size = CGSizeFromString(frameA[i]);
        CGFloat width = size.width + self.tagdPadding;
        CGFloat height = size.height + self.tagdPadding;
        if ((WIDTH - tagsWidth - self.tagsMargin) < (width)) {
            tagY = tagY + height + self.tagsLineMargin;
            tagsWidth = 0;
        }
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.tagsMargin + tagsWidth, tagY, width, height);
        [btn setTitle:sort1Array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        [self.tagsFrames addObject:btn];
        tagsWidth = CGRectGetMaxX(btn.frame);
        if (i == frameA.count - 1) {
            self.tagsTotalHeight = CGRectGetMaxY(btn.frame) + self.tagsLineMargin;
        }
    }
}

//计算文字的大小 maxW限制最大宽度 maxW 传MAXFLOAT，没有限制最大的宽度
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)setTagsMargin:(CGFloat)tagsMargin {
    _tagsMargin = tagsMargin;
}

- (void)setTagsLineMargin:(CGFloat)tagsLineMargin {
    _tagsLineMargin = tagsLineMargin;
}

- (void)setTagdPadding:(CGFloat)tagdPadding {
    _tagdPadding = tagdPadding;
}

@end
