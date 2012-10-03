//
//  ViewController.m
//  tic-tac-toe
//
//  Created by Peter IJlst on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@end

@implementation GameController
@synthesize turnMessage;
@synthesize isTurn;
@synthesize winMessage;
@synthesize a1, a2, a3, b1, b2, b3, c1, c2, c3;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.isTurn = TRUE; // X starts
	self.turnMessage.text = @"Turn: X";
	self.navigationItem.hidesBackButton = TRUE;	
}

- (void)viewDidUnload
{
	[self setTurnMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// if the destination view controller has the method setWinScreen
	// call it with NSString winMessage
    if ([segue.destinationViewController respondsToSelector:@selector(setWinScreen:)]) {
        [segue.destinationViewController performSelector:@selector(setWinScreen:)
                                              withObject:self.winMessage];
    }
}

- (void)checkWin{
	
	// check rows, columns, diagonals
	// untill one contains three X or O
	// or every 'box' is 'checked'
	
	//h1
	BOOL win = FALSE;
	
	if(self.a1.currentTitle && self.a1.currentTitle == self.a2.currentTitle && self.a2.currentTitle == self.a3.currentTitle){
		win = TRUE;
		self.winMessage = self.a1.currentTitle;
	}
	//h2
	else if(self.b1.currentTitle && self.b1.currentTitle == self.b2.currentTitle && self.b2.currentTitle == self.b3.currentTitle){
		win = TRUE;
		self.winMessage = self.b1.currentTitle;
	}
	//h3
	else if(self.c1.currentTitle && self.c1.currentTitle == self.c2.currentTitle && self.c2.currentTitle == self.c3.currentTitle){
		win = TRUE;
		self.winMessage = self.c1.currentTitle;
	}
	//v1
	else if(self.a1.currentTitle && self.a1.currentTitle == self.b1.currentTitle && self.b1.currentTitle == self.c1.currentTitle){
		win = TRUE;
		self.winMessage = self.a1.currentTitle;
	}
	//v2
	else if(self.a2.currentTitle && self.a2.currentTitle == self.b2.currentTitle && self.b2.currentTitle == self.c2.currentTitle){
		win = TRUE;
		self.winMessage = self.a2.currentTitle;
	}
	//v3
	else if(self.a3.currentTitle && self.a3.currentTitle == self.b3.currentTitle && self.b3.currentTitle == self.c3.currentTitle){
		win = TRUE;
		self.winMessage = self.a3.currentTitle;
	}
	//d1
	else if(self.a1.currentTitle && self.a1.currentTitle == self.b2.currentTitle && self.b2.currentTitle == self.c3.currentTitle){
		win = TRUE;
		self.winMessage = self.a1.currentTitle;
	}
	//d2
	else if(self.a3.currentTitle && self.a3.currentTitle == self.b2.currentTitle && self.b2.currentTitle == self.c1.currentTitle){
		win = TRUE;
		self.winMessage = self.a3.currentTitle;
	}
	
	//all boxes checked, and no win
	else if(win == FALSE && self.a1.currentTitle  && self.a2.currentTitle && self.a3.currentTitle  && self.b1.currentTitle && self.b2.currentTitle  && self.b3.currentTitle && self.c1.currentTitle && self.c2.currentTitle && self.c3.currentTitle){
		win = TRUE;
		self.winMessage = @"It's a tie!";
	}
	
	//go winscreen
	if(win){
		[self performSegueWithIdentifier:@"gameover" sender:self];
	}
}

- (IBAction)Quit:(id)sender {
	exit(0);
}


- (IBAction)btnPressed:(id)sender {
	
	// Handle button action
	// set x or o as button title, depending on isTurn BOOL value
	// determine x or o to set by isTurn bool (no multiplayer without deployment to app store)
	
	// get button instance
	UIButton *btn = (UIButton *)sender;
	
	// valid move
	if(btn.currentTitle != @"x" && btn.currentTitle != @"o"){
		
		//player 1 turn
		if(self.isTurn == TRUE){ 
			[btn setTitle:@"x" forState:normal];
			self.isTurn = FALSE;
			self.turnMessage.text = @"Turn: o";
		}
		
		//player 2 turn
		else if(self.isTurn == FALSE){ 
			[btn setTitle:@"o" forState:normal];
			self.isTurn = TRUE;
			self.turnMessage.text = @"Turn: x";
		}
		
		// error
		else{
			NSLog(@"BOOL isTurn has no value");
		}
	}
	
	// invalid move
	else{
		NSLog(@"currentTitle already has a value");
	}
	
	// check win requirements
	[self checkWin];
}


@end
