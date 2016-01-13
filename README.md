# MSSAutoresizeLabelFlow 
![](https://raw.githubusercontent.com/immrss/MSSAutoresizeLabelFlow/master/DemoGif.gif)

## Usage
* **Initilize** （Initilize the view using `MSSAutoresizeLabelFlowConfig` or default configuration.The block will be call back when you select the label.）
```objective-c
self.automaticallyAdjustsScrollViewInsets = NO;
MSSAutoresizeLabelFlowConfig *config = [MSSAutoresizeLabelFlowConfig shareConfig];
config.backgroundColor = [UIColor lightGrayColor];
config.textFont = [UIFont fontWithName:@"Times New Roman" size:15];
NSArray *array = @[@"Adele",@"Alicia Keys",@"Ariana Grande",@"Avril Lavigne",@"Beyoncé",@"Britney Spears",@"Celine Dion",@"Katy Perry",@"Rihanna"];
self.flow = [[MSSAutoresizeLabelFlow alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 0) titles:array selectedHandler:^(NSUInteger index, NSString *title) {
    NSLog(@"%lu %@",index,title);
}];
[self.view addSubview:self.flow]; 
```
* **Insert**
```objective-c
[self.flow insertLabelWithTitle:@"Taylor Swift" atIndex:1 animated:YES];
```
```objective-c
NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
[set addIndex:1];
[set addIndex:3];
[self.flow insertLabelsWithTitles:@[@"Taylor Swift",@"Lana Del Rey"] atIndexes:set animated:YES];
```
* **Delete**
```objective-c
[self.flow deleteLabelAtIndex:1 animated:YES];
```
```objective-c
NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
[set addIndex:1];
[set addIndex:3];
[self.flow deleteLabelsAtIndexes:set animated:YES];
```
* **Reload**
```objective-c
NSArray *array = @[@"Akon",@"Bob Dylan",@"Chris Brown",@"Eminem",@"James Blunt",@"Jason Mraz",@"Jay-Z",@"John Lennon",@"Justin Timberlake",@"Robbie Williams",@"Sam Smith",@"Usher",@"Justin Bieber"];
[self.flow reloadAllWithTitles:array];
```
## License
The project is available under the MIT license.

