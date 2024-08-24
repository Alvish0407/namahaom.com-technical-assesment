### An E-commerce app (eComm) built with Flutter, Riverpod, Firebase Auth and dummyjson API within 12 Hours

https://github.com/user-attachments/assets/b87fbca8-cb04-45c3-957d-6fd4c1182db1

<details>
<summary>Assignmnet: An e-commerce app</summary>

#### Build a fully functional e-commerce mobile application that allows users to browse products, add items to a cart, and complete a purchase. This task will help us evaluate your Flutter skills, code quality, state management, and ability to integrate APIs.

### TASK REQUIREMENTS:

#### 1. PRODUCT LISTING:

- Implement a product listing page where users can view products in various categories.
- Each product should display an image, name, price, and an "Add to Cart" button.

#### 2. PRODUCT DETAIL:

- Create a product detail page that displays detailed information about the selected product.
- Include options like quantity selection, product description, and related products.

#### 3. SHOPPING CART:

- Develop a shopping cart feature where users can view the items they've added, update quantities, and see the total price.
- Include a "Checkout" button to proceed to the purchase process.

#### 4. CHECKOUT PROCESS:

- Implement a checkout process where users can enter shipping information, select payment methods, and confirm their order.
- Provide a confirmation screen showing the order summary after the checkout is completed.

#### BONUS POINTS:

- Implement user authentication (login/signup) using a third-party service or mock API.
- Add animations or transitions that enhance the user experience.
- Implement local storage to persist cart items between app sessions.

#### GUIDELINES:

- State Management: Use an appropriate state management solution to manage app state efficiently.
- Code Quality: Focus on clean, maintainable, and well-documented code. Follow best practices for Flutter development.
- API Integration: You are not expected to build backend APIs but will be tested on API integration. Use mock APIs wherever necessary or integrate third-party APIs.

#### DESIGN DELIVERABLES:

- Codebase: Submit your complete codebase.
- Demo Video: Record a video demonstrating the working application,
highlighting key features and explaining your code structure and
decisions.

</details>


## Prerequisite
1. Download [fvm](https://fvm.app/) and follow the [instructions](https://fvm.app/documentation/guides/basic-commands#examples-1)
2. [Setup](https://github.com/Alvish0407/kaam-hiring-test/blob/main/README.md#running-the-project-with-firebase) Firebase Project


## Features

- [x] Implement user login and registration using Firebase Authentication (Email and Password).
- [x] Include basic form validation (e.g., email format, password strength)
- [x] Allow authenticated users to filter products, manage cart, place order.
- [x] Basic animations for transitions and status changes.
- [x] Responsive UI and Clean Code using Feature-First architecture.
- [x] Clean, user-friendly interface.

## Backend

- Implemented Firebase for secure email/password authentication.
- Utilized [DummyJSON](https://dummyjson.com/) APIs to manage products, categories, and cart functionalities.
- Integrated mock data for shipping addresses and payment methods to simulate real-world scenarios.

## Packages in use

These are the main packages used in the app:

- [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) for data caching, dependency injection, and more
- [Riverpod Generator](https://pub.dev/packages/riverpod_generator) and [Riverpod Lint](https://pub.dev/packages/riverpod_lint) for the latest Riverpod APIs
- [GoRouter](https://pub.dev/packages/go_router) for navigation
- [Firebase Auth](https://pub.dev/packages/firebase_auth) for authentication
- [Flutter Animate](https://pub.dev/packages/flutter_animate) for performing animations reducing boilerplate code
- [Build Runner](https://pub.dev/packages/build_runner) is concrete way of generating files using Dart code

See the [pubspec.yaml](pubspec.yaml) file for the complete list.

## Why Riverpod ?
Riverpod is a reactive caching framework for Flutter/Dart.

Using declarative and reactive programming, Riverpod takes care of a large part of your application's logic for you. It can perform network-requests with built-in error handling and caching, while automatically re-fetching data when necessary.

## Running the project with Firebase

To use this project with Firebase, follow these steps:

- Create a new project with the Firebase console
- Enable Firebase Authentication, along with the Email/Password Authentication Sign-in provider in the Firebase Console (Authentication > Sign-in method > Email/Password > Edit > Enable > Save)
  
### Using the CLI

Make sure you have the Firebase CLI and [FlutterFire CLI](https://pub.dev/packages/flutterfire_cli) installed.

Then run this on the terminal from the root of this project:

- Run `firebase login` so you have access to the Firebase project you have created
- Run `flutterfire configure` and follow all the steps

That's it. Have fun!
