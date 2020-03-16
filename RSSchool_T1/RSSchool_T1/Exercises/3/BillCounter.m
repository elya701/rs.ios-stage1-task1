#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray<NSNumber *> *finalArray = [bill mutableCopy];
    
    [finalArray removeObjectAtIndex:index];
    
    int fullSum = 0;
    
    for (int i = 0; i < finalArray.count; i++) {
        int ourElement = [((NSNumber*)[finalArray objectAtIndex:i]) intValue];
        fullSum += ourElement;
    }
    
    int halfSum = fullSum / 2;
    
    NSNumber *ourSum = [NSNumber numberWithInt:halfSum];
    
   if ([sum isEqualToNumber:ourSum]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - [ourSum intValue]];
    }
    

}

@end
