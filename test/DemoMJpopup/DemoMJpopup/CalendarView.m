
#import "CalendarView.h"
#import "ColorUtils.h"

@interface CalendarView()

{
    
    NSCalendar *gregorian;
    NSInteger _selectedMonth;
    NSInteger _selectedYear;
}

@end
@implementation CalendarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
        swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipeleft];
        UISwipeGestureRecognizer * swipeRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
        swipeRight.direction=UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipeRight];
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.size.height-100, self.bounds.size.width, 44)];
//        [label setBackgroundColor:[ColorUtils defaultOrderColor]];
//        [label setTextColor:[UIColor whiteColor]];
//        [label setText:@"swipe to change months"];
//        label.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:label];
//        [UILabel beginAnimations:NULL context:nil];
//        [UILabel setAnimationDuration:2.0];
//        [label setAlpha:0];
//        [UILabel commitAnimations];

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    [self setCalendarParameters];
//    _weekNames = @[@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa",@"Su"];
    _weekNames = self.weekName;
    NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
//    _selectedDate  =components.day;
    components.day = 1;
    NSDate *firstDayOfMonth = [gregorian dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:firstDayOfMonth];
    int weekday = (int)[comps weekday];
//      NSLog(@"components%d %d %d",_selectedDate,_selectedMonth,_selectedYear);
    weekday  = weekday - 2;
    
    if(weekday < 0)
        weekday += 7;
    
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:self.calendarDate];
    
    int columns = 7;
    int width = 40;
    int originX = 20;
    int originY = 60;
    NSInteger monthLength = days.length;
    
    UILabel *titleText = [[UILabel alloc]initWithFrame:CGRectMake(0,20, self.bounds.size.width, 40)];
    titleText.textAlignment = NSTextAlignmentCenter;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[NSLocale systemLocale]];

    [format setDateFormat:[NSString stringWithFormat:@"M%@ yyyy",self.month]];
    
    NSString *dateString = [[format stringFromDate:self.calendarDate] uppercaseString];
    [titleText setText:dateString];
