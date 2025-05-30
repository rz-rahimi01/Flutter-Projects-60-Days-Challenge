# 📝 Week 6 – Sentiment Journal App (AI-Powered)

Welcome to Week 6 of my **60 Days Flutter Challenge**!  
This week, I built an **AI-powered Sentiment Journal App** that allows users to write daily journal entries, analyzes their mood using a sentiment API, and displays animations and colors to reflect the mood.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                       | Concepts & Widgets |
|-----|-----------------------------------|---------------------|
| 1   | Text Input + Firestore Integration | TextField, Button, cloud_firestore |
| 2   | Connect to AI API (Sentiment)     | HTTP, REST API, async, JSON |
| 3   | List Entries + Filter by Mood     | ListView, DropdownButton |
| 4   | Lottie Animations                 | lottie, conditional rendering |
| 5   | UI Polish         | Card, Padding,|
| 6   | Dialogs            | AlertDialog, DateTime logic, Dismissible |
| 7   | Final Review & Demo               | Cleanup, README, Dark Mode Toggle |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Text Input + Firestore Setup
- Created a multi-line TextField for journal entry.
- Connected to Firebase and stored journal entry with timestamp.
- **Challenge**: Added loading spinner during submission.
- **Widgets**: TextField, ElevatedButton, cloud_firestore, CircularProgressIndicator.

### 📌 Day 2: AI API for Sentiment Analysis
- Sent the journal text to a sentiment API (mocked or real).
- Parsed and saved the mood result (positive/neutral/negative).
- **Challenge**: Displayed a snackbar with the detected sentiment.
- **Packages**: http, Provider, async/await.

### 📌 Day 3: Display Journal Entries 
- Showed all entries in a scrollable list with date and emoji.

- **Challenge**: Highlighted mood with colored cards.
- **Widgets**: ListView, Card, DropdownButton, Text.

### 📌 Day 4: Mood Animations with Lottie
- Displayed mood-based animations using Lottie files.
- Linked animation to detected sentiment.
- **Challenge**: Fade-in effect for animations.
- **Package**: lottie, AnimatedOpacity.

### 📌 Day 5: UI Polish
- Improved layout using padding, spacing, and Card UI.
- **Challenge**: Animated card color by sentiment using AnimatedContainer.

### 📌 Day 6:  Confirmation Dialogs

- Added confirmation dialogs before deletion.
- **Challenge**: Added Dismissible swipe to delete.
- **Widgets**: AlertDialog, DateTime, Dismissible.

### 📌 Day 7: Review & Finalization
- Cleaned up and organized files and folders.
- Added comments and pushed project to GitHub.
- **Challenge**: Added dark/light mode toggle.
- **Widgets**: ThemeMode, IconButton.

---

## 📸 Final App Output

| Sentiment Journal App |
|------------------------|
| <img src="../../Outputs/Week 6.png" width="250" height="500" /> |

---

## ✅ Week 6 Goals Recap

| Status | Goal                                      |
|--------|--------------------------------------------|
| ☐     | Write journal entries                     |
| ☐     | Analyze mood using a sentiment API        |
| ☐     | Display entries with mood indicators      |
| ☐     | Add Lottie animations for moods           |
| ☐     | confirmation dialogs  |
| ☐     | Add light/dark theme toggle               |
| ☐     | Clean and review all code          |

---

## 🧩 Concepts Learned

- Integrating Firebase Firestore to store structured user input.
- Making HTTP requests to an AI API for sentiment detection.
- Using Provider for state management across async operations.
- Displaying filtered data with ListView.
- Adding engaging Lottie animations based on logic.
- Enhancing UX with loading indicators, alerts, and animated UI.
- Managing date comparisons.
- Toggling light/dark mode dynamically with Flutter theming.
- Writing maintainable code with comments and clean architecture.


