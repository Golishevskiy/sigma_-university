//
//  MapLayer.swift
//  Currency
//
//  Created by Petro Golishevskiy on 21.06.2021.
//

import Foundation
import MapKit

class MapLayer {
    static let shared = MapLayer()
    var geocoder = CLGeocoder()
    
    func searchStreetFromName(name: String, map: MKMapView) -> CLLocationCoordinate2D {
        var coordinate = CLLocationCoordinate2D()
        geocoder.geocodeAddressString(name) { (response, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            
            if response != nil {
                if let response = response?.first {
                    let annotation = MKPointAnnotation()
                    annotation.title = name
                    annotation.coordinate = response.location!.coordinate
                    coordinate = annotation.coordinate
                    map.showAnnotations([annotation], animated: true)
                }
            }
        }
        return CLLocationCoordinate2D()
    }
    
    func drawLine(startP: CLLocationCoordinate2D, endP: CLLocationCoordinate2D, map: MKMapView) {
        // request route
        let start = MKPlacemark(coordinate: startP)
        let end = MKPlacemark(coordinate: endP)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: start)
        request.destination = MKMapItem(placemark: end)
        request.transportType = .automobile
        
        let direction = MKDirections(request: request)
        direction.calculate { (response , error) in
            guard let response = response else { return }
            for route in response.routes {
                map.addOverlay(route.polyline)
            }
        }
        
        // zoom
        let c1 = CLLocation(latitude: startP.latitude, longitude: startP.longitude)
        let c2 = CLLocation(latitude: endP.latitude, longitude: endP.longitude)
        let zoom = c1.distance(from: c2)
        let location = CLLocationCoordinate2D(latitude: (startP.latitude+endP.latitude)*0.5, longitude: (startP.longitude+endP.longitude)*0.5)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: zoom, longitudinalMeters: zoom + zoom*0.2)
        map.setRegion(region, animated: true)
    }
}
