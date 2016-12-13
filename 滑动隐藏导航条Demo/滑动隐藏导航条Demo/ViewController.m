//
//  ViewController.m
//  滑动隐藏导航条Demo
//
//  Created by JmoVxia on 2016/10/16.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

/**tableView*/
@property (nonatomic,strong) UITableView *tableView;
/**滑动位置记录*/
@property (nonatomic,assign) CGFloat lastContentOffset;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"滑动隐藏";
    self.view.backgroundColor = [UIColor whiteColor];
    //tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Index=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Index];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Index];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
#pragma mark - tableview滑动代理

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _lastContentOffset = scrollView.contentOffset.y;
    
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    if(scrollView.contentOffset.y > _lastContentOffset)
    {
        //上滑
//        [UIView animateWithDuration:1.0 animations:^{
//        self.navigationController.navigationBar.alpha = 0;
//        }];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else
    {
        //下滑
//        [UIView animateWithDuration:1.0 animations:^{
//            self.navigationController.navigationBar.alpha = 1.0;
//        }];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    

}



@end
