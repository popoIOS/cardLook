//
//  ViewController.m
//  CardLayout
//
//  Created by 陈凯 on 2017/3/1.
//  Copyright © 2017年 陈凯. All rights reserved.
//

#import "ViewController.h"
#import "CardLayOut.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (strong, nonatomic) NSMutableArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CardLayOut *layout = [CardLayOut new];
    layout.scale = 1.3;
    layout.spacing = 110;
    layout.itemSize = CGSizeMake(self.view.frame.size.width-120, 300);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    cell.layer.cornerRadius = 5;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:CGPointMake(scrollView.contentOffset.x+0.5*scrollView.bounds.size.width, 0.5*scrollView.bounds.size.height)];
    if (!indexPath || self.currentIndexPath == indexPath) {
        return;
    }
    self.currentIndexPath = indexPath;
    
}

@end
