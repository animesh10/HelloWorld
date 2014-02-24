//
//  view2.m
//  HelloWorld
//
//  Created by Dutta, Animesh on 2/20/14.
//  Copyright (c) 2014 Dutta, Animesh. All rights reserved.
//

#import "view2.h"
#import <CoreLocation/CoreLocation.h>


@interface view2 ()

@end

@implementation view2{
    CLGeocoder *geocoder;
    CLLocationManager *locationManager;
    CLPlacemark *placemark;
}
//@synthesize mapView = _mapView;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager startMonitoringSignificantLocationChanges];
    
    self.locationsArray2 = self.VenuesList;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.locationsArray = @[@"Hello",@"WOrld",@"one",@"Two"];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}





- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.Lng = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.Lat = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.locationsArray2 count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
    }
        cell.textLabel.text = self.locationsArray2[indexPath.row];
        return cell;
    
}


-(NSArray *)VenuesList {
    // -(void)getVenuesList {
    NSDate *currDate = [NSDate date];
    Globals *globalsManager = [Globals globalsManager];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    //dateString it;s used for being UpTodate for API request
    NSString* rediusMtr=@"2000";//distance under the comes
    //NSString *acess_Token=@"OAuth_Token ";
    //acess_TokenOuth Token got from Foursqaure after registarting the App.
    //CGFloat latitude=245425435.564;//latitude & longitude coordinate
    //CGFloat longitude=245443435.564;
    NSLog(@"GLOBALS +++++++++++++++ %@", globalsManager.LAT);
        NSLog(@"GLOBALS +++++++++++++++ %@", globalsManager.LNG);
    
   // CGFloat latitude=37.339386;
   // CGFloat longitude=-121.894955;
    NSString *latitudeStr= globalsManager.LAT; //[NSString stringWithFormat:@"%f,",latitude];
    NSString *longitudeStr = [NSString stringWithFormat:@"%@%@", @"," ,globalsManager.LNG]; //[NSString stringWithFormat:@"%f",longitude];
    
    //latitudeStr =@" ";
    
    // NSLog(@"%@" ,latitudeStr);
    //NSLog(@"%@" ,longitudeStr);
    
    NSMutableString*latitudeLongitudeString =[[NSMutableString alloc]initWithString:latitudeStr];
    [latitudeLongitudeString appendString:longitudeStr];
    NSString *query=@"airport";//Venuse to be searched.
    NSString *resultLimit=@"50";//number of result to be returned.
    NSString *clientId =@"LTFWSKTNPJFRC4JTRKNBHHY14KCXDH54LRRCPOKHFB10BAKH";
    NSString *client_Secret=@"0VNXOODPSLEJU13XR4CGEJ0T5CRU5GX3FDGWYTVFJY1KTZP5";
    
    NSMutableString*latitudeLongitudeString1 =[[NSMutableString alloc]initWithString:latitudeStr];
    [latitudeLongitudeString1 appendString:longitudeStr];
    
    //NSLog(@"%@" ,latitudeLongitudeString1);
    
    NSString *name = @"food";
    
    //NSLog(@"%@" ,dateString);
    
    
    // https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD
    
    //    NSString *URLString=[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%@&limit=%@&radius=%@&client_id=%@&client_secret=%@&v=%@",latitudeLongitudeString,resultLimit,rediusMtr,clientId,client_Secret,dateString];
    //
    
    NSString *URLString=[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%@&limit=%@&radius=%@&client_id=%@&client_secret=%@&v=%@&name=%@",latitudeLongitudeString1,resultLimit,rediusMtr,clientId,client_Secret,dateString,name];
    
    
   // NSLog(@"%@" ,URLString);
    
    
    
    
    URLString =[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    //Perform request and get JSON back as a NSData object
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    
    
   // NSString *jsonString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
   // NSLog(@"%@",jsonString);
    
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
    
   // NSMutableArray *groups = [[NSMutableArray alloc] init];
    
    //    NSArray *venues = [parsedObject valueForKey:@"venues"];
    //    NSLog(@"Venues Count %d", venues.count);
    
    NSArray *results = [parsedObject valueForKey:@"response"];
    // NSLog(@"response %d ==================", results.count);
    
    // id for coffee shop: 4bf58dd8d48988d1e0931735
    NSArray *venues = [ results valueForKey:@"venues"];
    // NSLog(@"venues2 %d ===================", venues2.count);
    
    // NSLog(@"Venues Count %d", venues2.count);
  //  NSLog(@"Venues  %@ ", venues);
    
    NSMutableArray *venueNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *venue in venues){
        NSArray *name = [ venue valueForKey:@"name"];
      //  NSLog(@"NAME %@", name);
        
        [venueNames addObject:name];
       // [venueNames addObjectsFromArray:name];
    
    }
    
    //NSLog(@"VENUENAMES %@", venueNames);
    return venueNames;
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *venueName  = self.locationsArray2[indexPath.row];
    
    NSString *message = [[NSString alloc] initWithFormat:@"Location Selected: %@!", venueName ];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Selected" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    CLLocationCoordinate2D loc = [userLocation coordinate];
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 10000, 10000);
//    [self.mapView setRegion:region animated:YES];
//    
//    
//    CLLocation *currentLocation = nil ;
//    // loc.longitude == currentLocation.coordinate.longitude ;
//    // loc.latitude == currentLocation.coordinate.latitude ;
//    
//    [self getVenuesList:[NSString stringWithFormat:@"%f,",loc.latitude ] : [NSString stringWithFormat:@"%f,",loc.longitude] ];
//    
//    //NSLog(@"Resolving the Address");
//    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
//        // NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
//        if (error == nil && [placemarks count] > 0) {
//            placemark = [placemarks lastObject];
//            self.getAddress.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
//                                    placemark.subThoroughfare, placemark.thoroughfare,
//                                    placemark.postalCode, placemark.locality,
//                                    placemark.administrativeArea,
//                                    placemark.country];
//        } else {
//            //NSLog(@"%@", error.debugDescription);
//        }
//    } ];
//    
//    
//}


@end
