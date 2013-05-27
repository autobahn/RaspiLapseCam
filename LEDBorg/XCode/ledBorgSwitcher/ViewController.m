//
//  ViewController.m
//  ledBorgSwitcher
//
//  Created by James Moore on 22/05/2013.
//  Copyright (c) 2013 Fotosyn. All rights reserved.
//
//  PiBorg is a trading name and LedBorg is a product of Freeburn Robotics Limited,
//  Raspberry Pi is a trademark of the Raspberry Pi Foundation.

//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:

//  1. Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.>

//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//  The views and conclusions contained in the software and documentation are those
//  of the authors and should not be interpreted as representing official policies,
//  either expressed or implied, of the FreeBSD Project.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark Overview

// Just to get the Pragma Marks in tidy order
- (void) thisDoesNothing {
    NSLog(@"");
}

#pragma mark - 
#pragma mark Data to send to Raspberry Pi

// Set the Red Value in RGB Display Mode [0,1,2]
- (void) setRedVal:(id)sender {
    
    if ([[swatchRGBArray objectAtIndex:[sender tag]][0] floatValue] < 0.5) {
        redVal = 0;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][0] floatValue] == 0.5) {
        redVal = 1;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][0] floatValue] == 1.0) {
        redVal = 2;
    }
    [self updateLED];
    
}

// Set the Green Value in RGB Display Mode [0,1,2]
- (void) setGreenVal:(id)sender {
    
    if ([[swatchRGBArray objectAtIndex:[sender tag]][1] floatValue] < 0.5) {
        greenVal = 0;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][1] floatValue] == 0.5) {
        greenVal = 1;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][1] floatValue] == 1.0) {
        greenVal = 2;
    }
    [self updateLED];
    
}

// Set the Blue Value in RGB Display Mode [0,1,2]
- (void) setBlueVal:(id)sender {
    
    if ([[swatchRGBArray objectAtIndex:[sender tag]][2] floatValue] < 0.5) {
        blueVal = 0;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][2] floatValue] == 0.5) {
        blueVal = 1;
    } else if ([[swatchRGBArray objectAtIndex:[sender tag]][2] floatValue] == 1.0) {
        blueVal = 2;
    }
    [self updateLED];
    
}

// Set the colour of the LED in Swatch Mode using RGB [0,1,2]
- (void) setColor:(id)sender {
    
    if ([[swatchArray objectAtIndex:[sender tag]][0] floatValue] < 0.5) {
        redVal = 0;
    } else {
        if ([[swatchArray objectAtIndex:[sender tag]][0] floatValue] == 0.5) {
            redVal = 1;
        } else if ([[swatchArray objectAtIndex:[sender tag]][0] floatValue] == 1.0) {
            redVal = 2;
        }
    }
        
    if ([[swatchArray objectAtIndex:[sender tag]][1] floatValue] < 0.5) {
        greenVal = 0;
    } else {
        if ([[swatchArray objectAtIndex:[sender tag]][1] floatValue] == 0.5) {
            greenVal = 1;
        } else if ([[swatchArray objectAtIndex:[sender tag]][1] floatValue] == 1.0) {
            greenVal = 2;
        }
    }

    if ([[swatchArray objectAtIndex:[sender tag]][2] floatValue] < 0.5) {
        blueVal = 0;
    } else {
        if ([[swatchArray objectAtIndex:[sender tag]][2] floatValue] == 0.5) {
            blueVal = 1;
        } else if ([[swatchArray objectAtIndex:[sender tag]][2] floatValue] == 1.0) {
            blueVal = 2;
        }
    }
    
    NSLog(@"%d || %d -- %d -- %d",[sender tag], redVal,greenVal,blueVal);
    [self updateLED];
}



// Update the LED on changing swatch or RGB Values
// Please make sure you add ledborg.py to your Raspberry Pi, that you have python running
// and get your IP address using ifconfig in Terminal.

- (void) updateLED {
    
    NSString *passURL = [NSString stringWithFormat:@"http://%d.%d.%d.%d:%d/ledborg?red=%d&green=%d&blue=%d",settingsAddress1, settingsAddress2, settingsAddress3, settingsAddress4, settingsAddressPort,redVal,greenVal,blueVal];

    [statusView loadRequest:
     [NSURLRequest requestWithURL:
      [NSURL URLWithString:passURL
       ]]];
    
}

