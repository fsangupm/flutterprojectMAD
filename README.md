# HelloWorldMAD24

📱 Flutter Android App

## GitHub and Workspace Links

- **Repository**: [GitHub](https://github.com/fsangupm/flutterprojectMAD)
- **Releases**: [Releases](https://github.com/fsangupm/flutterprojectMAD/releases)
- **Workspace**: [Sharepoint](https://upm365.sharepoint.com/sites/FeliciaSangMAD/SitePages/Tracking-Flutter.aspx)

---

## Description

FlutterWellbeingApp consists of multiple screens enabling users to:

- Log activities with optional notes.
- Track GPS coordinates during movement and export them as CSV.
- Manage personal preferences using `shared_preferences`.
- Navigate easily through a drawer-style menu.

The goal is to encourage healthy behaviors by making it easier to visualize and reflect on personal routines.

---

## Screenshots and Navigation

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.39.01%20PM.png?raw=true" width="300px"><br/>
      <em>GPS Tracker Screen with CSV file persistence</em>
    </td>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.39.07%20PM.png?raw=true" width="300px"><br/>
      <em>Option to share CSV file</em>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.39.20%20PM.png?raw=true" width="300px"><br/>
      <em>Activity Logger screen with database persistence</em>
    </td>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.33.27%20PM.png?raw=true" width="300px"><br/>
      <em>Activity log database using SQLite</em>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.38.39%20PM.png?raw=true" width="300px"><br/>
      <em>Task list screen with txt file persistence</em>
    </td>
    <td align="center">
      <img src="https://github.com/fsangupm/flutterprojectMAD/blob/master/images/Screenshot%202025-06-13%20at%206.39.25%20PM.png?raw=true" width="300px"><br/>
      <em>Shared preferences for user information</em>
    </td>
  </tr>
</table>

---

## Demo Video
[App demo](https://upm365-my.sharepoint.com/:v:/g/personal/f_sang_alumnos_upm_es/EWQ3Ue0mYQdKriAsrOByzCkBwu0xRmNxKe7DzthXL3GnbQ?e=3ZRynj&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)

---

## Features

Functional Features:

- Activity logger with SQLite database persistence.
- Real-time GPS tracking.
- Exportable route data in CSV format.
- Custom settings via shared preferences.
- Navigation drawer for user-friendly access.

Technical Features:
- **SQLite** for persistent local storage of activities.  
  Ref: `database_helper.dart`
- **CSV Export** of GPS data.  
  Ref: `gps_tracker_screen.dart`
- **Shared Preferences** management.  
  Ref: `shared_preferences_screen.dart`
- **Drawer Navigation** for screen access.  
  Ref: `main.dart`
- **Geolocation** integration with `geolocator`.  
  Ref: `gps_tracker_screen.dart`
- **File Sharing** using `share_plus`.  
  Ref: `gps_tracker_screen.dart`

---

## How to Use

1. Launch the app. The splash screen appears.
2. Navigate using the drawer menu.
3. Use the Shared Preferences screen to save settings.
4. Log an activity from the main or second screen.
5. Start the GPS tracker and move. When done, export the data.
6. View saved activities and details in the second and third screens.

---

## Contributors

- **Felicia Sang** – `f.sang@alumnos.upm.es`

> Workload distribution: 100% (solo project)
