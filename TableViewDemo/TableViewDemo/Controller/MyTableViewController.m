//
//  MyTableViewController.m
//  TableViewDemo
//
//  Created by 郜宇 on 15/10/31.
//  Copyright © 2015年 郜宇. All rights reserved.
//

#import "MyTableViewController.h"
#import "GYStatusCell.h"
#import "GYStatus.h"
#import "GYStatusFrame.h"
@interface MyTableViewController ()
//模型
@property (nonatomic,strong)NSArray *statusFrames;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GYStatusCell *cell = [GYStatusCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GYStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}


#pragma mark --- 懒加载
- (NSArray *)statusFrames
{
    if (!_statusFrames) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *statusArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dict in statusArray) {
            GYStatus *status = [GYStatus statusWithDict:dict];
            GYStatusFrame *statusFrame = [GYStatusFrame new];
            statusFrame.status = status;
            [muArray addObject:statusFrame];
        }
        _statusFrames = muArray;
    }
    return _statusFrames;
}




@end
