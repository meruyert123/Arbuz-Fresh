# Arbuz-Fresh
Arbuz application which provides a subscription service for weekly delivery of fresh dairy products, seasonal vegetables, and fruits.

## Application usage
- make a basket from a combination of several products

- choose the day of the week and the delivery period

- choose a subscription period for delivery of these products
- [Demo Video]([https://drive.google.com/drive/folders/1fM9h1mJYIYXQ8Kw3Ngt1sLLDqb6V9NlT?usp=sharing](https://drive.google.com/drive/folders/1bGlEb1RtC_1FuVTtBVbhTJ0l7tBROfug?usp=share_link)).


## Getting started
### Installing and running the app
To install and run the app, follow these steps:
1. Clone the repository to your local machine using the following command:
```
$ git clone https://github.com/meruyert123/Arbuz-Fresh.git
```
2. Open the project in Xcode by double-clicking the .xcodeproj file.
3. Select a simulator or a connected device from the Xcode toolbar.
4. Click the "Run" button (or press Cmd+R) to build and run the app on the selected device.
5. The app should now launch on the simulator or connected device you selected.

## Architecture
This project follows the MVVM (Model-View-ViewModel) architecture pattern. 
### Components
• Models: Contains the data structures or entities used in the application. These models encapsulate the data and business logic related to them.

• Views: Responsible for presenting the user interface.

• Components: Reusable UI elements or widgets that can be used across different views. 

• Data: Handles data retrieval, storage, and manipulation.

• View Models: They retrieve data from the data layer, perform any required transformations or computations, and update the views accordingly.
