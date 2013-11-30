//
//  AlertViewViewController.m
//  AlertView
//
//  Created by picaudiopro on 9/13/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import "AlertViewViewController.h"

@implementation AlertViewViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


//
//  Open1SelectionPress
//    OKとCancelボタンがある一般的なAlert Viewを表示する。
//
- (IBAction)Open1SelectionPress:(id)sender {

	// Alert View のタイトル: "Regular Alert"
	// Alert View の詳細説明表示: なし
	// Cancelボタンのタイトル: "Cancel"
	// １つ目のボタンのタイトル: "OK"
	UIAlertView *alertView = [[UIAlertView alloc]
							  initWithTitle:@"Regular Alert"
							  message:@""
							  delegate:self
							  cancelButtonTitle:@"Cancel"
							  otherButtonTitles:@"OK", nil];

	// Alert View を表示する
	[alertView show];
	[alertView release];
	
}


//
//  Open2SelectionPress
//    3つボタンがあるAlert Viewを表示する。
//
- (IBAction)Open2SelectionPress:(id)sender {

	// Alert View のタイトル: "Regular Alert"
	// Alert View の詳細説明表示: なし
	// Cancelボタンのタイトル: "Cancel"
	// １つ目のボタンのタイトル: "Retry"
	UIAlertView *alertView = [[UIAlertView alloc]
							  initWithTitle:@"3 Button Alert"
							  message:@""
							  delegate:self
							  cancelButtonTitle:@"Cancel"
							  otherButtonTitles:@"Retry", nil];
	
	// ２つ目のボタンとして、タイトルが "Ignore" というボタンを追加
	[alertView addButtonWithTitle:@"Ignore"];

	// Alert View を表示する
	[alertView show];
	[alertView release];
	
}


//
//  Open2SelectionPress
//    ４つボタンがあるAlert Viewを表示する。
//
- (IBAction)Open3SelectionPress:(id)sender {

	// Alert View のタイトル: "Regular Alert"
	// Alert View の詳細説明表示: なし
	// Cancelボタンのタイトル: "Cancel"
	// １つ目のボタンのタイトル: "Select 1"
	// ２つ目のボタンのタイトル: "Select 2"
	// ３つ目のボタンのタイトル: "Select 3"
	UIAlertView *alertView = [[UIAlertView alloc]
							  initWithTitle:@"4 Button Alert"
							  message:@""
							  delegate:self
							  cancelButtonTitle:@"Cancel"
							  otherButtonTitles:@"Select 1", @"Select 2", @"Select 3", nil];
	
	// Alert View を表示する
	[alertView show];
	[alertView release];
	
}

//
//  alertView
//    Alert View のボタンが押されると呼び出されるメソッド
//    UIAlertViewDelegate のメソッド
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

	// 押されたボタンが Cancelボタンかどうかチェック
	if ([alertView cancelButtonIndex] == buttonIndex) {
		return;
	}
	
	// 押されたボタンのある Alert View のタイトルを alert label に表示
	alertLabel.text = [alertView title];

	// 押されたボタンのタイトルを select label に表示
	selectLabel.text = [alertView buttonTitleAtIndex:buttonIndex];
}

@end
