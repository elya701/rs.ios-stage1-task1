#import "T1Array.h"

@implementation T1Array

- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray.count <= 2) {
        return sadArray;
    }
    NSMutableArray *finalArray = [sadArray mutableCopy];
    int i = 1;
    
    while (i < finalArray.count - 1){
        if ([finalArray[i] intValue] > [finalArray[i - 1] intValue] + [finalArray[i + 1] intValue]) {
            [finalArray removeObjectAtIndex:i];
            i = (i - 1);
            if (i < 1) {
                i = 1;
            }
            continue;
        }
        i += 1;
    }
    
    return finalArray;
}

@end
