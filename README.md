# 滑动隐藏导航条
# 前言
我们经常在一些APP中看到往上滑动隐藏导航条，往下滑动的时候显示导航条，在这里使用tableView简单实现了一下这种效果。
# 思路
在滑动代理中，根据偏移量来判断是上滑还是下滑，然后分别做隐藏还是显示。
# 核心代码
```

#pragma mark - 滑动代理
//开始滑动的时候记录位置
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _lastContentOffset = scrollView.contentOffset.y;
    
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    if(scrollView.contentOffset.y > _lastContentOffset)
    {
        //上滑
//        [UIView animateWithDuration:1.0 animations:^{
//        self.navigationController.navigationBar.alpha = 0;
//        }];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else
    {
        //下滑
//        [UIView animateWithDuration:1.0 animations:^{
//            self.navigationController.navigationBar.alpha = 1.0;
//        }];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    

}
    
    
```
你也可以在这里边添加自己想要的动画。
# 效果图
![滑动隐藏.gif](http://upload-images.jianshu.io/upload_images/1979970-72f7ad06020886fe.gif?imageMogr2/auto-orient/strip)
# 简书地址
http://www.jianshu.com/p/16a0a862b486
