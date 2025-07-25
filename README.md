
## iOS Reader App – Product Viewer

###  Project Description

This iOS application is developed using *UIKit*. It fetches and displays a list of products from a public REST API:
"https://dummyjson.com/products"

The app allows users to *view products, **search by product name, and **refresh the product list* manually. It is designed using clean coding principles and structured architecture for scalability and maintenance.

---

### Architecture

The app follows the *MVVM (Model-View-ViewModel)* architecture:

* *Model* handles the data structure (Product).
* *ViewModel* manages business logic and prepares data for display.
* *View/Controller* handles user interface and binds data using UIKit.
* The code is cleanly separated into layers like *Networking, **Repository, and **ViewModel* to maintain clarity and reusability.

---

### Features Implemented

1. *Fetch Products*

   * Connects to a public API and retrieves a list of products.
   * Parses and displays product titles and brands in a list.

2. *Pull-to-Refresh*

   * Allows users to manually refresh the product list using UIRefreshControl.
   * Ensures the user can reload the latest data from the server.

3. *Search Functionality*

   * Includes a UISearchBar to filter products in real-time.
   * Users can search by typing any part of the product name.

---

###  UI Design

* Developed using *UIKit*, not SwiftUI.
* Designed with *Auto Layout* for screen responsiveness.
* Fully supports *Light Mode and Dark Mode*.
* User-friendly and clean design for smooth navigation.

---
