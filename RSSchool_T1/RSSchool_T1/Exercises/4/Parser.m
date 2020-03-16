#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    if (!string || [string length] < 3) { return @[]; }
    
    NSMutableArray<NSString *> *result = [@[] mutableCopy];
    
    int counter = 0;
    int counterOpenBrack = 1;
    int begin = 0;
    int end = 0;
    NSString* reverseElement = @"";
    NSString* ourSubstring = @"";
    NSString* element = @"";

    int i = 0;
    while (i < string.length) {
        
        if (counter == 0) {
            if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"("] || [[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"<"] || [[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"["]) {
                element = [string substringWithRange:NSMakeRange(i, 1)];
                
                if ([element isEqual:@"("]) {
                    reverseElement = @")";
                    
                } else if ([element isEqual:@"<"]) {
                    reverseElement = @">";
                    
                } else if ([element isEqual:@"["]) {
                    reverseElement = @"]";
                    
                }
                
                counter = 1;
                begin = i + 1;
            }
        }
        
        NSLog(@"%d", i);
        
        if (counter == 1) {
            if (i + 1 < string.length) {
                if ([[string substringWithRange:NSMakeRange(i + 1, 1)]  isEqual: element]) {
                    counterOpenBrack += 1;
                }
            }
            if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: reverseElement] && counterOpenBrack > 1) {
                counterOpenBrack -= 1;
            } else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: reverseElement]) {
                
                counter = 0;
                end = i;
                
                int a = end - begin;
                ourSubstring = [string substringWithRange:NSMakeRange(begin, a)];
                NSLog(@"%@", ourSubstring);
                [result addObject: ourSubstring];
                
                i = begin - 1;
                
            }
        }
        
        i++;
        
    }
    
    
    return result;
}

@end
