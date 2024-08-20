# Notes App

Notes App is a Flutter-based application for creating, editing, and managing notes. It features a rich text editor, local storage with Hive, and a user-friendly interface for managing your notes efficiently.

<div align="center">
  <img src="https://github.com/Amanbig/notes_app/blob/main/images/image2.jpg" alt="Home Screen" width="200"/>
  <img src="https://github.com/Amanbig/notes_app/blob/main/images/image1.jpg" alt="Edit Note" width="200"/>
</div>

## Features

- **Create New Notes:** Add new notes with a floating action button.
- **Edit Existing Notes:** Modify notes using a rich text editor.
- **Delete Notes:** Remove notes with a delete button.
- **Local Storage:** Save notes locally using Hive for persistence.
- **Rich Text Editing:** Utilize various formatting options with the Flutter Quill editor.

## Installation

To set up and run the Notes App, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Amanbig/notes_app.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd notes_app
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## Usage

After installing the app, you can:

- **Create New Notes:** Tap the floating action button (`+`) to add a new note.
- **Edit Notes:** Select a note to open the editor and modify its content.
- **Delete Notes:** Swipe left on a note or use the delete icon to remove it.
- **View Notes:** See a list of all notes on the main screen.

## Code Overview

- **`lib/models/`**: Contains data models and Hive database interactions.
    - `note.dart`: Defines the `Note` model.
    - `notes_data.dart`: Manages the state and interactions with Hive.
    - `hive_database.dart`: Handles Hive database operations.

- **`lib/pages/`**: Contains the user interface for the app.
    - `home_page.dart`: The main page where notes are listed.
    - `editing_note_page.dart`: The page for creating or editing notes.

- **`lib/main.dart`**: Entry point of the application. Sets up the provider and initializes Hive.

## Contributing

If you would like to contribute to this project, please fork the repository and create a pull request with your changes.
