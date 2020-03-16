#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter


- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
  
   
    
    if (array.count == 0) {
        return nil;
    }
    
    if (array.count <= 1) {
        return @[array[0], array[0]];
    }
    
    NSArray<NSNumber *> *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
    
    int length = sorted.count;
    
    
    int minSum = 0;
    int maxSum = 0;
    
    for (int i = 0; i < length - 1; i++) {
        int ourElement = [((NSNumber*)[sorted objectAtIndex:i]) intValue];
        
        minSum += ourElement;
    }
    
    for (int i = 1; i < length; i++) {
        int ourElement = [((NSNumber*)[sorted objectAtIndex:i]) intValue];
        
        maxSum += ourElement;
    }
    
    NSNumber *min = [NSNumber numberWithInt:minSum];
    NSNumber *max = [NSNumber numberWithInt:maxSum];
  
    
 
    return @[min,max];
}

@end
