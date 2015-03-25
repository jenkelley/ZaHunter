//
//  PizzaViewController.m
//  ZaHunter
//
//  Created by Jen Kelley on 3/25/15.
//  Copyright (c) 2015 Jen Kelley. All rights reserved.
//

#import "PizzaViewController.h"

@interface PizzaViewController () <CLLocationManagerDelegate, PizzaViewDelegate>
@property NSArray *pizzaPlacesNearMe;
@end
//mapviewcontroller?
@implementation PizzaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//do I want this one to say I am here? now what are the four closest pizza places?
// then i become the delegate with the pizza data. i call it
}
#pragma mark - "location manager"
//
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    for (CLLocation *location in locations) {
//        if (location.horizontalAccuracy < 1000 && location.verticalAccuracy < 100) {
//            NSLog(@"Location Found, reverse Geocoding");
//            [self.locationManager stopUpdatingLocation];
//            [self reverseGeocodePizza:location];
//            break;
//        }
//    }
//}
//
//-(void)findPizzaNear:(CLLocation *)location
//{
//    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
//    request.naturalLanguageQuery = @"pizza";
//    //within 11 km
//    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(.1, .1));
//
//    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
//    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
//        MKMapItem *mapItem = response.mapItems.firstObject;
//        NSLog(@"You should be at the %@", mapItem.name);
//     //   [self getDirectionsTo:mapItem];
//    }];
//    
//}
//
//-(void)reverseGeocodePizza:(CLLocation *)location
//{
//    CLGeocoder *geocoder = [CLGeocoder new];
//    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
//        NSLog(@"Found You: %lu", placemarks.count);
//        self.pizzaPlacesNearMe = placemarks;
//    }];
//}
////I got my location and where the pizza is near me and put it in a delegate (property that does something... in this case got an array for me)
//-(NSArray *)whereAmIAndWhereIsPizza{
//    [self whereAmIAndWhereIsPizza];
//    return self.pizzaPlacesNearMe;
//}

@end