#pragma mark -
#pragma mark Palettes Setup and Handling

// Create the coloured swatches for RGB Palette
- (void) setUpRGBPalette {
    
    NSArray *red2 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *red1 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *red0 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *green2 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *green1 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *green0 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *blue2 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *blue1 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *blue0 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.2] , nil];
    
    swatchRGBArray = [[NSArray alloc] initWithObjects:red2,green2,blue2,red1,green1,blue1,red0,green0,blue0,nil];
    
    int swatchCount = [swatchRGBArray count];
    int swatchOffsetX = 0;
    int swatchOffsetY = 0;
    
    for( int i = 0; i <= (swatchCount-1); i++ ) {
        UIButton *swatch = [[UIButton alloc] initWithFrame:CGRectMake(((paletteWidth/3)*swatchOffsetX), ((paletteHeight/3)*swatchOffsetY), paletteWidth/3, paletteHeight/3)];
        [swatch setBackgroundColor:[UIColor colorWithRed:[[swatchRGBArray objectAtIndex:i][0] floatValue] green:[[swatchRGBArray objectAtIndex:i][1] floatValue] blue:[[swatchRGBArray objectAtIndex:i][2] floatValue] alpha:1.0]];
        [swatch setTag:i];
        
        if ([[swatchRGBArray objectAtIndex:i][0] floatValue] != 0.0) {
            [swatch addTarget:self action:@selector(setRedVal:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([[swatchRGBArray objectAtIndex:i][1] floatValue] != 0.0) {
            [swatch addTarget:self action:@selector(setGreenVal:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([[swatchRGBArray objectAtIndex:i][2] floatValue] != 0.0) {
            [swatch addTarget:self action:@selector(setBlueVal:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [paletteHolderRGB addSubview:swatch];
        
        if (swatchOffsetX < 2) {
            swatchOffsetX ++;
        } else {
            swatchOffsetX = 0;
            swatchOffsetY ++;
        }
        
    }
    
}

// Create the coloured swatches for Pre-Set Swatches Palette
- (void)setUpSwatchPalette {
    
    // Create a series of arrays each with the RGB values making up each swatch
    NSArray *swatch1 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch2 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch3 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch4 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch5 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch6 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch7 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch8 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch9 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch10 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch11 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch12 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch13 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch14 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch15 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch16 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch17 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch18 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch19 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch20 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0] , nil];
    NSArray *swatch21 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch22 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch23 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch24 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch25 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0] , nil];
    NSArray *swatch26 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.5] , nil];
    NSArray *swatch27 = [[NSArray alloc] initWithObjects: [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:1.0] , nil];
   
    // Bundle all the RGB values to create a series of swatches
    swatchArray = [[NSArray alloc] initWithObjects:
                            swatch1,swatch2,swatch3,swatch4,swatch5,swatch6,swatch7,swatch8,swatch9,swatch10,
                            swatch11,swatch12,swatch13,swatch14,swatch15,swatch16,swatch17,swatch18,swatch19,swatch20,
                            swatch21,swatch22,swatch23,swatch24,swatch25,swatch26,swatch27,nil];
    
    int swatchCount = [swatchArray count];
    int swatchOffsetX = 0;
    int swatchOffsetY = 0;

    
    for( int i = 0; i <= (swatchCount-1); i++ ) {
        UIButton *swatch = [[UIButton alloc] initWithFrame:CGRectMake(((paletteWidth/3)*swatchOffsetX), ((paletteHeight/9)*swatchOffsetY), paletteWidth/3, paletteHeight/9)];
        [swatch setBackgroundColor:[UIColor colorWithRed:[[swatchArray objectAtIndex:i][0] floatValue] green:[[swatchArray objectAtIndex:i][1] floatValue] blue:[[swatchArray objectAtIndex:i][2] floatValue] alpha:1.0]];
        [swatch setTag:i];
        
        [swatch addTarget:self action:@selector(setColor:) forControlEvents:UIControlEventTouchUpInside];
        [paletteHolderSwatches addSubview:swatch];
        
        NSLog(@"%f,%f,%f",[[swatchArray objectAtIndex:i][0] floatValue],[[swatchArray objectAtIndex:i][1] floatValue],[[swatchArray objectAtIndex:i][2] floatValue]);
        
        if (swatchOffsetX < 2) {
            swatchOffsetX ++;
        } else {
            swatchOffsetX = 0;
            swatchOffsetY ++;
        }
            
    }
    
}


// Flip the palletes when user selects either of the two toggle buttons
- (void)switchPalette:(id)sender {
    if (settingsVisible == 1) {
        settingsAddress1 = [address1.text integerValue];
        settingsAddress2 = [address2.text integerValue];
        settingsAddress3 = [address3.text integerValue];
        settingsAddress4 = [address4.text integerValue];
        settingsAddressPort = [addressPort.text integerValue];
        [self writeSettings];
        settingsVisible = 0;
    }
    paletteVal = [sender tag];
    if (paletteVal == 0) {
        settingsViewMode = 0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        paletteHolderRGB.frame = CGRectMake(0, paletteYValue, scrnWidth, paletteHeightValue);
        paletteHolderSwatches.frame = CGRectMake(scrnWidth, paletteYValue, scrnWidth, paletteHeightValue);
        [showRGB setAlpha:1.0];
        [showSwatches setAlpha:0.5];
        [showSettings setAlpha:0.5];
        [settingsView setAlpha:0.0];
        settingsVisible = 0;
        [UIView commitAnimations];
    } else {
        settingsViewMode = 1;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        paletteHolderRGB.frame = CGRectMake(0-scrnWidth, paletteYValue, scrnWidth, paletteHeightValue);
        paletteHolderSwatches.frame = CGRectMake(0, paletteYValue, scrnWidth, paletteHeightValue);
        [showRGB setAlpha:0.5];
        [showSwatches setAlpha:1.0];
        [showSettings setAlpha:0.5];
        [settingsView setAlpha:0.0];
        settingsVisible = 0;
        [UIView commitAnimations];
    }
    [self writeViewMode];
}


#pragma mark -
#pragma mark Setting Panel Setup and Handling

// Create the elements to display within Settings View
- (void) setUpSettingsView {

    int settingsFontSize = 0;
    int settingsAddressFontSize = 0;
    
    if ( [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad"] || [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad Simulator"] ) {
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, paletteWidth, scrnHeight-150)];
        
        UIView *guide = [[UIView alloc] initWithFrame:CGRectMake(0, 320, scrnWidth, 380)];
        UIWebView *instructionsPanel = [[UIWebView alloc] initWithFrame:CGRectMake(23, 30, scrnWidth-50, 500)];
        [instructionsPanel loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                                                        pathForResource:@"helpText" ofType:@"html"]isDirectory:NO]]];;
        instructionsPanel.delegate = self;
        [guide addSubview:instructionsPanel];
        [settingsView addSubview:guide];
        
        settingsFontSize = 25;
        settingsAddressFontSize = 65;
        
        addressField = [[UITextView alloc] initWithFrame:CGRectMake(23, 30, scrnWidth-40, 40)];
        address1 = [[UITextField alloc] initWithFrame:CGRectMake(23, 90, (scrnWidth/4)-50, 80)];
        address1Dot = [[UITextView alloc] initWithFrame:CGRectMake(address1.frame.origin.x+address1.frame.size.width+9, 90, 20, 80)];
        address2 = [[UITextField alloc] initWithFrame:CGRectMake(address1.frame.origin.x+(scrnWidth/4), 90, (scrnWidth/4)-50, 80)];
        address2Dot = [[UITextView alloc] initWithFrame:CGRectMake(address2.frame.origin.x+address2.frame.size.width+9, 90, 20, 80)];
        address3 = [[UITextField alloc] initWithFrame:CGRectMake(address2.frame.origin.x+(scrnWidth/4), 90, (scrnWidth/4)-50, 80)];
        address3Dot = [[UITextView alloc] initWithFrame:CGRectMake(address3.frame.origin.x+address3.frame.size.width+9, 90, 20, 80)];
        address4 = [[UITextField alloc] initWithFrame:CGRectMake(address3.frame.origin.x+(scrnWidth/4), 90, (scrnWidth/4)-50, 80)];
        portNumberField = [[UITextView alloc] initWithFrame:CGRectMake(23, 200, scrnWidth-40, 120)];
        addressPort = [[UITextField alloc] initWithFrame:CGRectMake(scrnWidth-((scrnWidth/3)+27), 200, (scrnWidth/3), 80)];
        portNumberField.text = @"Insert the port number your Raspberry \nPi is listening on (Default is 8000)";
        
    } else {
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paletteWidth, scrnHeight-70)];
        
        UIView *guide = [[UIView alloc] initWithFrame:CGRectMake(0, 185, scrnWidth, 200)];
        UIWebView *instructionsPanel = [[UIWebView alloc] initWithFrame:CGRectMake(0, 30, scrnWidth, (scrnHeight-300))];
        [instructionsPanel loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                                                            pathForResource:@"helpText" ofType:@"html"]isDirectory:NO]]];;
        instructionsPanel.delegate = self;
        [guide addSubview:instructionsPanel];
        [settingsView addSubview:guide];
        
        settingsFontSize = 18;
        settingsAddressFontSize = 18;
        
        addressField = [[UITextView alloc] initWithFrame:CGRectMake(20, 10, scrnWidth-40, 40)];
        address1 = [[UITextField alloc] initWithFrame:CGRectMake(23, 50, 60, 30)];
        address1Dot = [[UITextView alloc] initWithFrame:CGRectMake(78, 50, 20, 80)];
        address2 = [[UITextField alloc] initWithFrame:CGRectMake(address1.frame.origin.x+70, 50, 60, 30)];
        address2Dot = [[UITextView alloc] initWithFrame:CGRectMake(address2.frame.origin.x+55, 50, 20, 80)];
        address3 = [[UITextField alloc] initWithFrame:CGRectMake(address2.frame.origin.x+70, 50, 60, 30)];
        address3Dot = [[UITextView alloc] initWithFrame:CGRectMake(address3.frame.origin.x+55, 50, 20, 80)];
        address4 = [[UITextField alloc] initWithFrame:CGRectMake(address3.frame.origin.x+70, 50, 60, 30)];
        portNumberField = [[UITextView alloc] initWithFrame:CGRectMake(20, 85, scrnWidth-40, 120)];
        addressPort = [[UITextField alloc] initWithFrame:CGRectMake(scrnWidth-((scrnWidth/3)+27), 150, (scrnWidth/3), 30)];
        portNumberField.text = @"Insert the port number your Raspberry Pi is listening on\n(Default is 8000)";
        
    }
    
    [settingsView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
    [settingsView setAlpha:0.0];
    
    UIView *inputFields = [[UIView alloc] initWithFrame:CGRectMake(0, 20, scrnWidth, 250)];
    
    
    addressField.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsFontSize];
    addressField.textColor  = [UIColor whiteColor];
    addressField.backgroundColor = [UIColor clearColor];
    addressField.text = @"IP Address of your Raspberry Pi";
    addressField.editable = FALSE;
    addressField.userInteractionEnabled = FALSE;
    [inputFields addSubview:addressField];
    
    
    address1.borderStyle = UITextBorderStyleRoundedRect;
    address1.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address1.autocorrectionType = UITextAutocorrectionTypeNo;
    address1.keyboardType = UIKeyboardTypePhonePad;
    address1.textAlignment = UITextAlignmentCenter;
    address1.text = [NSString stringWithFormat:@"%d", settingsAddress1];
    [inputFields addSubview:address1];
    
    
    address1Dot.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address1Dot.textColor  = [UIColor whiteColor];
    address1Dot.backgroundColor = [UIColor clearColor];
    address1Dot.text = @".";
    address1Dot.editable = FALSE;
    address1Dot.userInteractionEnabled = FALSE;
    [inputFields addSubview:address1Dot];
    
    
    address2.borderStyle = UITextBorderStyleRoundedRect;
    address2.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address2.autocorrectionType = UITextAutocorrectionTypeNo;
    address2.keyboardType = UIKeyboardTypePhonePad;
    address2.textAlignment = UITextAlignmentCenter;
    address2.text = [NSString stringWithFormat:@"%d", settingsAddress2];
    [inputFields addSubview:address2];
    
    
    address2Dot.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address2Dot.textColor  = [UIColor whiteColor];
    address2Dot.backgroundColor = [UIColor clearColor];
    address2Dot.text = @".";
    address2Dot.editable = FALSE;
    address2Dot.userInteractionEnabled = FALSE;
    [inputFields addSubview:address2Dot];
    
    
    address3.borderStyle = UITextBorderStyleRoundedRect;
    address3.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address3.autocorrectionType = UITextAutocorrectionTypeNo;
    address3.keyboardType = UIKeyboardTypePhonePad;
    address3.textAlignment = UITextAlignmentCenter;
    address3.text = [NSString stringWithFormat:@"%d", settingsAddress3];
    [inputFields addSubview:address3];
    
    
    address3Dot.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address3Dot.textColor  = [UIColor whiteColor];
    address3Dot.backgroundColor = [UIColor clearColor];
    address3Dot.text = @".";
    address3Dot.editable = FALSE;
    address3Dot.userInteractionEnabled = FALSE;
    [inputFields addSubview:address3Dot];
    
    
    address4.borderStyle = UITextBorderStyleRoundedRect;
    address4.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    address4.autocorrectionType = UITextAutocorrectionTypeNo;
    address4.keyboardType = UIKeyboardTypePhonePad;
    address4.textAlignment = UITextAlignmentCenter;
    address4.text = [NSString stringWithFormat:@"%d", settingsAddress4];
    [inputFields addSubview:address4];
    
    
    portNumberField.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsFontSize];
    portNumberField.textColor  = [UIColor whiteColor];
    portNumberField.backgroundColor = [UIColor clearColor];
    portNumberField.editable = FALSE;
    portNumberField.userInteractionEnabled = FALSE;
    [inputFields addSubview:portNumberField];
    
    
    addressPort.borderStyle = UITextBorderStyleRoundedRect;
    addressPort.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:settingsAddressFontSize];
    addressPort.autocorrectionType = UITextAutocorrectionTypeNo;
    addressPort.keyboardType = UIKeyboardTypePhonePad;
    addressPort.textAlignment = UITextAlignmentCenter;
    addressPort.text = [NSString stringWithFormat:@"%d", settingsAddressPort];
    [inputFields addSubview:addressPort];
    
    [settingsView addSubview:inputFields];
    
}

