# The Idea Behind Better One

The app is designed to motivate users to work by notifying them about their progress and allowing others to encourage them.
Users can create, edit, delete, and complete tasks, receive notifications, and view motivational quotes while working.
The app also tracks elapsed time for tasks and total elapsed time across all tasks, saving everything in local storage.
Send notifications to other users when tasks are completed.

## Documentation

The app is a simple task management app. It helps users to stay motivated and focused while working on their tasks. The app provides the following functionalities:

### Task Management

* Users can create, edit, delete, and complete tasks.
* Tasks can be saved locally for easy access.

### Notifications

* Users receive notifications when tasks are created.
* Users can receive notifications when tasks are completed.

### Motivation

* The app integrated random quotes for tasks to help users focus and improve motivation.

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
* User data is saved in Supabase Cloud.

### Search Functionality

* Users can search for tasks by status, date, title, or description.

### Upload Functionality

* Users can upload tasks to Supabase Cloud.

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
* Save user data in Cloud Supabase.
* Supported Supabase Cloud Authentication.
* Integrated search functionality to help users find tasks by status, date, title, or description.
* Login using Supabase Cloud.

## Completed Steps

* Implemented functionalities to create, edit, delete, and complete tasks.
* Set up notifications to be sent when tasks are created.
* Integrated random quotes for tasks to help users focus and improve motivation.
* Implemented tracking of elapsed time for each task and total elapsed time across all tasks.
* Implemented Animation for completed tasks.
* Implemented local storage functionality to save tasks.
* Supported multiple languages[English, Arabic].
* Added support for Dark Mode.
* Handled splash screen.
* OnBoarding screen.
* Settings for Search:
  * Search for tasks by status
  * Search for tasks by date
  * Search for tasks by description
  * Search for tasks by title
* Settings for notification:
  * Turn on/off notifications when tasks are created
  * Customize the notification schedule for your tasks
* Settings for theme:
  * Change to light, dark theme
* Login using Supabase Cloud:
  * Login with E-mail and password
  * Save user data in Cloud Supabase
* Handle app while no internet connection

## Video

[video demo](https://drive.google.com/file/d/1Ultt5Jo3H5440-eYnXFc0jMSwbJlbedy/view?usp=drivesdk)

## App Structure

![app_structure](https://github.com/eng-mohamed-ibrahem/better_one/assets/83507142/765e7249-70cf-40a6-ba37-a499b1464002)

## Next steps

* Apply Feedback submit
* Apply Search functionality to search for tasks by status, date, title, or description
* Apply Upload functionality to upload tasks to Supabase Cloud
* Send notifications to *other users* when tasks are completed.

## Dependencies

```bash
  flutter_bloc: ^8.1.4
  flutter_local_notifications: ^16.3.2
  flutter_screenutil: ^5.9.0
  feedback: ^3.0.1
  device_info_plus: ^9.1.2
  package_info_plus: ^5.0.1
  supabase_flutter: ^2.5.1
  flutter_svg: ^2.0.10+1
  flutter_timezone: ^1.0.8
  font_awesome_flutter: ^10.7.0
  freezed_annotation: ^2.4.1
  get_it: ^7.6.7
  hive_flutter: ^1.1.0
  intl: ^0.18.1
  json_annotation: ^4.8.1
  smooth_page_indicator: ^1.1.0
  timezone: ^0.9.2
```
