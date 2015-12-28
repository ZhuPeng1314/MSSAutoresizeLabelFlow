//
//  MSSAutoresizeLabelFlow.m
//  MSSAutoresizeLabelFlow
//
//  Created by Mrss on 15/12/26.
//  Copyright © 2015年 expai. All rights reserved.
//

#import "MSSAutoresizeLabelFlow.h"
#import "MSSAutoresizeLabelFlowLayout.h"
#import "MSSAutoresizeLabelFlowCell.h"
#import "MSSAutoresizeLabelFlowConfig.h"

static NSString *const cellId = @"cellId";

@interface MSSAutoresizeLabelFlow () <UICollectionViewDataSource,UICollectionViewDelegate,MSSAutoresizeLabelFlowLayoutDataSource,MSSAutoresizeLabelFlowLayoutDelegate>
@property (nonatomic,strong) UICollectionView *collection;
@property (nonatomic,strong) NSMutableArray   *data;
@property (nonatomic,  copy) selectedHandler  handler;

@end

@implementation MSSAutoresizeLabelFlow

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles selectedHandler:(selectedHandler)handler {
    self = [super initWithFrame:frame];
    if (self) {
        self.data = [titles mutableCopy];
        self.handler = handler;
        [self setup];
    }
    return self;
}

- (void)setup {
    MSSAutoresizeLabelFlowConfig *config = [MSSAutoresizeLabelFlowConfig shareConfig];
    MSSAutoresizeLabelFlowLayout *layout = [[MSSAutoresizeLabelFlowLayout alloc]init];
    layout.delegate = self;
    layout.dataSource = self;
    layout.itemHeight = config.itemHeight;
    layout.itemSpace = config.itemSpace;
    layout.contentInsets = config.contentInsets;
    layout.lineSpace = config.lineSpace;
    layout.textMargin = config.textMargin;
    layout.titleFont = config.titleFont;
    self.collection = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.collection.allowsMultipleSelection = YES;
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor lightGrayColor];
    [self.collection registerClass:[MSSAutoresizeLabelFlowCell class] forCellWithReuseIdentifier:cellId];
    [self addSubview:self.collection];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MSSAutoresizeLabelFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell configCell:self.data[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSString *)titleForLabelAtIndexPath:(NSIndexPath *)indexPath {
    return self.data[indexPath.item];
}

- (void)linebreak {
    
}

- (void)insertLabelWithTitle:(NSString *)title atIndex:(NSUInteger)index animated:(BOOL)animated {
    [self insertLabelsWithTitles:@[title] atIndexes:[NSIndexSet indexSetWithIndex:index] animated:animated];
}

- (void)insertLabelsWithTitles:(NSArray *)titles atIndexes:(NSIndexSet *)indexes animated:(BOOL)animated {
    [self performBatchUpdatesWithAction:@"insert" indexPaths:@[] animated:animated];
}

- (void)deleteLabelAtIndex:(NSUInteger)index animated:(BOOL)animated {
    [self deleteLabelsAtIndexes:[NSIndexSet indexSetWithIndex:index] animated:animated];
}

- (void)deleteLabelsAtIndexes:(NSIndexSet *)indexes animated:(BOOL)animated {
    [self performBatchUpdatesWithAction:@"delete" indexPaths:nil animated:animated];
}

- (void)performBatchUpdatesWithAction:(NSString *)action indexPaths:(NSArray *)indexPaths animated:(BOOL)animated {
    if (!animated) {
        [UIView setAnimationsEnabled:NO];
    }
    [self.collection performBatchUpdates:^{
        if ([action isEqualToString:@"insert"]) {
            [self.collection insertItemsAtIndexPaths:indexPaths];
        }
        else if ([action isEqualToString:@"delete"]) {
            [self.collection deleteItemsAtIndexPaths:indexPaths];
        }
    } completion:^(BOOL finished) {
        if (!animated) {
            [UIView setAnimationsEnabled:YES];
        }
    }];
}

- (void)reloadLabelWithTitle:(NSString *)title atIndex:(NSUInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.data replaceObjectAtIndex:index withObject:title];
    [self.collection reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)reloadWithTitles:(NSArray *)titles {
    self.data = [titles mutableCopy];
    [self.collection reloadData];
}

@end

