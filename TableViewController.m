//
//  TableViewController.m
//  CoffeeNote
//
//  Created by 凸 on 9/6/14.
//  Copyright (c) 2014 YutaTotz. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceiPhone;
@property (nonatomic, strong) NSArray *dataSourceAndroid;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    self.dataSourceiPhone = @[@"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5c", @"iPhone 5s"];
    self.dataSourceAndroid = @[@"Nexus", @"Galaxy", @"Xperia"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

/**
 テーブルに表示するデータ件数を返します。（必須）
 
 @return NSInteger : データ件数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger dataCount;
    
    // テーブルに表示するデータ件数を返す
    switch (section) {
        case 0:
            dataCount = self.dataSourceiPhone.count;
            break;
        case 1:
            dataCount = self.dataSourceAndroid.count;
            break;
        default:
            break;
    }
    return dataCount;
}

/**
 テーブルに表示するセクション（区切り）の件数を返します。（オプション）
 
 @return NSInteger : セクションの数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


/**
 テーブルに表示するセルを返します。（必須）
 
 @return UITableViewCell : テーブルセル
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.dataSourceiPhone[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.dataSourceAndroid[indexPath.row];
            break;
        default:
            break;
    }
    
    return cell;
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}
 */

-(IBAction)returnTable:(UIStoryboardSegue *)segue {
}

@end
