//
//  ViewController.m
//  BluetoothSwitch
//
//  Created by Yanase Yuji on 2016/06/09.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)buttonOn:(id)sender;
- (IBAction)buttonOFF:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonOn:(id)sender {
    [self bluetoothSwitch:YES];
}

- (IBAction)buttonOFF:(id)sender {
    [self bluetoothSwitch:NO];
}

#pragma mark - Bluetooth Switch
- (void)bluetoothSwitch:(BOOL)flagSwitch {
    NSBundle *b = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/BluetoothManager.framework"];
    BOOL success = [b load];

    if (success) {
        Class BTDeviceSupport = NSClassFromString(@"BluetoothManager");
        id si = [BTDeviceSupport valueForKey:@"sharedInstance"];
        [si setEnabled:flagSwitch];
    }
}

@end
