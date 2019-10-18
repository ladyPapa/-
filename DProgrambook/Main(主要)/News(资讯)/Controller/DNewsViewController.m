//
//  DNewsViewController.m
//  DProgrambook
//
//  Created by titi on 2019/10/10.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DNewsViewController.h"
#import "DNewsModel.h"
#import "DNewsCell.h"

@interface DNewsViewController()

@property (nonatomic,strong) NSMutableArray *bannerArray;
@end

@implementation DNewsViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"资讯";
    [self initializeRefresh];
    [self onHeaderRefreshing];
    
}
-(void)initializeData{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"information.json" ofType:nil];
    if (dataPath) {
        NSData *localData = [[NSData alloc] initWithContentsOfFile:dataPath];
        NSArray* localArray = [NSJSONSerialization JSONObjectWithData:localData options:0 error:nil];
        [self.bannerArray addObjectsFromArray:[DNewsModel mj_objectArrayWithKeyValuesArray:localArray]];
    }
    
}


#pragma mark - 共享方法
//数据处理
-(void)dataProcessingIsRemove:(BOOL)isRemove input:(id)input{
    if (isRemove) {
        [self.listArray removeAllObjects];
        [self.tableView  reloadData];
    }
    for (BmobObject *obj in input) {
        DNewsModel *model    = [DNewsModel new];
        [model modelDealWith:obj];
        [self.listArray addObject:model];
    }
    
    [self.tableView  reloadData];
    
}
//获取参数
-(BmobQuery *)getBmobQuery{
    NSString *className = @"Information";
    BmobQuery *query = [BmobQuery queryWithClassName:className];
    query.limit = 6; //请求数量
    query.skip = self.listArray.count;//跳过的数据
    [query orderByDescending:@"updatedAt"];
    return query;
}

#pragma mark - 表格代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    DNewsCell *cell = [DNewsCell cellWithTableView:tableView];
    DNewsModel *model = self.listArray[indexPath.row];
    [cell setData:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DNewsModel *model   = self.listArray[indexPath.row];
    if (!model.cellHeight) {
        [model calculateHeight];
    }
    return model.cellHeight;
}

- (NSMutableArray *)bannerArray {
    if (_bannerArray == nil) {
        _bannerArray = [NSMutableArray array];
    }
    return _bannerArray;
}
@end
