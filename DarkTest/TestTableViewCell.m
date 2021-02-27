//
//  TestTableViewCell.m
//  DarkTest
//
//  Created by LL on 2021/2/27.
//

#import "TestTableViewCell.h"

#import "LLDark.h"

@interface TestTableViewCell ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation TestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initialize];
        [self createSubviews];
    }
    return self;
}


#pragma mark - 初始化
- (void)initialize {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


#pragma mark - UI
- (void)createSubviews {
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.frame = CGRectMake(10.0, 10.0, 300.0, 25.0);
    titleLabel.backgroundColor = UIColor.orangeColor;
    [self.contentView addSubview:titleLabel];
}

- (void)setIndexRow:(NSInteger)indexRow {
    _indexRow = indexRow;
    
    NSAttributedString *mutable_attr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"我是第%zd行的内容", indexRow] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0], NSForegroundColorAttributeName : UIColor.whiteColor.themeColor(UIColor.blackColor)}];
    self.titleLabel.attributedText = mutable_attr;
}

@end
