# 📝 Week 8 – AI Toolkit App

Welcome to Week 8 of my **60 Days Flutter Challenge**!  
This week, I built an **AI Toolkit App** powered by Firebase and different AI APIs. The app allows users to rewrite text in various tones and generate images from prompts, with saved history and polished UI.

---

## 🗓️ Weekly Overview

| Day | Focus Areas                         | Concepts & Widgets |
|-----|-------------------------------------|---------------------|
| 1   | Firebase Setup + Project Structure  | Firebase Auth, Firestore, folders |
| 2   | Text Rewriter Feature + API         | TextField, DropdownButton, HTTP, async |
| 3   | Save Text to Firestore              | Firestore, ListView, CRUD |
| 4   | AI Image Generation UI + API        | CachedNetworkImage, async |
| 5   | Save Image to Firebase              | Firestore, Firebase Storage |
| 6   | UI Polish + Theme                   | google_fonts, fluttertoast, theming |
| 7   | Final Review + README + Polish      | Testing, screenshots, GitHub, deployment |

---

## 🧠 Day-by-Day Breakdown

### 📌 Day 1: Setup + Firebase Integration
- Created new Flutter project: `ai_toolkit`.
- Set up Firebase Auth (Anonymous) + Firestore.
- Structured folders: `/models`, `/services`, `/providers`, `/screens`, `/widgets`.
- **Challenge**: Displayed a dummy list of saved text/image results from Firestore using `ListView`.

### 📌 Day 2: Text Rewriter Feature (UI + API)
- Created Text Rewriter screen.
- UI: Text input + tone selector + "Rewrite" button.
- Integrated a mock API (OpenRouter/OpenAI-style).
- **Challenge**: Added a loading spinner and styled result area.

### 📌 Day 3: Save Rewritten Text to Firestore
- Saved both original and rewritten text with tone + timestamp.
- Displayed saved entries in a list on the Home screen.
- **Challenge**: Enabled delete option for old records.

### 📌 Day 4: AI Image Generation
- Created ImageGeneratorScreen with a prompt input and "Generate" button.
- Integrated image generation API (DeepAI/OpenRouter).
- **Challenge**: Displayed result with `CachedNetworkImage`.

### 📌 Day 5: Save Images to Firestore + Storage
- Uploaded prompt + generated image URL to Firestore.
- (Advanced) Optionally downloaded and uploaded images to Firebase Storage.
- **Challenge**: Enabled full-screen view on image tap.

### 📌 Day 6: UI Polish + Dark/Light Mode
- Added custom fonts via `google_fonts`.
- Included icons on buttons, loading indicators for API actions.
- Toasts via `fluttertoast` for quick feedback.
- **Challenge**: Added theme toggle with `Provider`.

### 📌 Day 7: Final Polish + README
- Cleaned code, added comments, tested features.
- Created README + pushed to GitHub.
- Optionally explored Firebase Hosting for web deployment.
- **Challenge**: Documented Firestore structure for future devs.

---

## 📸 Final App Output

| AI Toolkit – Text & Image Generator |
|------------------------------------|
| <img src="../../Outputs/Week 8.png" width="250" height="500" /> |

---

## ✅ Week 8 Goals Recap

| Status | Goal                                        |
|--------|----------------------------------------------|
| ☐      | Project setup with Firebase Auth & Firestore |
| ☐      | Implement Text Rewriter UI + API             |
| ☐      | Save text results and list history           |
| ☐      | Add image generation and display             |
| ☐      | Save and view generated images               |
| ☐      | Polish UI, add themes and UX feedback        |
| ☐      | Final testing, GitHub push, and screenshots  |

---

## 🧩 Concepts Learned

- Firebase Auth and Firestore integration
- Structured Flutter project architecture
- Consuming REST APIs with error handling
- State management with Provider
- Storing and displaying async data from Firestore
- Image handling with `CachedNetworkImage`
- UI/UX enhancements: dark/light theme, fonts, toast messages
- Documenting and deploying real-world apps

---
