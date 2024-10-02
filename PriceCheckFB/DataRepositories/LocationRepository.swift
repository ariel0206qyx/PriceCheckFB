// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'

import Combine
// import Firebase modules here
import Firebase
import FirebaseFirestore


class LocationRepository: ObservableObject {
    private let path: String = "locations"
    private let store = Firestore.firestore()
  // Set up properties here
    @Published var locations: [Location] = []
    private var cancellables: Set<AnyCancellable> = []
  
  
  
  init() {
    get()
  }

  func get() {
    // Complete this function
      store.collection(path)
        .addSnapshotListener { querySnapshot, error in
          if let error = error {
            print("Error getting locations: \(error.localizedDescription)")
            return
          }

          self.locations = querySnapshot?.documents.compactMap { document in
            try? document.data(as: Location.self)
          } ?? []
        }
    
    
    
    
    

  }
}
