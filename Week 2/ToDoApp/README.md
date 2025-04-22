
# 📱 Week 2 - To Do App

Welcome to Week 2 of my **60 Days Flutter Challenge**!  
This week, I focused on creating a **To-Do List App** to practice user input, managing dynamic lists, and handling simple app logic using `setState` (and optionally `Provider`).

---

## 🗓️ Weekly Overview

| Day | Focus Areas                | Concepts & Widgets |
|-----|----------------------------|---------------------|
| 1   | Text Input + Controller    | `TextField`, `TextEditingController`, `ElevatedButton` |
| 2   | Display List + `setState`  | `ListView.builder`, `Card`, `ListTile` |
| 3   | Delete & Complete Task     | `Dismissible`, `CheckboxListTile` |
| 4   | Polish UI                  | `Padding`, `SizedBox`, `Divider`, `Icon`, `Container` |
| 5   | Optional: Use Provider     | `ChangeNotifier`, `Consumer`, `Provider` |
| 6–7 | Final Review & Refactor    | Clean code, test, screenshot, document |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Text Input & Button
- Created a `TextField` with a controller.
- Printed input on button press.
- **Challenge**: Prevent empty input submissions.
- **Widgets**: `TextField`, `TextEditingController`, `ElevatedButton`.

### 📌 Day 2: Managing Dynamic Task List
- Displayed user-entered tasks in a list.
- Cleared input after adding.
- **Widgets**: `ListView.builder`, `Card`, `ListTile`.

### 📌 Day 3: Swipe to Delete & Checkbox Toggle
- Enabled swipe-to-delete via `Dismissible`.
- Toggled task completion using `CheckboxListTile`.
- **Challenge**: Apply strikethrough style to completed tasks.
- **Widgets**: `Dismissible`, `CheckboxListTile`.

### 📌 Day 4: UI Improvements
- Added padding, icons, spacing, and separators.
- Focused on making the app clean and user-friendly.
- **Widgets**: `Padding`, `SizedBox`, `Divider`, `Icon`, `Container`.

### 📌 Day 5: Try Provider (Optional)
- Refactored to use `ChangeNotifier` and `Provider` (optional).
- Moved task list logic out of `StatefulWidget`.
- **Challenge**: Match existing functionality using Provider.

### 📌 Day 6–7: Finalization
- Cleaned up code and added comments.
-  Added AppBar Buttons.
- Improved UI.
- ✅ **Challenge**: Fully functional UI with clear, testable logic.

---

## 📸 Final App Output

| To-Do List App |
|----------------|
| <img src="../../Outputs/Week 2.png" width="250" height="500" /> |

---

## 🧩 Concepts Learned

- Taking user input with `TextField` and `TextEditingController`.
- Using `ListView.builder (Separated)` to render dynamic task lists.
- Implementing `setState` to update UI reactively.
- Handling actions like delete and complete with `Dismissible` and `CheckboxListTile`.
- Improving UI using layout widgets like `Padding`, `SizedBox`, and `Container`.
- Optionally managing state using `Provider` and `ChangeNotifier`.
- Writing cleaner, testable code and refactoring.
- Pushing structured project updates to GitHub with documentation.

---

## 🚀 How to Run This App

```bash
git clone https://github.com/YOUR_USERNAME/flutter-projects-60day-challenge.git
cd Week\ 2/ToDoApp
flutter pub get
flutter run
```
