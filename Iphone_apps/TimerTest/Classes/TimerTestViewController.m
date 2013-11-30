//
//  TimerTestViewController.m
//  TimerTest
//
//  Created by picaudiopro on 8/2/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import "TimerTestViewController.h"

@implementation TimerTestViewController

@synthesize repeatTimer;
@synthesize unscheduledTimer;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		timerCount = 0;
    }
    return self;
}


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


- (NSDictionary *)userInfo {
	return [NSDictionary dictionaryWithObject:[NSDate date] forKey:@"StartDate"];
}

//
//	startOneTimeTimer
//	  指定時間経過後、一回のみ指定メソッドがコールされるタイマーを起動する。
//
- (IBAction)startOneTimeTimer:(id)sender {
	//  NSTimerクラスのクラスメッソッドをコールしてタイマーを起動します。
	[NSTimer
		scheduledTimerWithTimeInterval:2.0		//  タイマーの間隔を秒単位で指定
		target:self								//	第三引数で指定したメッセージの送付先オブジェクト名
		selector:@selector(eventOneTimeTimer:)	//	第一引数で指定した時間が経過した時に送付されるメッセージ名
		userInfo:[self userInfo]				//	タイマー起動中に参照するオブジェクト
		repeats:NO];							//	タイマーを継続して動作させるかどうかの指定
}

//
//	eventOneTimeTimer
//	  startOneTimeTimerで起動したタイマーの指定時間が経過したときにコールされるメソッド。
//
- (void)eventOneTimeTimer:(NSTimer*)theTimer {
	[timerCountLabel setText:@"time up"];		//	ラベルに"time up"と表示
}


//
//	startRepeatTimer
//	  指定時間経過後、連続して指定メソッドがコールされ、停止メッセージを受け付けるまで停止しないタイマーを起動する。
//
- (IBAction)startRepeatTimer:(id)sender {
	//  NSTimerクラスのクラスメッソッドをコールしてタイマーを起動します。
	NSTimer *timer =
	[NSTimer
		scheduledTimerWithTimeInterval:0.5		//  タイマーの間隔を秒単位で指定
		target:self								//	第三引数で指定したメッセージの送付先オブジェクト名
		selector:@selector(eventRepeatTimer:)	//	第一引数で指定した時間が経過した時に送付されるメッセージ名
		userInfo:[self userInfo]				//	タイマー起動中に参照するオブジェクト
		repeats:YES];							//	タイマーを継続して動作させるかどうかの指定
	
	self.repeatTimer = timer;
}

//
//	stopRepeatTimer
//	  startRepeatTimerで起動したタイマーを停止する。
//
- (IBAction)stopRepeatTimer:(id)sender {
	[repeatTimer invalidate];
	self.repeatTimer = nil;
}

//
//	eventRepeatTimer
//	  startRepeatTimerで起動したタイマーからコールされるメソッド。
//
- (void)eventRepeatTimer:(NSTimer*)theTimer {
	timerCount++;
	[timerCountLabel setText:[NSString stringWithFormat:@"%d",timerCount]];
}


//
//	startFireDateTimer
//	  指定時間経過後に開始するタイマーを起動する。
//    起動されたタイマーは、連続して指定メソッドがコールされ、停止メッセージを受け付けるまで停止しない。
//
- (IBAction)startFireDateTimer:(id)sender {
	//  現在の時刻から指定秒後の時刻を入手
	NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:3.0];

	NSTimer *timer = 
	[[NSTimer alloc]
		initWithFireDate:fireDate				//	タイマーが動作開始する日時を指定
		interval:0.5							//	タイマーの間隔を秒単位で指定
		target:self								//	第三引数で指定したメッセージの送付先オブジェクト名
		selector:@selector(eventFireDateTimer:)	//	第一引数で指定した時間が経過した時に送付されるメッセージ名
		userInfo:[self userInfo]				//	タイマー起動中に参照するオブジェクト
		repeats:YES];							//	タイマーを継続して動作させるかどうかの指定

	timerCount = 1;

	//	現在のRun Loopを取得し、上記で作成したタイマーをそのRun Loopに登録する。
	NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	[runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
	[timer release];
}

//
//	eventFireDateTimer
//	  startFireDateTimerで起動したタイマーからコールされるメソッド。
//	  指定回数コールされた後、タイマーを停止する。
//
- (void)eventFireDateTimer:(NSTimer*)theTimer {
	[timerCountLabel setText:[NSString stringWithFormat:@"%d",timerCount]];
	timerCount++;
	if (timerCount > 10) {
		[theTimer invalidate];
	}
}


//
//	createUnscheduledTimer
//	  指定時間経過後に開始するタイマーを起動する。
//    起動されたタイマーは、連続して指定メソッドがコールされ、停止メッセージを受け付けるまで停止しない。
//
- (IBAction)createUnscheduledTimer:(id)sender {
	//  タイマーがコールするメソッドの署名を作成
	NSMethodSignature *methodSignature = [self methodSignatureForSelector:@selector(eventUnscheduledTimer:)];

	//  作成したメソッドの署名をもとに、呼び出し情報を作成
	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
	[invocation setTarget:self];
	[invocation setSelector:@selector(eventUnscheduledTimer:)];

	//  タイマーからコールされるメソッドに渡す変数を呼び出し情報に登録する。
	NSDate *startDate = [NSDate date];
	[invocation setArgument:&startDate atIndex:2];

	//  作成した呼び出し情報からタイマーを作成する。
	NSTimer *timer = [NSTimer timerWithTimeInterval:0.5 invocation:invocation repeats:YES];
	self.unscheduledTimer = timer;
	
	timerCount = 0;
}


//
//	createUnscheduledTimer
//	  createUnscheduledTimerで作成したタイマーを起動する。
//
- (IBAction)startUnscheduledTimer:(id)sender {
	if (unscheduledTimer != nil) {
		//	現在のRun Loopを取得し、createUnscheduledTimerで作成したタイマーをそのRun Loopに登録する。
		NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
		[runLoop addTimer:unscheduledTimer forMode:NSDefaultRunLoopMode];
	}
}

//
//	stopUnscheduledTimer
//	  startUnscheduledTimerで起動したタイマーを停止する。
//
- (IBAction)stopUnscheduledTimer:(id)sender {
	[unscheduledTimer invalidate];
	self.unscheduledTimer = nil;
}

//
//	eventUnscheduledTimer
//	  startRepeatTimerで起動したタイマーからコールされるメソッド。
//
- (void)eventUnscheduledTimer:(NSDate *)date {
	timerCount++;
	[timerCountLabel setText:[NSString stringWithFormat:@"%@ %d",date,timerCount]];
}


@end
