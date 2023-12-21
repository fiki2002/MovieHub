# Movie Hub 🎬😍

Movie Hub is an app that allows users to view different categories of movies and also watch!.
It creates an immersive and seamless movie-watching experience!. It is built with Flutter😍😌 and Firebase using the [TMDB API](https://www.themoviedb.org/) and [VidSrc](https://vidsrc.to/) for viewing the movies.

It provides an interactive and captivating experience for the user!

## Demo
https://github.com/fiki2002/MovieHub/assets/85044009/c767718c-25c7-48a7-b0ee-2ca011d33fdd

## Preview
<img width="632" alt="Screenshot 2023-12-21 at 15 17 25" src="https://github.com/fiki2002/MovieHub/assets/85044009/e84807c7-ba25-449a-b3b9-32afba82d35f">
<img width="664" alt="Screenshot 2023-12-21 at 15 17 33" src="https://github.com/fiki2002/MovieHub/assets/85044009/949e49c0-18c0-42f0-bf39-bf96d673a35d">
<img width="648" alt="Screenshot 2023-12-21 at 15 17 44" src="https://github.com/fiki2002/MovieHub/assets/85044009/ddde4577-9b47-43a4-b3b7-be3bd53460ac">
<img width="577" alt="Screenshot 2023-12-21 at 15 18 06" src="https://github.com/fiki2002/MovieHub/assets/85044009/2d4cd79b-ec30-41c7-9bea-27c84cea6aef">
<img width="652" alt="Screenshot 2023-12-21 at 15 18 16" src="https://github.com/fiki2002/MovieHub/assets/85044009/13a9ddcb-86bf-4884-b35e-fc9b43709e28">
<img width="616" alt="Screenshot 2023-12-21 at 15 18 21" src="https://github.com/fiki2002/MovieHub/assets/85044009/7f5f35e4-b33f-4cd8-8a6a-04da4a067663">
<img width="563" alt="Screenshot 2023-12-21 at 15 18 51" src="https://github.com/fiki2002/MovieHub/assets/85044009/b824506a-1364-486e-9451-b80c93099941">
<img width="611" alt="Screenshot 2023-12-21 at 15 18 57" src="https://github.com/fiki2002/MovieHub/assets/85044009/917d5834-8976-450f-a546-b98940a8bda5">
<img width="608" alt="Screenshot 2023-12-21 at 15 20 03" src="https://github.com/fiki2002/MovieHub/assets/85044009/6f58a1a2-8587-4ba9-95e9-61a15ff58fd8">
<img width="521" alt="Screenshot 2023-12-21 at 15 28 58" src="https://github.com/fiki2002/MovieHub/assets/85044009/d0163045-0884-4061-abe8-796708becc4c">
<img width="611" alt="Screenshot 2023-12-21 at 15 18 57" src="https://github.com/fiki2002/MovieHub/assets/85044009/4be52c21-13a5-46d4-8ad3-f33dd359ac33"><img width="664" alt="Screenshot 2023-12-21 at 15 17 33" src="https://github.com/fiki2002/MovieHub/assets/85044009/36de12e9-6733-4a99-9e3e-51ed188bef87"><img width="648" alt="Screenshot 2023-12-21 at 15 17 44" src="https://github.com/fiki2002/MovieHub/assets/85044009/f0271510-e0e5-46d1-a4d8-d6da861ea22f"><img width="648" alt="Screenshot 2023-12-21 at 15 17 44" src="https://github.com/fiki2002/MovieHub/assets/85044009/a714adfd-e218-4dbf-898a-63bbe910fd96"><img width="577" alt="Screenshot 2023-12-21 at 15 18 06" src="https://github.com/fiki2002/MovieHub/assets/85044009/86f03e86-38e5-455c-8f6d-28070636dbc2">


## Key Features

- View movies in diverse categories (e.g Trending, Popular, Upcoming, Top Rated)
- Discover Movies
- Watch movies
- Add Movies to watchList
- Search for Movies
- Sign in, Sign Up, Forgot Password, Sign Out
- Choose Avatar
- View Similar Movies to a Movie
- View Images from a Movie
- Infinite scrolling with pagination
- Nice Loading UI with the Shimmer
- Visit Movie's webpage

 
## Installation

 - You can download the apk to your Android device from [here](https://drive.google.com/file/d/1kKeoQIYu4PP0_kbLvws8OuedOwk13mw5/view?usp=sharing)

 To run MovieHub from the Codebase,
 you need to get a TMDB API key from [here](https://developer.themoviedb.org/docs/getting-started) you will have to create an account, if you don't have one.

Once you have the API Key, you can create an api_keys.dart file, locate the lib > core > utils and create the file under it

Add the following:

```dart
String get baseUrl => 'https://api.themoviedb.org/3';

String get apiKey => 'YOUR API KEY';

String get videoBaseUrl => 'https://vidsrc.to/embed/movie/';

```

You also need to create a firebase project at [Firebase](https://firebase.google.com/)

With all these in place, you can 

```dart
flutter run
```

## Packages Used

- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil): For making the sizes used in the app are responsive
- [flutter_svg](https://pub.dev/packages/flutter_svg): For loading SVG assets
- [cached_network_image](https://pub.dev/packages/cached_network_image): For caching data of images to boost app performance
- [provider](https://pub.dev/packages/provider): For managing state across the app
- [get_it](https://pub.dev/packages/get_it): For dependency Injection
- [equatable](https://pub.dev/packages/equatable): To enable comparison of objects
- [http](https://pub.dev/packages/http): To enable network calls
- [shimmer](https://pub.dev/packages/shimmer): For the beautiful loader
- [carousel_slider](https://pub.dev/packages/carousel_slider): For the Trending Movie Preview 
- [intl](https://pub.dev/packages/intl): For advanced date Formatting
- [url_launcher](https://pub.dev/packages/url_launcher): To open web pages 
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview): For launching the movie screen
- [lottie](https://pub.dev/packages/lottie): For the nice animated assets used for empty, error and loading states
- [fpdart](https://pub.dev/packages/fpdart): For Functional Programming mainly for the use of Either.
- [firebase_core](https://pub.dev/packages/firebase_core), [firebase_auth](https://pub.dev/packages/firebase_auth), [firebase_storage](https://pub.dev/packages/firebase_storage),  [cloud_firestore](https://pub.dev/packages/cloud_firestore), [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics): which are Firebase services!

## Lessons Learned and Challenges faced

Veni, Vidi, Vici!

I faced a lot of issues during the development of this app, but i also learnt alot!

- The main reason why i took on this task is to explore Firebase well, and i did that to an extent, exploring its Database, Storage, Crashlytics and Authentication Services.
- I had issues trying to make watching movies possible, then when i thought i had gotten it right, it wasn't working on Android 🤦🏽‍♀️😂, but i had to do more research and changed the webview package , after a lot of iteration, it worked!
- I also had issues while implementing the watchlist section, i had a bug that took me a while to fix, but after speaking to my seniors and alot of reflection, i got it right
- What kept me going was the joy i felt after i completed a feature successfully.
## Authors

- Adepitan Oluwatosin [@fiki2002](https://github.com/fiki2002)

