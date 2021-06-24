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
    private var geocoder = CLGeocoder()
    private var startPoint = CLLocationCoordinate2D()
    private let locationManager: CLLocationManager = CLLocationManager()
    var searchName: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserLocation()
        searchStreetFromName(name: searchName!)
    }
    
    private func setUserLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startPoint = locationManager.location!.coordinate
        mapView.showsUserLocation = true
    }
    
    private func drawLine(startP: CLLocationCoordinate2D, endP: CLLocationCoordinate2D) {
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
                self.mapView.addOverlay(route.polyline)
            }
        }

        // zoom
        let first = CLLocation(latitude: startP.latitude, longitude: startP.longitude)
        let second = CLLocation(latitude: endP.latitude, longitude: endP.longitude)
        let zoom = first.distance(from: second)
        let location = CLLocationCoordinate2D(latitude: (startP.latitude + endP.latitude) * 0.5,
                                              longitude: (startP.longitude + endP.longitude) * 0.5)
        let region = MKCoordinateRegion(center: location,
                                        latitudinalMeters: zoom,
                                        longitudinalMeters: zoom + zoom * 0.2)
        mapView.setRegion(region, animated: true)
    }
    
    // search location from street name
    private func searchStreetFromName(name: String) {
        geocoder.geocodeAddressString(name) { (response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error searchStreetFromName MapViewController")
            }
            
            if response != nil {
                if let response = response?.first {
                    let annotation = MKPointAnnotation()
                    annotation.title = name
                    annotation.coordinate = response.location!.coordinate
                    DispatchQueue.main.async { [weak self] in
                        self?.drawLine(startP: self!.startPoint,
                                       endP: annotation.coordinate)
                    }
                    self.mapView.showAnnotations([annotation], animated: true)
                }
            }
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    // renderer route
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .green
        return renderer
    }
}

