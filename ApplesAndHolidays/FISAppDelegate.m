//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

- (NSArray*) pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    //self keypath used
    
    NSArray *apple = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apple;
}

- (NSArray*) holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    
    return [database[season] allKeys]; //returns all supplies from submitted "holiday" season
    
}

- (NSArray*) suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
//NSDictionary *dictionary = [database objectForKey:season];
//NSMutableArray *mArray = [dictionary objectForKey:holiday];
//return mArray;
                            //alternate ways to get return
    
//NSMutableArray *supplies = [[NSMutableArray alloc] init];
//[supplies addObject:database[season][holiday]];
// return supplies;
    
    return [NSArray arrayWithArray:database[season][holiday]];
}

- (BOOL) holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
        return [[database[season] allKeys] containsObject:holiday];
        
}

- (BOOL) supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    //NSLog(@"This is the season:%@\nThis is the holiday:%@\nThis is the supply:%@\nThis is the database%@", season, holiday, supply, database);
    
    //NSDictionary *seasonDictionary = database[season];
    
    //NSLog(@"This is the season dictionary:%@", seasonDictionary);
    
    //NSArray *supplyArray = seasonDictionary[holiday];
    
    //NSLog(@"This is the supply array:%@", supplyArray);
    
    
//    if ([supplyArray containsObject:supply]) {
//        return YES;
//    }
//    else {
//    
//    return NO;
//    }
    
    return [database[season][holiday] containsObject:supply];
    
}

- (NSDictionary*) addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    database[season][holiday] = [[NSArray alloc]init];
    
    return database;
    
}

- (NSDictionary*) addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    
    return database;
    
}

@end