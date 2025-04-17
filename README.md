# Fake-Store

A fake store app written in Flutter.

## Screenshots
<img src="https://raw.githubusercontent.com/mastermach50/Fake-Store/refs/heads/main/FakeStore.png">

## Installation
1. Install and setup the [Flutter SDK](https://docs.flutter.dev/get-started/install)
2. Install and setup the Android Studio
3. Clone the repository
```
git clone https://github.com/mastermach50/Fake-Store.git --depth=1
cd Fake-Store
```
4. Install the dependencies
```
flutter pub get
```
5. You can run the app on an attached device using
```
flutter run
```
or install it using
```
flutter build apk
adb install build/app/outputs/flutter-apk/app-release.apk
```

## Dependencies Used
| Dependency             | Reason                                                         |
| ---------------------- | -------------------------------------------------------------- |
| flutter_iconly         | To use the [Iconly](https://iconly.pro/) icons                 |
| provider               | State management                                               |
| http                   | To fetch data from [Fake Store API](https://fakestoreapi.com/) |
| flutter_launcher_icons | Generate icons for android                                     |

## State Management 
State management is done using `provider`. There are two providers use `ProductsProvider` and `Navigation Provider`.

`ProductsProvider` is used for all product related functions which includes
- Fetching all products from fakestoreapi
- Generating list of categories
- Marking products as favourite

`Navigation Provider` is used to keep track of the current page of the app that the user is on. It is mainly used to implement the bottom navigation bar in the main screen.