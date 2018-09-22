//
//  ViewController.h
//  TitleBar
//
//  Created by Анюта on 25.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    IBOutlet NSTableView* tableView;
    NSMutableArray* arrayOfButton;
    long amountOfRows;
}



@end

