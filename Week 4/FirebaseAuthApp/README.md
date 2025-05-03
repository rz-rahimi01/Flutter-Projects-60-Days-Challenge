
# 🔐 Week 4 - Firebase Auth + Login UI

Welcome to Week 4 of my **60 Days Flutter Challenge**!  
This week’s goal was to build a **basic authentication flow** using Firebase. I focused on integrating Firebase into Flutter, creating login and registration forms, validating input, and managing authentication state using Provider.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                  | Concepts & Widgets |
|-----|-------------------------------|---------------------|
| 1   | Firebase Setup                | Firebase Console, firebase_core, firebase_auth |
| 2   | Login UI + Form Validation   | Form, TextFormField, TextEditingController |
| 3   | Login Logic with Firebase    | FirebaseAuth, SignIn with Email and Password |
| 4   | Registration Screen          | Navigator, Form, password validation |
| 5   | Auth State + Provider        | ChangeNotifier, Provider, auth flow |
| 6–7 | Final Review + Logout Flow   | Cleanup, UI polish, FirebaseAuth.signOut |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Firebase Setup
- Created a Firebase project in the console.
- Integrated Firebase into Flutter using `firebase_core`.
- Initialized Firebase in `main.dart`.
- Enabled Email/Password sign-in in Firebase Auth.
- **Challenge**: Printed "Firebase Initialized" on successful setup.
- **Packages**: `firebase_core`, `firebase_auth`.

### 📌 Day 2: Login UI + Form Validation
- Designed login screen with email/password fields using `TextFormField`.
- Wrapped fields in a `Form` with validation.
- Added "Login" button using `ElevatedButton`.
- **Challenge**: Disabled login button when fields are empty or invalid.

### 📌 Day 3: Login with FirebaseAuth
- Added Firebase login logic using `signInWithEmailAndPassword`.
- Navigated to home screen on success.
- Handled errors using `SnackBar`.
- **Challenge**: Displayed clean error messages for wrong credentials.

### 📌 Day 4: Registration Screen
- Built a separate register screen with the same form structure.
- Navigated between login and register using `Navigator.push/pop`.
- **Challenge**: Enforced minimum password length (6+ characters).

### 📌 Day 5: Auth State + Provider
- Created `AuthProvider` using `ChangeNotifier`.
- Stored and observed auth state.
- Automatically redirected to login or home based on user state.
- **Challenge**: Added loading indicator while logging in/registering.

### 📌 Day 6–7: Final Review + Logout
- Styled all forms with consistent input decoration and padding.
- Added a logout button that signs out the user.
- **Challenge**: Added logout confirmation dialog and showed user email on home screen.

---

## 📸 Final App Output

| Firebase Auth App |
|-------------------|
| <img src="../../Outputs/Week4.png" width="250" height="500" /> |

---

## ✅ Week 4 Goals Recap

| Status | Goal                                 |
|--------|---------------------------------------|
| ☐      | Set up Firebase + connect to Flutter |
| ☐      | Design login UI with validation      |
| ☐      | Implement login via Firebase         |
| ☐      | Create register screen + validation  |
| ☐      | Manage auth state with Provider      |
| ☐      | Add logout + final polish            |

---

## 🧩 Concepts Learned

- Firebase setup in Flutter using `firebase_core` and `firebase_auth`.
- Form validation using `Form`, `TextFormField`, and `GlobalKey<FormState>`.
- Authenticating users with `signInWithEmailAndPassword` and `createUserWithEmailAndPassword`.
- Navigating between screens using `Navigator.push` and `Navigator.pop`.
- Managing authentication state using `Provider` and `ChangeNotifier`.
- Showing conditional UI (login/home) based on login status.
- Using `SnackBar` and dialog widgets for feedback and alerts.
- Ensuring clean app architecture and file structure.

---

## 🚀 How to Run This App

```bash
git clone https://github.com/YOUR_USERNAME/flutter-projects-60day-challenge.git
cd Week\ 4/FirebaseAuthApp
flutter pub get
flutter run
```