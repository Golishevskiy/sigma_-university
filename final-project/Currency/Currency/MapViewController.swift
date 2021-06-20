//
//  MapViewController.swift
//  Currency
//
//  Created by Petro Golishevskiy on 17.06.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var geocoder = CLGeocoder()
    var searchName: String?
    private let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()

        mapView.showsUserLocation = true
        searchStreetFromName(name: searchName!)
    }
    
    func searchStreetFromName(name: String) {
        geocoder.geocodeAddressString(name) { (response, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if response != nil {
                if let response = response?.first {
                    let annotation = MKPointAnnotation()
                    annotation.title = name
                    annotation.coordinate = response.location!.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }
}

//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last?.coordinate {
//            let region = MKCoordinateRegion(center: location, latitudinalMeters: 2000, longitudinalMeters: 200)
//            mapView.setRegion(region, animated: true)
//        }
//    }
//}

