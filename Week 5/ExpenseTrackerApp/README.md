# 💰 Week 5 - Expense Tracker App

Welcome to Week 5 of my **60 Days Flutter Challenge**!  
This week, I built the foundation for an **Expense Tracker App** using **Firebase Firestore**, **Provider**, and **clean Flutter architecture**. I focused on modeling data, syncing it with Firestore, and presenting it in a structured and visually clean UI.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                  | Concepts & Widgets |
|-----|-------------------------------|---------------------|
| 1   | Project Setup + Structure    | Firebase, folder structure, AppBar, ListView |
| 2   | Model & Provider Setup       | ChangeNotifier, custom model |
| 3   | Add Expense Form (UI)        | showModalBottomSheet, TextField, DatePicker |
| 4   | Firestore Integration        | add, fetch data from Firestore |
| 5   | Delete from Firestore        | Dismissible, AlertDialog, delete method |
| 6   | UI Polish + Formatting       | Card, intl, currency + date formatting |
| 7   | Review + Final Clean-Up      | Testing, commenting, GitHub docs |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Project Setup & App Structure
- Created a new Flutter project named `expense_tracker`.
- Connected Firebase and Firestore using Firebase CLI and FlutterFire.
- Planned folder structure: `/models`, `/providers`, `/screens`, `/widgets`, `/services`.
- Added base UI with `AppBar`, `FloatingActionButton`, and a placeholder list.
- **Challenge**: Displayed dummy expenses using a placeholder list and `ListView`.

### 📌 Day 2: Expense Model & Provider
- Created `Expense` model with `id`, `title`, `amount`, and `date`.
- Added `toMap` and `fromMap` methods.
- Set up `ExpenseProvider` with `ChangeNotifier` to manage state.
- Wrapped app in `ChangeNotifierProvider`.
- **Challenge**: Used Provider to manage and display dummy data.

### 📌 Day 3: Add Expense Form (UI Only)
- Built a modal bottom sheet for adding expenses.
- Added `TextField` for title and amount, and a `DatePicker`.
- Triggered form using the `FloatingActionButton`.
- **Challenge**: Validated non-empty title and amount > 0.

### 📌 Day 4: Firestore Integration
- Integrated Firestore and synced data with Provider.
- Created methods to add and fetch expenses from Firestore.
- Used `initState`/constructor to fetch data on startup.
- Showed loading indicator while data was being retrieved.
- **Challenge**: Added a real expense and displayed it from Firestore.

### 📌 Day 5: Deleting from Firestore
- Implemented `deleteExpense(String id)` in Provider.
- Used `Dismissible` and `IconButton` to allow deletion.
- Added a confirmation `AlertDialog` before deletion.
- **Challenge**: Displayed a `Snackbar` after successful deletion.

### 📌 Day 6: UI Polish & Formatting
- Styled the list using `Card`, `ListTile`, and `Padding`.
- Formatted date using `intl` package.
- Displayed amount with currency symbol.
- **Challenge**: Matched the look of a professional finance list.

### 📌 Day 7: Review & Finalization
- Reviewed full feature set: add, delete, and sync with Firestore.
- Added null safety checks and in-code documentation.
- Cleaned up file structure and widget logic.
- ✅ **Challenge**: Wrote a clean README and prepared project for GitHub.

---

## 📸 Final App Output

| Expense Tracker App |
|---------------------|
| <img src="../../Outputs/Week 5.png" width="250" height="500" /> |

---

## ✅ Week 5 Goals Recap

| Status | Goal                                  |
|--------|----------------------------------------|
| ☐      | Firebase + Firestore setup            |
| ☐      | Expense model + Provider              |
| ☐      | Add expense form with validation      |
| ☐      | Firestore integration (add + fetch)   |
| ☐      | Delete expenses from Firestore        |
| ☐      | Polish UI with cards and formatting   |
| ☐      | Clean and review all code             |

---

## 🧩 Concepts Learned

- Planning scalable folder structure for larger apps.
- Creating and using data models with `toMap`/`fromMap`.
- Managing app state using `ChangeNotifier` and `Provider`.
- Reading and writing data to Firestore with `cloud_firestore`.
- Handling forms with `TextField`, `Form`, and `showModalBottomSheet`.
- Implementing deletion with confirmation and UI feedback.
- Formatting currency and date using `intl`.
- Writing clean, reusable widgets and separating concerns.

---