//    [titleText setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f]];
    [titleText setTextColor:[ColorUtils defaultOrderColor]];
    [self addSubview:titleText];
    
    // previous
    UIButton *btnP = [[UIButton alloc] initWithFrame:CGRectMake(originX, 20, 70, 40)];
    btnP.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btnP setTitle:@"◀︎" forState:UIControlStateNormal];
    [btnP setTitleColor:[ColorUtils defaultOrderColor] forState:UIControlStateNormal];
    [btnP addTarget:self action:@selector(swiperight:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnP];
    
    // next
    UIButton *btnN = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - originX - 70, 20, 70, 40)];
    btnN.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btnN setTitle:@"▶︎" forState:UIControlStateNormal];
    [btnN setTitleColor:[ColorUtils defaultOrderColor] forState:UIControlStateNormal];
    [btnN addTarget:self action:@selector(swipeleft:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnN];
    
    for (int i =0; i<_weekNames.count; i++) {
        UIButton *weekNameLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        weekNameLabel.titleLabel.text = [_weekNames objectAtIndex:i];
        [weekNameLabel setTitle:[_weekNames objectAtIndex:i] forState:UIControlStateNormal];
        [weekNameLabel setFrame:CGRectMake(originX+(width*(i%columns)), originY, width, width)];
        [weekNameLabel setTitleColor:[ColorUtils defaultOrderColor] forState:UIControlStateNormal];
//        [weekNameLabel.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
        weekNameLabel.userInteractionEnabled = NO;
        [self addSubview:weekNameLabel];
    }
    

    for (int i= 0; i<monthLength; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i+1;
        button.titleLabel.text = [NSString stringWithFormat:@"%d",i+1];
        [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [button setTitleColor:[ColorUtils defaultOrderColor] forState:UIControlStateNormal];
//        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
        [button addTarget:self action:@selector(tappedDate:) forControlEvents:UIControlEventTouchUpInside];
        NSInteger offsetX = (width*((i+weekday)%columns));
        NSInteger offsetY = (width *((i+weekday)/columns));
        [button setFrame:CGRectMake(originX+offsetX, originY+40+offsetY, width, width)];
        [button.layer setBorderColor:[[ColorUtils defaultOrderColor] CGColor]];
        [button.layer setBorderWidth:2.0];
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [ColorUtils defaultOrderColor];
        if(((i+weekday)/columns)==0)
        {
            [lineView setFrame:CGRectMake(0, 0, button.frame.size.width, 4)];
            [button addSubview:lineView];
        }

        if(((i+weekday)/columns)==((monthLength+weekday-1)/columns))
        {
            [lineView setFrame:CGRectMake(0, button.frame.size.width-4, button.frame.size.width, 4)];
            [button addSubview:lineView];
        }
        
        UIView *columnView = [[UIView alloc]init];
        [columnView setBackgroundColor:[ColorUtils defaultOrderColor]];
        if((i+weekday)%7==0)
        {
            [columnView setFrame:CGRectMake(0, 0, 4, button.frame.size.width)];
            [button addSubview:columnView];
        }
        else if((i+weekday)%7==6)
        {
            [columnView setFrame:CGRectMake(button.frame.size.width-4, 0, 4, button.frame.size.width)];
            [button addSubview:columnView];
        }
        if(i+1 ==_selectedDate && components.month == _selectedMonth && components.year == _selectedYear)
        {
            [button setBackgroundColor:[ColorUtils defaultOrderColor]];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        
        
            
        [self addSubview:button];
    }
    
    NSDateComponents *previousMonthComponents = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
    previousMonthComponents.month -=1;
    NSDate *previousMonthDate = [gregorian dateFromComponents:previousMonthComponents];
    NSRange previousMonthDays = [c rangeOfUnit:NSDayCalendarUnit
                   inUnit:NSMonthCalendarUnit
                  forDate:previousMonthDate];
    int maxDate = (int)previousMonthDays.length - weekday;
    
    
    for (int i=0; i<weekday; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.text = [NSString stringWithFormat:@"%d",maxDate+i+1];
        [button setTitle:[NSString stringWithFormat:@"%d",maxDate+i+1] forState:UIControlStateNormal];
        NSInteger offsetX = (width*(i%columns));
        NSInteger offsetY = (width *(i/columns));
        [button setFrame:CGRectMake(originX+offsetX, originY+40+offsetY, width, width)];
        [button.layer setBorderWidth:2.0];
        [button.layer setBorderColor:[[ColorUtils defaultOrderColor] CGColor]];
        UIView *columnView = [[UIView alloc]init];
        [columnView setBackgroundColor:[ColorUtils defaultOrderColor]];
        if(i==0)
        {
            [columnView setFrame:CGRectMake(0, 0, 4, button.frame.size.width)];
            [button addSubview:columnView];
        }

        UIView *lineView = [[UIView alloc]init];
        [lineView setBackgroundColor:[ColorUtils defaultOrderColor]];
        [lineView setFrame:CGRectMake(0, 0, button.frame.size.width, 4)];
        [button addSubview:lineView];
        [button setTitleColor:[UIColor colorWithRed:229.0/255.0 green:231.0/255.0 blue:233.0/255.0 alpha:1.0] forState:UIControlStateNormal];
//        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
        [button setEnabled:NO];
        [self addSubview:button];
    }
    
    int remainingDays = (monthLength + weekday) % columns;
    if(remainingDays >0){
        for (int i=remainingDays; i<columns; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.text = [NSString stringWithFormat:@"%d",(i+1)-remainingDays];
            [button setTitle:[NSString stringWithFormat:@"%d",(i+1)-remainingDays] forState:UIControlStateNormal];
            NSInteger offsetX = (width*((i) %columns));
            NSInteger offsetY = (width *((monthLength+weekday)/columns));
            [button setFrame:CGRectMake(originX+offsetX, originY+40+offsetY, width, width)];
            [button.layer setBorderWidth:2.0];
            [button.layer setBorderColor:[[ColorUtils defaultOrderColor] CGColor]];
            UIView *columnView = [[UIView alloc]init];
            [columnView setBackgroundColor:[ColorUtils defaultOrderColor]];
            if(i==columns - 1)
            {
                [columnView setFrame:CGRectMake(button.frame.size.width-4, 0, 4, button.frame.size.width)];
                [button addSubview:columnView];
            }
            UIView *lineView = [[UIView alloc]init];
            [lineView setBackgroundColor:[ColorUtils defaultOrderColor]];
            [lineView setFrame:CGRectMake(0, button.frame.size.width-4, button.frame.size.width, 4)];
            [button addSubview:lineView];
            [button setTitleColor:[UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0] forState:UIControlStateNormal];
//            [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
            [button setEnabled:NO];
            [self addSubview:button];

        }
    }

}
-(IBAction)tappedDate:(UIButton *)sender
{
    gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
//    if(!(_selectedDate == sender.tag && _selectedMonth == [components month] && _selectedYear == [components year]))
//    {
        if(_selectedDate != -1)
        {
            UIButton *previousSelected =(UIButton *) [self viewWithTag:_selectedDate];
            [previousSelected setBackgroundColor:[UIColor clearColor]];
            [previousSelected setTitleColor:[ColorUtils defaultOrderColor] forState:UIControlStateNormal];
            
        }
        
        [sender setBackgroundColor:[ColorUtils defaultOrderColor]];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _selectedDate = sender.tag;
    
//    NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
        NSDateComponents * components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
        components.day = _selectedDate;
        _selectedMonth = components.month;
        _selectedYear = components.year;
        NSDate *clickedDate = [gregorian dateFromComponents:components];
        [self.delegate tappedOnDate:clickedDate];
//    }
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
    components.day = 1;
    components.month += 1;
    self.calendarDate = [gregorian dateFromComponents:components];
    [UIView transitionWithView:self
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^ { [self setNeedsDisplay]; }
                    completion:nil];
    
    
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
    components.day = 1;
    components.month -= 1;
    self.calendarDate = [gregorian dateFromComponents:components];
    [UIView transitionWithView:self
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^ { [self setNeedsDisplay]; }
                    completion:nil];
}
-(void)setCalendarParameters
{
    if(gregorian == nil)
    {
        gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [gregorian components:(NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.calendarDate];
        _selectedDate  = components.day;
        _selectedMonth = components.month;
        _selectedYear = components.year;
    }
}

@end
