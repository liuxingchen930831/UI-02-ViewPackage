//
//  XCView.m
//  UI-02
//
//  Created by liuxingchen on 16/9/2.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCView.h"
#import "Shop.h"
@interface XCView ()
@property(nonatomic,strong)UIImageView * image;
@property(nonatomic,strong)UILabel *nameLabel;
@end

@implementation XCView

//封装子控件的步骤
//1.初始化子控件
-(instancetype)init
{
    if (self = [super init]) {
        
        UIImageView *imageView =[[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:imageView];
        self.image = imageView;
        
        UILabel * label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor blueColor];
        [self addSubview:label];
        self.nameLabel = label;
    }
    return self;
}
/*
 2.布局子控件
 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 当控件本身的尺寸发生改变的时候，系统会自动调用这个方法
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat shopW = self.frame.size.width;
    CGFloat shopH = self.frame.size.height;
    self.image.frame = CGRectMake(0, 0, shopW, shopW);
    self.nameLabel.frame = CGRectMake(0, shopW, shopW, shopH - shopW);
}
/*
 3.重写setShop方法
 增加模型属性，在模型属性set方法中设置数据到子控件上
 */
-(void)setShop:(Shop *)shop
{
    _shop = shop;
    self.image.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
}
@end
