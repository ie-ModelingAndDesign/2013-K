//
//  Chose.m
//  Timer-Count
//
//  Created by たかひろ　あふそ on 2014/01/23.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import "Chose.h"
#import "ViewController.h"

@interface Chose ()
    
@end

@implementation Chose

- (void)viewDidLoad
{
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
}
    
- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        ViewController *no = [segue destinationViewController];
        if ([[segue identifier] isEqualToString:@"button1"]){
            no.button_no = 1;
        }else if ([[segue identifier] isEqualToString:@"button2"]){
            no.button_no = 2;
        }else if ([[segue identifier] isEqualToString:@"button3"]){
            no.button_no = 3;
        }
    }
    
@end