// If the user selects Settings button, show overlay with Settings Panel.
- (void)showSettingsPanel {
    if (settingsVisible == 0) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [showRGB setAlpha:0.5];
        [showSwatches setAlpha:0.5];
        [showSettings setAlpha:1.0];
        [settingsView setAlpha:1.0];
        [UIView commitAnimations];
        settingsVisible = 1;
    } else {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        if (paletteVal == 0) {
            [showRGB setAlpha:1.0];
            [showSwatches setAlpha:0.5];
        } else {
            [showRGB setAlpha:0.5];
            [showSwatches setAlpha:1.0];
        }
        [showSettings setAlpha:0.5];
        [settingsView setAlpha:0.0];
        [UIView commitAnimations];
        settingsAddress1 = [address1.text integerValue];
        settingsAddress2 = [address2.text integerValue];
        settingsAddress3 = [address3.text integerValue];
        settingsAddress4 = [address4.text integerValue];
        settingsAddressPort = [addressPort.text integerValue];
        [self writeSettings];
    }
}


#pragma mark -
#pragma mark Generic Application Tasks

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    statusView = [[UIWebView alloc] init];
    scrnWidth = [UIScreen mainScreen].bounds.size.width;
    scrnHeight = [UIScreen mainScreen].bounds.size.height;
    settingsVisible = 0;

    [self initSettings];
    [self readSettings];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    if ( [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad"] || [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad Simulator"] ) {
        paletteYValue = 100;
        paletteHeightValue = scrnHeight-200;
    } else {
        paletteYValue = 0;
        paletteHeightValue = scrnHeight-80;
    }
    
    paletteHolderRGB = [[UIView alloc] initWithFrame:CGRectMake(0.0, paletteYValue, scrnWidth, paletteHeightValue)];
    [paletteHolderRGB setBackgroundColor:[UIColor clearColor]];
    
    paletteWidth = paletteHolderRGB.frame.size.width;
    paletteHeight = paletteHolderRGB.frame.size.height;
    
    paletteHolderSwatches = [[UIView alloc] initWithFrame:CGRectMake(scrnWidth, paletteYValue, scrnWidth, paletteHeightValue)];
    [paletteHolderSwatches setBackgroundColor:[UIColor clearColor]];
    
    if ( [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad"] || [(NSString*)[UIDevice currentDevice].model isEqualToString:@"iPad Simulator"] ) {

        showRGB = [[UIButton alloc] initWithFrame:CGRectMake((scrnWidth/2)-100, 20, 68, 50)];
        [showRGB setBackgroundImage:[UIImage imageNamed:@"iconRGB.png"] forState:UIControlStateNormal];
        [showRGB setTag:0];
        [showRGB addTarget:self action:@selector(switchPalette:) forControlEvents:UIControlEventTouchUpInside];
        [showRGB setAlpha:0.5];
        [self.view addSubview:showRGB];
        
        showSwatches = [[UIButton alloc] initWithFrame:CGRectMake((scrnWidth/2)+20, 20, 68, 50)];
        [showSwatches setBackgroundImage:[UIImage imageNamed:@"iconSwatches.png"] forState:UIControlStateNormal];
        [showSwatches setTag:1];
        [showSwatches addTarget:self action:@selector(switchPalette:) forControlEvents:UIControlEventTouchUpInside];
        [showSwatches setAlpha:0.5];
        [self.view addSubview:showSwatches];
        
        showSettings = [[UIButton alloc] initWithFrame:CGRectMake((scrnWidth/2)-25, scrnHeight-75, 50, 50)];
        [showSettings setBackgroundImage:[UIImage imageNamed:@"iconSettings.png"] forState:UIControlStateNormal];
        [showSettings setTag:0];
        [showSettings addTarget:self action:@selector(showSettingsPanel) forControlEvents:UIControlEventTouchUpInside];
        [showSettings setAlpha:0.5];
        [self.view addSubview:showSettings];
        
    } else {
        
        showRGB = [[UIButton alloc] initWithFrame:CGRectMake(18, scrnHeight-60, 68, 50)];
        [showRGB setBackgroundImage:[UIImage imageNamed:@"iconRGB.png"] forState:UIControlStateNormal];
        [showRGB setTag:0];
        [showRGB addTarget:self action:@selector(switchPalette:) forControlEvents:UIControlEventTouchUpInside];
        [showRGB setAlpha:0.5];
        [self.view addSubview:showRGB];
        
        showSwatches = [[UIButton alloc] initWithFrame:CGRectMake(124, scrnHeight-60, 68, 50)];
        [showSwatches setBackgroundImage:[UIImage imageNamed:@"iconSwatches.png"] forState:UIControlStateNormal];
        [showSwatches setTag:1];
        [showSwatches addTarget:self action:@selector(switchPalette:) forControlEvents:UIControlEventTouchUpInside];
        [showSwatches setAlpha:0.5];
        [self.view addSubview:showSwatches];
        
        showSettings = [[UIButton alloc] initWithFrame:CGRectMake(240, scrnHeight-60, 50, 50)];
        [showSettings setBackgroundImage:[UIImage imageNamed:@"iconSettings.png"] forState:UIControlStateNormal];
        [showSettings setTag:0];
        [showSettings addTarget:self action:@selector(showSettingsPanel) forControlEvents:UIControlEventTouchUpInside];
        [showSettings setAlpha:0.5];
        [self.view addSubview:showSettings];
    }
    
    [self setUpSettingsView];
    [self setUpRGBPalette];
    [self setUpSwatchPalette];
    
    paletteVal = settingsViewMode;
    
    if (paletteVal == 0) {
        paletteHolderRGB.frame = CGRectMake(0, paletteYValue, scrnWidth, paletteHeightValue);
        paletteHolderSwatches.frame = CGRectMake(scrnWidth, paletteYValue, scrnWidth, paletteHeightValue);
        [showRGB setAlpha:1.0];
        [showSwatches setAlpha:0.5];
    } else {
        paletteHolderRGB.frame = CGRectMake(0-scrnWidth, paletteYValue, scrnWidth, paletteHeightValue);
        paletteHolderSwatches.frame = CGRectMake(0, paletteYValue, scrnWidth, paletteHeightValue);
        [showRGB setAlpha:0.5];
        [showSwatches setAlpha:1.0];
    }

    [self.view addSubview:paletteHolderRGB];
    [self.view addSubview:paletteHolderSwatches];
    [self.view addSubview:settingsView];
    
}

