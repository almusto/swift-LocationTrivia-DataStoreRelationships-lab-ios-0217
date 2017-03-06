//
//  LocationDataSource.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Alessandro Musto on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


final class LocationsDataStore: AddLocationDelegate {
  var locations: [Location] = []


  static let sharedInstance = LocationsDataStore()
  private init() {
  }


  func generateStartingLocationsData() {

    let empireState = Location(name: "The Empire State Building", latitude: 40.7484, longitude: -73.9857)
    let trivium1A = Trivium(content: "1,454 Feet Tall", likes: 4)
    let trivium1B = Trivium(content: "Cost $24,718,000 to build", likes: 2)
    empireState.trivia.append(contentsOf:[trivium1A, trivium1B])

    let bowlingGreen = Location(name: "Bowling Green", latitude: 41.3739, longitude: -83.6508)
    let trivium2A = Trivium(content: "NYC's oldest park", likes: 8)
    let trivium2B = Trivium(content: "Made a park in 1733", likes: 2)
    let trivium2C = Trivium(content: "Charging Bull was created in 1989", likes: 0)
    bowlingGreen.trivia.append(contentsOf:[trivium2A, trivium2B, trivium2C])

    let ladyLiberty = Location(name: "Statue Of Liberty", latitude: 40.6892, longitude: -74.0444)
    let trivium3A = Trivium(content: "Gift from France", likes: 6)
    ladyLiberty.trivia.append(trivium3A)

    self.locations.append(contentsOf:[bowlingGreen, empireState, ladyLiberty])
  }

  func createLocation(location: Location) {
    locations.append(location)
  }

  func addTrivium(toLocation location:  Location, trivium: Trivium) {
    location.trivia.append(contentsOf: [trivium])

  }


  

  
}


