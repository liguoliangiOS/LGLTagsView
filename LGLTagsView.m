//
//  LGLTagsView.m
//  LGLSearch-Dome
//
//  Created by 李国良 on 2016/10/17.
//  Copyright © 2016年 李国良. All rights reserved.
//

#import "LGLTagsView.h"
@interface LGLTagsView ()

@property (nonatomic, strong) NSMutableArray * tagsFrame;
@property (nonatomic, strong) UIButton * startButton;
@property (nonatomic, copy) TagSelectBlock block;

@end

@implementation LGLTagsView

- (instancetype)initWithFrame:(CGRect)frame tagsFrame:(NSMutableArray *)tagsFrame selectTagBlock:(TagSelectBlock)block {
    self = [super initWithFrame:frame];
    if (self) {
        self.tagsFrame = tagsFrame;
        self.isSelected = YES;
        self.tagsSelectedColor = [UIColor orangeColor];
        self.block = block;
        [self createTagsView];
    }
    return self;
}

- (void)createTagsView {
    for (UIButton * tags in self.tagsFrame) {
        [tags addTarget:self action:@selector(tagsClink:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tags];
    }
}

- (void)tagsClink:(UIButton *)button {
    if (self.isSelected) {
        if(button !=self.startButton){
            self.startButton.selected = NO;
            [self.startButton setBackgroundColor:[UIColor whiteColor]];
            self.startButton.layer.borderColor = [UIColor blackColor].CGColor;
            self.startButton = button;
        }
        self.startButton.selected=YES;
        if (self.startButton.selected) {
            [self.startButton setBackgroundColor:self.tagsSelectedColor];
            self.startButton.layer.borderColor = [UIColor whiteColor].CGColor;
        }
    }
    self.block(button.titleLabel.text);
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
}

- (void)setTagsSelectedColor:(UIColor *)tagsSelectedColor {
    _tagsSelectedColor = tagsSelectedColor;
}


- (NSMutableArray *)tagsFrame {
    if (!_tagsFrame ) {
        _tagsFrame = [NSMutableArray array];
    }
    return _tagsFrame;
}
@end
