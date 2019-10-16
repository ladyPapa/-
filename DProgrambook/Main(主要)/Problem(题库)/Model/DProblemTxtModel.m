//
//  DProblemTxtModel.m
//  DProgrambook
//
//  Created by titi on 2019/10/16.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DProblemTxtModel.h"

@implementation DProblemTxtModel

/**获取高度**/
-(void)calculateHeight{
    //文字高度
    
    
    
    
    
    CGSize titleSize = [self.question boundingRectWithSize:CGSizeMake(kScreenWidth-40, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:AppFont(18)} context:nil].size;
    
    
    
    CGFloat txtHeight=[self.answer boundingRectWithSize:CGSizeMake(kScreenWidth-40,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: AppFont(16)} context:nil].size.height;
    self.cellHeight=titleSize.height+txtHeight+100;
    
    
}
@end
