//
//  ViewController.m
//  ZaHunter
//
//  Created by Jen Kelley on 3/25/15.
//  Copyright (c) 2015 Jen Kelley. All rights reserved.
//

#import "ViewController.h"
#import "PizzaViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *pizzaArray;
@property PizzaViewController *pizzaObject;
@property CLLocationManager *locationManager;

@end
//this is the tableviewcontroller
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    [self.tableView reloadData];
}

#pragma mark - "table view"

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pizzaCellID"];
    //here I'm putting the pizza array and populating the cell with the name and... location? distance?
    NSString *pizzaName = [self.pizzaArray objectAtIndex:indexPath.row];

    cell.textLabel.text = pizzaName;

    return cell;
}

#pragma mark - "navigation"

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"\t----> %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    for (CLLocation *location in locations) {
        if (location.horizontalAccuracy < 1000 && location.verticalAccuracy < 100) {
            NSLog(@"Location Found, reverse Geocoding");
            [self.locationManager stopUpdatingLocation];
            [self findPizzaNear:location];
            [self reverseGeocodePizza:location];
            break;
        }
    }
}

-(void)findPizzaNear:(CLLocation *)location
{
    MKLocalSearchRequest *request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"pizza";
    //within 11 km
    request.region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(.1, .1));

    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        MKMapItem *mapItem = response.mapItems.firstObject;
        NSLog(@"You should be at the %@", mapItem.name);
        //   [self getDirectionsTo:mapItem];
    }];

}

-(void)reverseGeocodePizza:(CLLocation *)location
{
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found You: %lu", placemarks.count);
        self.pizzaArray = placemarks;
    }];
}



@end
