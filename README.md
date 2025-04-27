# Flutter Firebase Authentication App

This project is a **Flutter** application built for **Android devices**.  
It was developed as part of a college course project for **"Labs in Android Applications"**.

The app includes:
- **Sign Up** functionality (register new users)
- **Sign In** functionality (authenticate existing users)
- **Home Page** after successful login
- Full **Firebase** integration for authentication

---

## Features

✅ User Registration (Sign Up)  
✅ User Login (Sign In)  
✅ Secure authentication using **Firebase Authentication**  
✅ Simple and clean Home Page after login  
✅ Error handling for authentication processes (like invalid credentials)

---

## Technologies Used

- [Flutter](https://flutter.dev/) (Dart language)
- [Firebase Authentication](https://firebase.google.com/products/auth)
- [Firebase Console](https://console.firebase.google.com/) for backend management
- Android SDK / Emulator or Physical Device

---

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Install Flutter packages:**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase:**
   - Create a Firebase project.
   - Add an Android app to your Firebase project.
   - Download the `google-services.json` file and place it in the `android/app/` directory.
   - Enable **Authentication** -> **Email/Password** provider in the Firebase console.

4. **Run the app:**
   ```bash
   flutter run
   ```

---

## Project Structure (Basic)

```
/lib
 ├── main.dart
 ├── pages/
 │    ├── login_page.dart
 │    ├── signup_page.dart
 │    └── home_page.dart
 ├── services/
 │    └── auth_service.dart
```

- `main.dart` - Entry point
- `pages/` - UI pages (Login, Sign Up, Home)
- `services/` - Authentication logic (Firebase connection)

---

## Notes

- This project is **still under development**.
- After building the login system, additional features and pages will be added based on the course requirements.
- Designed for learning purposes in the **Labs in Android Applications** course.

---

## Future Plans

- Add profile management (edit username, email, etc.)
- Implement password reset functionality
- Build additional app features such as to-do lists, posts, or notes
- Improve UI/UX with animations and responsive design
- Add push notifications via Firebase Cloud Messaging (optional)

---

## Screenshots (coming soon)

_(Once UI is fully built, screenshots can be added here)_

---

## License

This project is licensed for educational purposes.
