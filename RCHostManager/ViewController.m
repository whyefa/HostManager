//
//  ViewController.m
//  dada
//
//  Created by dow-np-162 on 2018/8/8.
//  Copyright © 2018年 dow. All rights reserved.
//

#import "ViewController.h"

#import "HostManager.h"
#

@interface ViewController ()<UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, copy)  NSArray *hosts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Host \n %@", HostManager.apiServer);

}

- (IBAction)clicked:(id)sender {
    [self.view addSubview:self.picker];
    [self.picker reloadComponent:0];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.hosts.count;
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.hosts[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *hostName = self.hosts[row];
    [HostManager changeToHost:hostName];
    NSLog(@"\n %@", HostManager.apiServer);
}

- (UIPickerView *)picker {
    if (!_picker) {
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 200)];
        _picker.delegate = self;
    }
    return _picker;
}

- (NSArray *)hosts {
    if (!_hosts) {
        _hosts = [HostManager hosts];
    }
    return _hosts;
}

@end
