# The Idea Behind Better One

The app is designed to motivate users to work by notifying them about their progress and allowing others to encourage them.
Users can create, edit, delete, and complete tasks, receive notifications, and view motivational quotes while working.
The app also tracks elapsed time for tasks and total elapsed time across all tasks, saving everything in local storage.
Send notifications to other users when tasks are completed.
Interact with task comments.

## Documentation

The app is a simple task management app. It helps users to stay motivated and focused while working on their tasks. The app provides the following functionalities:

### Task Management

* Users can create, edit, delete, and complete tasks.
* Tasks can be saved locally for easy access.

### Notifications

* Users receive notifications when tasks are created.
* Users can receive notifications when tasks are completed.

### Tracking

* The app tracks elapsed time for each task and provides total elapsed time across all tasks.

### Multi-Language Support

* The app supports multiple languages including English and Arabic.

### Theme

* The app supports multiple themes including light, dark, and system theme.

### Settings

* Users can control notification settings, search settings, theme settings, and language settings.

### Internet Connection

* The app can handle scenarios without internet connection.

### User Authentication

* Users can login using their E-mail and password.
* User data is saved in Firebase Cloud.

### Search Functionality

* Users can search for tasks by status, date, title, or description.

### Upload Functionality

* Users can upload tasks to Firebase Cloud.

## Key Features of the App

* Create, edit, delete, and complete tasks.
* Receive notifications for task updates and completion.
* Integrated random quotes for tasks to help users focus and improve motivation.
* Track elapsed time for each task and total elapsed time across all tasks.
* Save tasks locally for easy access.
* Integrated notification functionality to send notifications to other users when tasks are completed.
* Support for multiple languages including English and Arabic.
* Implemented animation for completed tasks to enhance user experience.
* Support for multiple themes including light, dark, and system theme.
* Settings for notification, search, theme, and language.
* handle app while no internet connection
* Login with Google account.
* Save user data in Cloud Firebase.
* Supported Firebase Cloud Authentication.
* Integrated search functionality to help users find tasks by status, date, title, or description.
* Login using Firebase Cloud.

## Video

[video demo](https://drive.google.com/file/d/1Ultt5Jo3H5440-eYnXFc0jMSwbJlbedy/view?usp=drivesdk)

## App Structure

![app_structure](https://github.com/eng-mohamed-ibrahem/better_one/assets/83507142/765e7249-70cf-40a6-ba37-a499b1464002)

## Structure Pattern

The structure pattern of this project is the Model-View-ViewModel (MVVM) pattern.

The MVVM pattern is a software architectural pattern that allows developers to separate the development of the user interface (UI) from the business logic of an application. It is based on the Model-View-Presenter (MVP) pattern but uses a ViewModel to bind the View to the Model.

The main components of the MVVM pattern are:

* **Model**: This component represents the data and business logic of the application. It provides the data and operations that the application needs to perform its tasks.
* **View**: This component represents the user interface of the application. It renders the data provided by the ViewModel and provides the user with a way to interact with the application.
* **ViewModel**: This component acts as an intermediary between the View and the Model. It exposes the data and operations of the Model in a form that is easily consumable by the View. It also provides data-binding, commands, and other features that are necessary to handle user input and other events.

better_one/
|-- lib/
|   |-- config/
|   |   |-- l10n/
|   |   |-- navigation/
|   |   |-- theme/
|   |-- core/
|   |-- data_source/
|   |-- model/
|   |-- repositories/
|   |-- view/
|   |   |-- pages/
|   |   |-- widgets/
|   |-- view_models/
|   |-- main.dart
|   |-- root_app.dart
|   |-- assets/
        |-- images/
        |-- lottie/
        |-- fonts/
