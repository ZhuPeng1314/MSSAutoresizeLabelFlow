# MSSAutoresizeLabelFlow 
 ![](/path/to/img.jpg)

## Usage
* **Initilize** （Initilize the view using `MSSAutoresizeLabelFlowConfig` or default configuration.The block will be call back when you select the label.）
```objective-c
self.automaticallyAdjustsScrollViewInsets = NO;
MSSAutoresizeLabelFlowConfig *config = [MSSAutoresizeLabelFlowConfig shareConfig];
config.backgroundColor = [UIColor lightGrayColor];
config.textFont = [UIFont fontWithName:@"Times New Roman" size:15];
NSArray *array = @[@"Jose Mourinho",@"Robben",@"Robin Van Persie",@"Sneijder",@"Didier Drogba",@"Frank Lampard",@"Terry"];
self.flow = [[MSSAutoresizeLabelFlow alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 0) titles:array selectedHandler:^(NSUInteger index, NSString *title) {
    NSLog(@"%lu %@",index,title);
}];
[self.view addSubview:self.flow]; 
```
* **Insert**
```objective-c
[self.flow insertLabelWithTitle:@"Mourinho" atIndex:1 animated:YES];
```
```objective-c
NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
[set addIndex:1];
[set addIndex:3];
[self.flow insertLabelsWithTitles:@[@"Mourinho",@"Jose Mourinho"] atIndexes:set animated:YES];
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
NSArray *array = @[@"Petr Cech",@"Branislav Ivanovic",@"Carvalho",@"John Terry",@"Ashly Cole",@"Michael Essien",@"Frank Lampard",@"Michael Ballack",@"Joe Cole",@"Florent Malouda",@"Didier Drogba"];
[self.flow reloadAllWithTitles:array];
```
## License
The project is available under the MIT license.

