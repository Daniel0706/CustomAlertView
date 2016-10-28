//
//  ProfileAlertView.m
//  CRWB
//
//  Created by CR-IOS on 16/7/25.
//  Copyright © 2016年 CR-IOS. All rights reserved.
//

#import "ProfileAlertView.h"

@implementation ProfileAlertView
- ( instancetype )initWithFrame:(CGRect)frame withGroupNumber:(NSInteger) num{
    self = [super initWithFrame:frame];
    if (self) {
        
        _alertView = [[UIView alloc] init];
        [self addSubview:_alertView];
        _alertView.layer.cornerRadius = 6.0;
        _alertView.center = self.center;
        _alertView.frame = CGRectMake((ScreenWidth - 280)/2, (ScreenHeight - 185)/2, 280, 185);
        _alertView.backgroundColor = [UIColor whiteColor];
        
        _operateLabel = [[UILabel alloc] init];
        [_alertView addSubview:_operateLabel];
        _operateLabel.text = @"提示";
        _operateLabel.font = [UIFont systemFontOfSize:19 weight:15];
        _operateLabel.textColor = [UIColor blackColor];
        _operateLabel.textAlignment = NSTextAlignmentCenter;
        _operateLabel.frame = CGRectMake(0, 10, 280, 40);
        
        _messageLabel = [[UILabel alloc] init];
        [_alertView addSubview:_messageLabel];
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.text = [NSString stringWithFormat:@"您已经选择了%ld位共享\n人员，是否将此任务单提交给他们?",(long)num];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 2; //最多显示两行Message
        _messageLabel.frame = CGRectMake(5, CGRectGetMaxY(_operateLabel.frame) + 5, _alertView.frame.size.width - 20, 44);
        
        _setChatButton = [[UIButton alloc] initWithFrame:CGRectMake(_alertView.frame.size.width / 2- 70, CGRectGetMaxY(_messageLabel.frame) + 5, 20, 20)];
        [_alertView addSubview:_setChatButton];
        [_setChatButton setImage:[UIImage imageNamed:@"矩形-33"] forState:UIControlStateNormal];
        [_setChatButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        _chatLabel = [[UILabel alloc] initWithFrame:CGRectMake(_alertView.frame.size.width / 2 - 40, CGRectGetMaxY(_messageLabel.frame) + 5, 110, 20)];
        [_alertView addSubview:_chatLabel];
        _chatLabel.text = @"同时发起聊天";
        _chatLabel.font = [UIFont systemFontOfSize:14];
        
        //创建中间灰色分割线
        UIView * separateBottomLine = [[UIView alloc] init];
        separateBottomLine.backgroundColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1];
        [_alertView addSubview:separateBottomLine];
        separateBottomLine.frame = CGRectMake(0, CGRectGetMaxY(_chatLabel.frame) + 10, _alertView.bounds.size.width, 0.5);
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(separateBottomLine.frame) + 2, _alertView.frame.size.width / 2, 45)];
        [_alertView addSubview:_cancelButton];
        [_cancelButton setTitleColor:[UIColor colorWithRed:16.f/255 green:123.f/255 blue:251.f/255 alpha:1] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setBackgroundColor:[UIColor whiteColor]];
        _cancelButton.tag = 0;
        [_cancelButton addTarget:self action:@selector(didClickBtnCancel:) forControlEvents:UIControlEventTouchUpInside];
        
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(_alertView.bounds.size.width/2, CGRectGetMaxY(separateBottomLine.frame) + 2, _alertView.frame.size.width / 2, 45)];
        [_alertView addSubview:_confirmButton];
        _confirmButton.tag = 1;
        [_confirmButton setTitleColor:[UIColor colorWithRed:16.f/255 green:123.f/255 blue:251.f/255 alpha:1] forState:UIControlStateNormal];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:[UIColor whiteColor]];
        [_confirmButton addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建中间灰色分割线
        UIView * mLine = [[UIView alloc] init];
        mLine.backgroundColor = [UIColor grayColor];
        [_alertView addSubview:mLine];
        mLine.frame = CGRectMake(_alertView.bounds.size.width / 2,  CGRectGetMaxY(separateBottomLine.frame) + 5, 0.5, 40);
        
    }
    return self;

}


- (void) selectButtonClicked:(UIButton *)btn{
    NSLog(@"发起聊天");
    btn.selected = !btn.selected;
    if (!btn.selected) {
        [btn setImage:[UIImage imageNamed:@"矩形-33"] forState:UIControlStateNormal];
        
    }else{
        [btn setImage:[UIImage imageNamed:@"矩形-34"] forState:UIControlStateNormal];
    }
}
- (void) didClickBtnCancel:(UIButton *)btn {
    
    
    [_alertView removeFromSuperview];
    [self removeFromSuperview];
}
- (void) didClickBtnConfirm:(UIButton *)btn {
    
    if (_setChatButton.selected) {
        [self.delegate confirmButtonDidCilckedIsSetChat:YES];
    }else{
        [self.delegate confirmButtonDidCilckedIsSetChat:NO];
    }
    [_alertView removeFromSuperview];
    [self removeFromSuperview];
}
@end
