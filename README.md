# 📱 Joke App

A simple yet powerful Flutter application that fetches jokes from an API, caches them for offline access, and presents them with a modern and elegant UI.

---

## 🚀 Features

1. **Fetch Jokes from API**  
   Retrieve jokes seamlessly using the [Official Joke API](https://official-joke-api.appspot.com/).
   
2. **Offline Support with Caching**  
   Leverages `shared_preferences` to cache jokes locally for offline viewing.

3. **Error Handling**  
   Displays user-friendly messages when encountering network or other errors.

4. **Interactive UI**  
   - **Modern Design:** Sleek Material 3 components.  
   - **Refresh Button:** Easily fetch new jokes with a tap.

---

## 📸 Screenshots  

| **Jokes Display**                    | **Loading State**                        | **Error State**                        |
|--------------------------------------|------------------------------------------|----------------------------------------|
| ![Jokes](assets/screenshot_jokes.png) | ![Loading](assets/screenshot_loading.png) | ![Error](assets/screenshot_error.png) |

---

## 🛠️ Technologies Used

- **Flutter**: Framework for building the app.  
- **Dart**: Programming language for the Flutter framework.  
- **HTTP**: Manages API requests.  
- **SharedPreferences**: Provides local caching for offline functionality.

---

## 📦 Folder Structure

```
lib/
 ├── joke_cache.dart             # Local joke caching logic
 ├── joke_service.dart           # API interaction and data fetching
 ├── main.dart                   # Entry point of the application
 ├── widgets/                    # Reusable UI components
 │    └── joke_widget.dart       # Widget for displaying jokes
 ├── assets/                     # Optional assets like images
 └── pubspec.yaml                # Project configuration and dependencies
```

---

## 📝 Installation

Follow these steps to set up and run the app:

### Prerequisites
Ensure you have Flutter installed. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if not already done.

### Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/joke_app.git
   cd joke_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

---

## ⚙️ API Details

This app fetches jokes from the **[Official Joke API](https://official-joke-api.appspot.com/)**.

### Example Response:
```json
[
  {
    "id": 1,
    "type": "general",
    "setup": "Why don't skeletons fight each other?",
    "punchline": "They don't have the guts."
  }
]
```

---

## 🔧 Dependencies

Here’s a list of dependencies used in this app:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0               # Handles API calls
  shared_preferences: ^2.2.2 # Local data storage for offline access
```

---

## 🌟 Contributing

Contributions are welcome! Feel free to fork this repository, make changes, and submit a pull request.

1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Submit a pull request!

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

