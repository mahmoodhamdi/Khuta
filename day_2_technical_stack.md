# Day 2: Technical Stack and Architecture Planning

## 1. Technical Stack

### Frontend

- **Framework**: Flutter
- **State Management**: Flutter Bloc
- **Local Storage**: SQLite
- **Remote Storage**: Firebase
  - Firestore for database
  - Firebase Auth for authentication
- **Text-to-Speech**: `flutter_tts` package
- **AI Bot Integration**: OpenAI API or Dialogflow

### Backend

- **Firebase**:
  - Firestore for tasks, points, and user data
  - Firebase Authentication for user management
- **Local DB**: SQLite for offline storage

---

## 2. Architecture Planning

### Clean Architecture Overview

- **Presentation Layer**: UI components and state management using Flutter Bloc
- **Domain Layer**: Business logic, use cases, and models
- **Data Layer**: Repositories for managing data from SQLite and Firebase

### Folder Structure Example

``` tree
lib/
├── main.dart
├── presentation/
│   ├── screens/
│   ├── widgets/
│   └── blocs/
├── domain/
│   ├── models/
│   ├── use_cases/
│   └── repositories/
└── data/
    ├── datasources/
    ├── repositories/
    └── firebase/
```

---

## 3. Define Use Cases

- Adding tasks by parents/teachers
- Retrieving tasks for children
- Marking tasks as complete
- Fetching game levels and rewards

---

## 4. Documentation

- Document the technical stack and architecture plan.
