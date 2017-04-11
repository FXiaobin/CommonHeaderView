//
//  CollectionHeaderView.m
//  WealthCloud
//
//  Created by fanxiaobin on 2017/4/11.
//  Copyright © 2017年 caifumap. All rights reserved.
//

#import "CollectionHeaderView.h"
#import "UIButton+SSEdgeInsets.h"
#import <Masonry.h>

@interface CollectionHeaderView ()

@property  (nonatomic,strong) UIButton *leftBtn;

@property  (nonatomic,strong) UIButton *rightBtn;

@end

@implementation CollectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self.leftBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        self.leftBtn.userInteractionEnabled = NO;
        [self addSubview:self.leftBtn];
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [self.rightBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [self.rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBtn];

        
    }
    return self;
}

-(void)setLeftTitle:(NSString *)leftTitle leftImage:(NSString *)leftImage{
    [self.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    
    if (leftImage) {
        [self.leftBtn setImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
        [self.leftBtn setImagePositionWithType:SSImagePositionTypeRight spacing:1.0];
    }
    
    CGFloat width = [leftTitle sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0]}].width;
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15.0);
        make.top.equalTo(self).offset(5.0);
        make.bottom.equalTo(self.mas_bottom).offset(-5.0);
        if (leftImage) {
            make.width.mas_equalTo(width + 40.0);
        }else{
            make.width.mas_equalTo(width + 10.0);
        }
        
    }];
    
}

-(void)setRightTitle:(NSString *)rightTitle rightImage:(NSString *)rightImage clickBlock:(headerBtnActionBlcok)block{
    self.clickBlock = block;
    
    [self.rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    
    if (rightImage) {
        [self.rightBtn setImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
        [self.rightBtn setImagePositionWithType:SSImagePositionTypeRight spacing:1.0];
    }
    
    CGFloat width = [rightTitle sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0]}].width;
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15.0);
        make.top.equalTo(self).offset(5.0);
        make.bottom.equalTo(self.mas_bottom).offset(-5.0);
        if (rightImage) {
            make.width.mas_equalTo(width+40.0);
        }else{
            make.width.mas_equalTo(width+10.0);
        }
        
    }];
}

- (void)rightBtnAction:(UIButton *)sender{
    
    if (self.clickBlock) {
        self.clickBlock(sender);
    }
    
}


@end
