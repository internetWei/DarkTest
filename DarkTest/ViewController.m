//
//  ViewController.m
//  DarkTest
//
//  Created by LL on 2021/2/27.
//

#import "ViewController.h"

#import "LLDark.h"
#import "TestTableViewCell.h"

#define kColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kColorRGB(r,g,b) kColorRGBA(r,g,b,1.0)

#define kWhiteColor UIColor.whiteColor.themeColor(nil)

#define kBlackColor kColorRGB(27, 27, 27).themeColor(nil)

#define kHightColor kColorRGB(255, 69, 0).themeColor(kColorRGB(14, 224, 0))

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"LLDark";
    
    self.view.backgroundColor = UIColor.whiteColor;
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    
    UIButton *lightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    lightButton.backgroundColor = kBlackColor;
    [lightButton setTitle:@"浅色模式" forState:UIControlStateNormal];
    [lightButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [lightButton setTitleColor:kHightColor forState:UIControlStateHighlighted];
    [lightButton addTarget:self action:@selector(lightEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lightButton];
    CGFloat buttonWidth = (screenWidth - 2 * 30 - 2 * 30) / 3.0;
    lightButton.frame = CGRectMake(30.0, kStatusBarHeight + 44.0 + 10.0, buttonWidth, 35.0);

    UIButton *darkButton = [UIButton buttonWithType:UIButtonTypeSystem];
    darkButton.backgroundColor = kBlackColor;
    [darkButton setTitle:@"深色模式" forState:UIControlStateNormal];
    [darkButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [darkButton setTitleColor:kHightColor forState:UIControlStateHighlighted];
    [darkButton addTarget:self action:@selector(darkEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:darkButton];
    darkButton.frame = CGRectMake(CGRectGetMaxX(lightButton.frame) + 30.0, CGRectGetMinY(lightButton.frame), buttonWidth, 35.0);

    UIButton *systemButton = [UIButton buttonWithType:UIButtonTypeSystem];
    systemButton.backgroundColor = kBlackColor;
    [systemButton setTitle:@"跟随系统" forState:UIControlStateNormal];
    [systemButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [systemButton setTitleColor:kHightColor forState:UIControlStateHighlighted];
    [systemButton addTarget:self action:@selector(systemEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:systemButton];
    systemButton.frame = CGRectMake(CGRectGetMaxX(darkButton.frame) + 30.0, CGRectGetMinY(lightButton.frame), buttonWidth, 35.0);
    
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTableView.backgroundColor = [UIColor whiteColor];
    mainTableView.rowHeight = 45.0;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (@available(iOS 11.0, *)) {
        mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    mainTableView.frame = CGRectMake(0, CGRectGetMaxY(lightButton.frame) + 10.0, screenWidth, UIScreen.mainScreen.bounds.size.height - (CGRectGetMaxY(lightButton.frame) + 10.0));
    mainTableView.dataSource = self;
    [mainTableView registerClass:TestTableViewCell.class forCellReuseIdentifier:NSStringFromClass(TestTableViewCell.class)];
    [self.view addSubview:mainTableView];
}

- (void)lightEvent {
    LLDarkManager.userInterfaceStyle = LLUserInterfaceStyleLight;
}

- (void)darkEvent {
    LLDarkManager.userInterfaceStyle = LLUserInterfaceStyleDark;
}

- (void)systemEvent {
    LLDarkManager.userInterfaceStyle = LLUserInterfaceStyleUnspecified;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TestTableViewCell.class) forIndexPath:indexPath];
    cell.indexRow = indexPath.row;
    return cell;
}

@end
