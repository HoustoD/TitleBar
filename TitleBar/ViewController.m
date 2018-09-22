//
//  ViewController.m
//  TitleBar
//
//  Created by Анюта on 25.08.18.
//  Copyright © 2018 Roman. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayOfButton = [[NSMutableArray alloc]init];
    amountOfRows = 0;
    
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 6;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if( [tableColumn.identifier isEqualToString:@"existFile"] )
    {
        NSArray *subviews = cellView.subviews;
        NSButton *checkbox = [subviews objectAtIndex:1];
        cellView.textField.stringValue = @"checkbox";
        
        if (row == 1) {
            [checkbox setState:1];
        } else {
            [checkbox setState:0];
        }
        return cellView;
    }
    return cellView;
}
- (IBAction)PushButton:(id)sender
{
    amountOfRows++;

    NSButtonCell* newButton = [[NSButtonCell alloc]init];
    
    [newButton setTitle:@"Pisos"];
    
    [arrayOfButton addObject:newButton];
    
    [tableView reloadData];

}

-(void)awakeFromNib {
    
    //Start from bottom left corner
    
    int x = 0; //possition x
    int y = 0; //possition y
    
    int width = 130;
    int height = 40;
    
    /*NSButton *myButton = [[NSButton alloc] initWithFrame:NSMakeRect(x, y, width, height)];
    //[[self.window contentView] addSubview: myButton];
    
    
    
    [myButton setTitle: @"Button title!"];
    [myButton setButtonType:NSMomentaryLightButton]; //Set what type button You want
    [myButton setBezelStyle:NSRoundedBezelStyle]; //Set what style You want
    
    [myButton setTarget:self];
    [myButton setAction:@selector(buttonPressed)];
    
    [self.view addSubview:myButton];
    
    for(int i = 0; i < 25; ++i)
    {
        NSButton *myButton = [[NSButton alloc] initWithFrame:NSMakeRect(x, y, width, height)];
        [myButton setTitle: @"Button title!"];
        
        [self.view addSubview:myButton];
        
        //self.view add
    }*/
}

-(void)buttonPressed {
    NSLog(@"Button pressed!");
    
    //Do what You want here...
}

@end
