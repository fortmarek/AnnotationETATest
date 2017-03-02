//
//  ViewController.swift
//  Test
//
//  Created by Marek Fořt on 3/2/17.
//  Copyright © 2017 Marek Fořt. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    let etaAnnotations = [NewAnnotation(title: "KKK", subtitle: "KKKDDJDJ", coordinate: CLLocationCoordinate2D(latitude: 48.86666667, longitude: 2.333333))]
    
    var map = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        map.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(map)
        
        DispatchQueue.main.async(execute: {
            //Placing toilets on the map
            self.map.addAnnotations(self.etaAnnotations)
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {return nil}
        
        var annotationView = MKAnnotationView()
        
        if let reusableAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "etaAnnotation") {
            annotationView = reusableAnnotationView
        }
        else {
            let annotationEtaView = EtaAnnotationView(annotation: annotation, reuseIdentifier: "etaAnnotation")
            annotationEtaView.pinColor = UIColor(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.0)
            
            annotationEtaView.setDetailShowButton()
            
            
            annotationView = annotationEtaView
        }
        
        return annotationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
