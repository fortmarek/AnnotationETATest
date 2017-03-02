//
//  NewAnnotation.swift
//  Test
//
//  Created by Marek Fořt on 3/2/17.
//  Copyright © 2017 Marek Fořt. All rights reserved.
//

import UIKit
import MapKit

class NewAnnotation: NSObject, MKAnnotation {
    
    public var title: String?
    public var subtitle: String?
    public let coordinate: CLLocationCoordinate2D
    
    public init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        
        //Coordinate
        self.coordinate = coordinate
        
        //Safely unwrap title and subtitle (they could be nil)
        if let title = title {
            self.title = title
        }
        
        if let subtitle = subtitle {
            self.subtitle = subtitle
        }
    }
}
