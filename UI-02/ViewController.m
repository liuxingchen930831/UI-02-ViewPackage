//
//  ViewController.m
//  UI-02
//
//  Created by liuxingchen on 16/8/30.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"
#import "XCView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopView;
/** 数据源 */
@property(nonatomic,strong)NSArray * shopsArray ;
/** 添加 */
@property(nonatomic,strong)UIButton * addBtn ;
/** 删除 */
@property(nonatomic,strong)UIButton * removeBtn ;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

//一进来就会调用viewDidLoad方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addBtn = [self frame:CGRectMake(50, 50, 70, 70) normalImage:@"add" highlightedImage:@"add_highlighted" disabledImage:@"add_disabled" tag:10 action:@selector(add:)];
    
    self.removeBtn = [self frame:CGRectMake(250, 50, 70, 70) normalImage:@"remove" highlightedImage:@"remove_highlighted" disabledImage:@"remove_disabled" tag:20 action:@selector(remove:)];
    self.removeBtn.enabled = NO;
}

-(NSArray *)shopsArray
{
    
    if (_shopsArray ==nil) {
        //加载
        NSArray *sArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"shops" ofType:@"plist"]];
        NSMutableArray *shopMarray = [NSMutableArray array];
        for (NSDictionary *dict in sArray) {
            Shop *shop = [[Shop alloc]initWithDict:dict];
            [shopMarray addObject:shop];
        }
        _shopsArray = shopMarray;
    }
    return _shopsArray;
}

-(UIButton *)frame:(CGRect) frame
 normalImage:(NSString *) normalImage
highlightedImage:(NSString *) highlightedImage
disabledImage:(NSString *) disabledImage
          tag:(NSInteger) tag
       action:(SEL) action
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:disabledImage] forState:UIControlStateDisabled];
    btn.tag = tag;
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
}

-(void)add:(UIButton *)btn;
{
    CGFloat shopW = 70;
    CGFloat shopH = 90;
    
    int cols = 3;
    
    CGFloat colsMargin = (self.shopView.frame.size.width - cols * shopW)/(cols-1);
    
    NSUInteger index = self.shopView.subviews.count;
    
    NSUInteger col = index %cols ;
    CGFloat shopX = col *(colsMargin + shopW);
    
    CGFloat rowMargin = 10;
    NSUInteger row = index /cols ;
    
    CGFloat shopY = row *(rowMargin +shopH);
    
    //把封装子控件和给子控件赋值完全封装在XCView里
    XCView *view = [[XCView alloc]init];
    view.frame = CGRectMake(shopX, shopY, shopW, shopH);
    view.shop = self.shopsArray[index];
    
    [self.shopView addSubview:view];
    
    [self ButtonState];
}
-(void)remove:(UIButton *)btn;
{
    [self.shopView.subviews.lastObject removeFromSuperview];
    [self ButtonState];
}
-(void)ButtonState
{
    self.addBtn.enabled = (self.shopView.subviews.count < self.shopsArray.count);
    self.removeBtn.enabled = (self.shopView.subviews.count > 0);
    
    NSString *text = nil;
    if (self.addBtn.enabled == NO) {
        text = @"加满了别买了";
    }else if (self.removeBtn.enabled ==NO){
        text = @"删光了买买买";
    }
    if (text==nil)return;
    self.label.alpha = 1.0;
    self.label.text = text;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.label.alpha = 0.0;
    });
    
}

@end
