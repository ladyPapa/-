//
//  DProblemViewController.m
//  DProgrambook
//
//  Created by titi on 2019/10/10.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DProblemViewController.h"
#import "DProblemCell.h"
#import "DProblemModel.h"

@interface DProblemViewController()


@end
@implementation DProblemViewController

- (void)viewDidAppear:(BOOL)animated{
    [TableViewAnimationKit showWithAnimationType:5 tableView:self.tableView];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"题库";
    self.tableView.backgroundColor = UIColorFromRGBValue(0xF6F6F6);
    
}

-(void)initializeData{
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Problem.json" ofType:nil];
    if(dataPath){
        NSData *localData = [[NSData alloc]initWithContentsOfFile:dataPath];
        NSArray *localArrar = [NSJSONSerialization JSONObjectWithData:localData options:0 error:nil];
        [self.listArray addObjectsFromArray:[DProblemModel mj_objectArrayWithKeyValuesArray:localArrar] ];
    }
}

#pragma mark - 表格代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DProblemCell *cell = [DProblemCell cellWithTableView:tableView];
    DProblemModel * model = self.listArray[indexPath.row];
    [cell setData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 95;
}

@end


