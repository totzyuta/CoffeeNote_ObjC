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
@property (nonatomic, strong) NSArray *dataSourceCoffeeNotes;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Fetch all datas of NSUserDefaults
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    NSLog(@"defualts:%@", defaultsDictionary);
    
    // Create Array for dataSource
    NSArray *allDataArray;
    for (NSString *key in [defaultsDictionary allKeys]) {
         allDataArray = [allDataArray arrayByAddingObject:key];
    }
    
    NSLog(@"allDataArray: %@", allDataArray);
    
    // Set values
    // self.dataSourceCoffeeNotes = allDataArray;
    self.dataSourceCoffeeNotes = @[@"Sample Note"];

    
    /*
    // To Delete All NSUserDefaults
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDictionary allKeys]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    */
}


- (IBAction)insertNewObject:(id)sender {
    // date for note
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]];
    [format setDateFormat:@"MM/dd(HH:mm)"];
    NSString *date = [format stringFromDate:[NSDate date]];
    NSLog(@"Date For Note: %@", date);

    // NSArray *array = @[@"HOUSE BLEND", @"Starbucks Coffee", @"comment", @"2014/09/08"];
    NSArray *array = @[date];
    
    // date for key
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-mm-ss"];
    NSString *dateLog = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"Date For Key: %@", dateLog);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:array forKey:dateLog];
    
    [defaults synchronize];
    // BOOL successful = [defaults synchronize];
    /*if (successful) {
        NSLog(@"%@", @"Successfully Data Saved");
    } else {
        NSLog(@"%@", @"Data NOT Saved");
    }*/
    
    
    
}

- (void)deleteObject {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"coffeeNote"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"Data Successfully Deleted");
    } else {
        NSLog(@"%@", @"Theres NO Data");
        return;
    }
    
    // データが削除されていることを確認する
    NSArray *array = [defaults arrayForKey:@"coffeeNote"];
    NSLog(@"%d:%@", successful, array);
    if (!array) {
        NSLog(@"%@", @"Data Successfully Deleted (Confirmed)");
    }
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
    
    dataCount = self.dataSourceCoffeeNotes.count;
    
    return dataCount;
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
    
    cell.textLabel.text = self.dataSourceCoffeeNotes[indexPath.row];

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Read datas
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"coffeeNote"];
    if (array) {
        for (NSString *data in array) {
            NSLog(@"%@", data);
        }
    } else {
        NSLog(@"%@", @"データが存在しません。");
    }
}

-(IBAction)returnTable:(UIStoryboardSegue *)segue {
}

/* Method to show detail page
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *sendtext = [NSString stringWithFormat:@"%ld行目", indexPath.row];
        [segue destinationViewController];
    }
    
}
 */

@end
