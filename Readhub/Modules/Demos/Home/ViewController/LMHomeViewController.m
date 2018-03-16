//
//  LMHomeViewController.m
//  Readhub
//
//  Created by limo on 2018/3/14.
//  Copyright © 2018年 Limo. All rights reserved.
//

#import "LMHomeViewController.h"

#import "APITopic.h"
#import "LMTopicModel.h"

@interface LMHomeViewController ()

@property (nonatomic, strong) APITopic *apiTopic;


@end

@implementation LMHomeViewController

#pragma mark - Life cycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];


}


#pragma mark - UITableViewDelegate (代理协议)

#pragma mark - LMFootViewButtonDelegate(代理协议)

#pragma mark - IBActions(event response)

#pragma mark - Private Methods


#pragma mark - Getter and Setter

- (APITopic *)apiTopic {
    if (_apiTopic == nil) {
        _apiTopic = [[APITopic alloc] init];
    }
    return _apiTopic;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
