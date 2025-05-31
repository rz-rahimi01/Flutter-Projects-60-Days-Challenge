# 📝 Week 7 – Tech Learning Hub App

Welcome to Week 7 of my **60 Days Flutter Challenge**!  
This week, I built a **Syntax Hub App** that streams educational YouTube videos categorized by tech topics like Python, Flutter, and Java. It includes Firestore integration, video playback, bookmarking, and light/dark theme switching.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                        | Concepts & Widgets |
|-----|------------------------------------|---------------------|
| 1   | Firebase Setup + Firestore Schema  | Firebase CLI, cloud_firestore |
| 2   | Category Grid UI                   | GridView, Card, GestureDetector |
| 3   | Video List + Fetching              | Firestore queries, ListView, Shimmer |
| 4   | YouTube Player Integration         | youtube_player_flutter, routing |
| 5   | Bookmarks with Provider            | shared_preferences, ChangeNotifier |
| 6   | Theme Toggle                       | ThemeData, Provider, Switch |
| 7   | Final Review + Firebase Write      | Admin form, testing, GitHub push |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Project Setup & Firebase Init
- Created a new Flutter project: `syntaxhub`.
- Initialized Firebase and Firestore.
- Designed Firestore schema:
  - `courses` collection → `videos` subcollection with title, url, duration, thumbnail, added_on.
- **Challenge**: Successfully fetched and printed course names from Firestore.

### 📌 Day 2: Course Category Grid UI
- Built a GridView of course categories (e.g., Python, Flutter).
- Each item used Card + FontAwesome icons + label.
- Used GestureDetector to navigate to the video list.
- **Widgets**: GridView, Card, font_awesome_flutter, GestureDetector.

### 📌 Day 3: Video List for Course
- Fetched `videos` subcollection based on selected course.
- Displayed each video in a styled Card: thumbnail, title, duration, and play icon.
- **Challenge**: Added a shimmer effect while loading video data.

### 📌 Day 4: YouTube Player Page
- Used `youtube_player_flutter` to embed and autoplay videos.
- Clean player UI with back button, title, and full-screen support.
- Extracted video ID from the full URL before passing to the player.
- **Challenge**: Smooth transition animations between pages.

### 📌 Day 5: Bookmarking Videos
- Added bookmarkProvider using `ChangeNotifier`.
- Bookmarks stored using `shared_preferences`.
- Bookmark icon on each video card with toggle behavior.
- **Challenge**: Created a Bookmarks tab in BottomNavigationBar.

### 📌 Day 6: Theme Toggle (Light/Dark)
- Added themeProvider with dark/light toggle.
- User theme preference saved using `shared_preferences`.
- Instant switch without full rebuild using `notifyListeners()`.
- Toggle added to AppBar in settings.

### 📌 Day 7: Admin Mode + Final Review
- Verified all routes and playback functionality.
- Added ability to manually insert videos via Firestore console or form.
- Wrote documentation and uploaded to GitHub.
- **Challenge**: Documented Firestore schema in README for dev clarity.

---

## 📸 Final App Output

| Syntax Hub |
|-------------------|
| <img src="../../Outputs/Week 7.png" width="250" height="500" /> |

---

## ✅ Week 7 Goals Recap

| Status | Goal                                    |
|--------|------------------------------------------|
| ☐      | Set up Firebase & Firestore structure    |
| ☐      | Display course categories via GridView   |
| ☐      | Fetch & display video list from Firestore|
| ☐      | Integrate YouTube video playback         |
| ☐      | Add bookmarks with persistence           |
| ☐      | Enable light/dark theme toggle           |
| ☐      | Final testing, polish, and GitHub push   |

---

## 🧩 Concepts Learned

- Firebase setup and Firestore collection/subcollection structure.
- GridView and dynamic navigation for category selection.
- Firestore querying and displaying nested data.
- YouTube video embedding with `youtube_player_flutter`.
- Bookmark state management using Provider and `shared_preferences`.
- Theme toggling using `ThemeData` and Provider.
- Documenting Firestore schema and organizing code for scalability.
