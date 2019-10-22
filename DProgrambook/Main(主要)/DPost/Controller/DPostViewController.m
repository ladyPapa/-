//
//  DPostViewController.m
//  DProgrambook
//
//  Created by titi on 2019/10/10.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DPostViewController.h"
#import "DPostModel.h"
#import "DPostTableViewCell.h"

@implementation DPostViewController

- (void)viewWillAppear:(BOOL)animate
{
    [super viewWillAppear:animate];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.title = @"帖子";
    
    [self addRightBarButtonItem:ImageNamed(@"编辑")];
    [self initializeRefresh];
    [self onHeaderRefreshing];
    
    self.tableView.frame = CGRectMake(0, 50, kScreenWidth, kScreenHeight-50);
}

//数据处理
-(void)dataProcessingIsRemove:(BOOL)isRemove input:(id)input{
    if (isRemove) {
        [self.listArray removeAllObjects];
        [self.tableView  reloadData];
    }
    for (BmobObject *obj in input) {
        DPostModel *model    = [DPostModel new];
        [model modelDealWith:obj];
        [self.listArray addObject:model];
    }
    
    [self.tableView  reloadData];
    
}
//获取参数
-(BmobQuery *)getBmobQuery{
    NSString *className = @"DPost";
    BmobQuery *query = [BmobQuery queryWithClassName:className];
    query.limit = 16; //请求数量
    query.skip = self.listArray.count;//跳过的数据
    [query orderByDescending:@"updatedAt"];
    return query;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 20;
    }
    return 0;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *contentView = [[UIView alloc] init];
    [contentView setBackgroundColor:AppAlphaColor(242, 242, 242, 0.6)];
    return contentView;
}
#pragma mark - UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        CGFloat viewWidth= (SCREEN_WIDTH-60)/2;
        return viewWidth*0.58+50;
    }
    else{
        DPostModel *model   = self.listArray[indexPath.row];
        if (!model.cellHeight) {
            [model calculateHeight];
        }
        return model.cellHeight;
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return 1;
    }else{
        return self.listArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        DHotRecommendCell*cell = [DHotRecommendCell cellWithTableView:tableView];
        WEAKSELF
        cell.clickPushView =^(DPushViewType type){
            [weakSelf.view showLoadingMeg:@"功能未开放" time:kDefaultShowTime];
            if (type==DPushViewTypeVideo) {
                
            }else if (type==DPushViewTypeAudio){
                
            }
        };
        
        
        return cell;
        
        
    }else{
        
        DPostTableViewCell *cell = [DPostTableViewCell cellWithTableView:tableView];
        DPostModel *model = self.listArray[indexPath.row];
        [cell setData:model];
        return cell;
        
        
    }
    
    
    
    
    
}


#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if (cell.tag!=100) {
        cell.tag=100;
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, 0, 0, 0, 1);//渐变
        transform = CATransform3DTranslate(transform, 0, -50, 0);//左边水平移动
        transform = CATransform3DScale(transform, 0, 0, 0);//由小变大
        cell.layer.transform = transform;
        cell.layer.opacity = 0.0;
        [UIView animateWithDuration:0.5 animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.layer.opacity = 1;
        }];
    }
    
}

@end
