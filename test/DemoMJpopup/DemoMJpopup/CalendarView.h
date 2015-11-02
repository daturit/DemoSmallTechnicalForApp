

#import <UIKit/UIKit.h>
@protocol CalendarDelegate <NSObject>

-(void)tappedOnDate:(NSDate *)selectedDate;

@end

@interface CalendarView : UIView
{
    NSInteger _selectedDate;
    NSArray *_weekNames;
}

@property (nonatomic,strong) NSDate *calendarDate;
@property (nonatomic,weak) id<CalendarDelegate> delegate;

@property (nonatomic, copy) NSString *next;
@property (nonatomic, strong) NSArray *weekName;
@property (nonatomic, copy) NSString *previous;
@property (nonatomic, copy) NSString *month;

@end
