# Mindlink Assignment

A Flutter project designed to demonstrate cross-platform compatibility with Firebase integration. This project showcases navigation, Firebase initialization, and platform-specific configurations.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Firebase Configuration](#firebase-configuration)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)

## Introduction
This project, **Mindlink Assignment**, is a Flutter application built to illustrate the implementation of Firebase across multiple platforms, including Android and Web. The app includes a simple navigation example and demonstrates the necessary configurations required to initialize Firebase in different environments.

## Features
- **Cross-Platform Compatibility**: Runs on Android, iOS, and Web.
- **Firebase Integration**: Utilizes Firebase for backend services like analytics, authentication, and real-time databases.
- **Simple Navigation**: Includes a basic navigation flow to demonstrate page transitions.
- **Platform-Specific Configurations**: Proper handling of Firebase initialization depending on the platform.

## Getting Started
To get started with the project, ensure you have Flutter installed and set up on your local development environment. Follow the installation steps below to run the project on your desired platform.

## Installation
1. **Clone the repository**:
    ```bash
    git clone https://github.com/Manas2k3/Mindlink-Assignment.git
    cd mindlink_assignment
    ```

2. **Install the dependencies**:
    ```bash
    flutter pub get
    ```

3. **Set up Firebase**:
   - Follow the instructions in the [Firebase Configuration](#firebase-configuration) section to set up Firebase for Android, iOS, and Web.

## Running the App
### For Android/iOS:
```bash
flutter run
```

### For Web:
```bash
flutter run -d chrome
```

## Firebase Configuration
To configure Firebase for this project:

1. **Web**: 
   - Add the Firebase SDK scripts to `index.html`.
   - Create and download `firebase_options.dart` file using the [Firebase Console](https://console.firebase.google.com/).

2. **Android**: 
   - Place the `google-services.json` file in `android/app`.

## Project Structure
The project follows the standard Flutter directory structure:

- **lib/**: Contains the Dart code for the application.
  - `main.dart`: Entry point of the app, including Firebase initialization and app configuration.
  - `views`: Contains the different UI screens of the app.
  - `services`: Contains the services for handling the Dynamic Linking feature.
  - `firebase_options.dart`: Holds Firebase configurations for different platforms.
  
- **web/**: Contains web-specific files, including `index.html` for Firebase setup.

## Dependencies
The following dependencies are used in this project:

- **firebase_core**: ^3.4.0 - Core Firebase library for Flutter apps.
- **firebase_core_web**: ^2.17.5 - Web-specific Firebase library for Flutter.
- **share_plus**: ^10.0.0 - A Flutter plugin for sharing content across different platforms.
- **video_player**: ^2.9.1 - A video player widget for Flutter.
- **chewie**: ^1.8.4 - A customizable video player for Flutter built on top of `video_player`.
- **http**: ^1.2.2 - A package for making HTTP requests in Flutter.
- **uni_links2**: ^0.6.0+2 - A Flutter plugin for handling deep links and web links.