- (BOOL)shouldAutorotate; {
    return NO;
}

// Flip to Safari on URL click rather than opening in UIWebView
-(BOOL) webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
    if ( inType == UIWebViewNavigationTypeLinkClicked ) {
        [[UIApplication sharedApplication] openURL:[inRequest URL]];
        return NO;
    }
    
    return YES;
}

// If user taps screen remove any pop-over keypads or keyboards
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [address1 resignFirstResponder];
    [address2 resignFirstResponder];
    [address3 resignFirstResponder];
    [address4 resignFirstResponder];
    [addressPort resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Data Handling

// Create App Settings Plist from master (if non-existent)
- (void)initSettings {
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    path = [documentsDirectory stringByAppendingPathComponent:@"ledborgSettings.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path]) {
        
        settingsAvailable = 0;
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"appSettings" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:path error:&error];
        
    } else {
        
        settingsAvailable = 1;
        
    }
}

// Read from Plist to populate app settings on launch
- (void)readSettings {
    
    NSMutableDictionary *savedData = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    NSLog(@"SAVED: %@\n", savedData);
    NSLog(@"PATH: %@\n", path);
    
    settingsBatch = [savedData allKeys];
    settingsViewMode = [[savedData objectForKey:@"viewMode"] integerValue];
    settingsAddress1 = [[savedData valueForKey:@"addr1"] integerValue];
    settingsAddress2 = [[savedData valueForKey:@"addr2"] integerValue];
    settingsAddress3 = [[savedData valueForKey:@"addr3"] integerValue];
    settingsAddress4 = [[savedData valueForKey:@"addr4"] integerValue];
    settingsAddressPort = [[savedData valueForKey:@"addrPort"] integerValue];
    
    NSLog(@"View Mode: %d\n", settingsViewMode);
    NSLog(@"IP Address: %d.%d.%d.%d:%d\n", settingsAddress1,settingsAddress2,settingsAddress3,settingsAddress4,settingsAddressPort);
    
}

