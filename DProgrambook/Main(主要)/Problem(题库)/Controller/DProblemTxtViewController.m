//
//  DProblemTxtViewController.m
//  DProgrambook
//
//  Created by titi on 2019/10/16.
//  Copyright © 2019 xushaocong. All rights reserved.
//

#import "DProblemTxtViewController.h"
#import "DProblemTxtModel.h"
#import "DProblemTxtCell.h"
#import "DProblemTxtHeaderView.h"

@interface DProblemTxtViewController ()

@property (nonatomic,strong) DProblemTxtHeaderView *tableHerderView;
@end

@implementation DProblemTxtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = UIColorFromRGBValue(0xF6F6F6);
    UIEdgeInsets contenInset = self.tableView.contentInset;
    contenInset.top = (IS_iPhoneX ? -45 : -25);
    [self.tableView setContentInset:contenInset];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self initializeDataModel];
}

-(void)initializeDataModel{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@.json",self.probleModel.problemID] ofType:nil];
        if(dataPath){
            NSData *localData = [[NSData alloc]initWithContentsOfFile:dataPath];
            NSArray *localArray = [NSJSONSerialization JSONObjectWithData:localData options:0 error:nil];
            [self.listArray addObjectsFromArray:[DProblemTxtModel mj_objectArrayWithKeyValuesArray:localArray]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.tableView reloadData];
        });
    });
    
    
}

//设置头部
-(void)initializeTableHeaderView{
    
    self.tableView.tableHeaderView = self.tableHerderView;
    [self.tableHerderView setData:self.probleModel];
    [self.tableHerderView.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - 表格代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    DProblemTxtCell *cell = [DProblemTxtCell cellWithTableView:tableView];
    DProblemTxtModel *model = self.listArray[indexPath.row];
    [cell setData:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DProblemTxtModel *model   = self.listArray[indexPath.row];
    if (!model.cellHeight) {
        [model calculateHeight];
    }
    return model.cellHeight;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}
//拖动头部图片变化
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.y;
    if(offset<=0)
    {
        CGRect rect = self.tableHerderView.frame;
        rect.origin.y = offset;
        rect.size.height = -offset +240;
        self.tableHerderView.bgImageView.frame = rect;
    }
}

-(DProblemTxtHeaderView *)tableHerderView{
    if(!_tableHerderView){
        _tableHerderView = [[DProblemTxtHeaderView alloc]init];
        _tableHerderView.frame = CGRectMake(0, 0, kScreenWidth, 320);
    }
    return _tableHerderView;
}
@end
