# 📖 Week 3 - Quotes App (Navigation + Theme + Provider)

Welcome to Week 3 of my **60 Days Flutter Challenge**!  
This week’s goal was to build a clean and dynamic **Quotes App** to explore navigation, theme toggling (light/dark mode), and deeper state management using **Provider**.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                 | Concepts & Widgets |
|-----|-----------------------------|---------------------|
| 1   | Navigation + Quote UI       | `ListView`, `ListTile`, `Navigator.push`, `MaterialPageRoute`, `Scaffold`, `AppBar` |
| 2   | Light/Dark Mode Theme       | `ThemeData`, `Brightness`, `Switch`, `ChangeNotifier`, `Provider` |
| 3   | Provider Refactor           | `ChangeNotifier`, `Consumer`, `notifyListeners`, folder structure |
| 4   | Favorite Quotes Toggle      | `IconButton`, favorites with Provider, conditional UI |
| 5   | UI Polish + Reusable Widget| `Snackbar`, `Container`, `BoxShadow`, `Padding`, `Clipboard` |
| 6–7 | Finalization + Adding Hive  | Final polish, test, add `hive` package to save favorites |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Project Setup + Navigation
- Set up new Flutter project.
- Created list of quotes using `ListView` and `ListTile`.
- Navigated to a detailed quote view on tap.
- **Widgets**: `ListView`, `ListTile`, `Navigator.push`, `MaterialPageRoute`, `Scaffold`, `AppBar`.
- **Challenge**: Smooth back and forth navigation between screens.

### 📌 Day 2: Theme Toggle with Provider
- Added a light/dark mode toggle using `Switch` in AppBar.
- Theme data stored and toggled using a `ThemeProvider`.
- **Widgets**: `ThemeData`, `Switch`, `ChangeNotifier`, `Provider`.
- **Challenge**: Ensure full theme responsiveness across the app.

### 📌 Day 3: Provider Refactor
- Moved quote logic to `QuoteProvider`.
- Managed theme and quote state via `ChangeNotifier`.
- Introduced `MultiProvider` setup.
- **Widgets**: `ChangeNotifierProvider`, `Consumer`, `Provider.of`.

### 📌 Day 4: Favorite Quotes Feature
- Added heart icon to toggle favorite status.
- Managed favorite state using Provider.
- **Challenge**: Bonus filter to show only favorites on another screen.
- **Widgets**: `IconButton`, `Provider`, `Conditional UI`.

### 📌 Day 5: UI Polish + QuoteCard Widget
- Added different Categories.
- New add to favourite technique.
- Added shadows, spacing, and rounded corners.
- Applied theme-aware colors using `Theme.of(context)`.
  

### 📌 Day 6–7: Final Review & Refactor
- Cleaned project structure and added comments.
- Added copy to clipboard option.
- Added many more quotes (150+)
- Final tests: navigation, theme toggle, favorites.
- Added `Hive` to store the favorites now favorites will be saved even after app close.
- **Challenge**: Added toast/snackbar when favoriting a quote.

---

## 📸 Final App Output

| Quotes App |
|------------|
| <img src="../../Outputs/Week 3.png" width="250" height="500" /> |

---

## ✅ Week 3 Goals Recap

| Status | Goal                                   |
|--------|----------------------------------------|
| ☐      | Basic quote list + navigation          |
| ☐      | Theme toggle (light/dark)              |
| ☐      | Refactor with Provider                 |
| ☐      | Favorite quotes feature                |
| ☐      | Different Categories                   |
| ☐      | Polish UI + Hive +|

---

## 🧩 Concepts Learned

- Navigating between screens using `Navigator.push` and `MaterialPageRoute`.
- Building scrollable lists with `ListView` and `ListTile`.
- Managing app-wide state using `Provider` and `ChangeNotifier`.
- Toggling themes and dynamically changing `ThemeData`.
- Different types of quote categories.
- Handling user interactions with icons and conditional UI.
- Copy qoute using clipboard option.
- Refactoring app structure for clarity and scalability.
- Using `Hive` to store favoirte things.
- Testing and documenting projects before uploading.

---

## 🚀 How to Run This App

```bash
git clone https://github.com/YOUR_USERNAME/flutter-projects-60day-challenge.git
cd Week\ 3/QuotesApp
flutter pub get
flutter run
```