// Update Plist settings for IP Address data
- (void)writeSettings {
    
    settingsVisible = 0;
    NSLog(@"PATH: %@\n", path);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathway = [documentsDirectory stringByAppendingPathComponent:@"ledborgSettings.plist"];
    
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithContentsOfFile:pathway];
    
    [rootDict setValue:[NSNumber numberWithInt:settingsAddress1] forKey:@"addr1"];
    [rootDict setValue:[NSNumber numberWithInt:settingsAddress2] forKey:@"addr2"];
    [rootDict setValue:[NSNumber numberWithInt:settingsAddress3] forKey:@"addr3"];
    [rootDict setValue:[NSNumber numberWithInt:settingsAddress4] forKey:@"addr4"];
    [rootDict setValue:[NSNumber numberWithInt:settingsAddressPort] forKey:@"addrPort"];
    [rootDict writeToFile:pathway atomically:YES];
    
}

// Update Plist settings for View Mode (RGB or Swatches)
- (void)writeViewMode {
    
    NSLog(@"PATH: %@\n", path);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathway = [documentsDirectory stringByAppendingPathComponent:@"ledborgSettings.plist"];
    
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithContentsOfFile:pathway];
    
    [rootDict setValue:[NSNumber numberWithInt:settingsViewMode] forKey:@"viewMode"];
    [rootDict writeToFile:pathway atomically:YES];
    
}


@end
