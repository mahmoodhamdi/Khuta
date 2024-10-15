# Day 1: Requirement Analysis

## 1. Stakeholders

| **Stakeholder**    | **Role**                                               |
|--------------------|--------------------------------------------------------|
| **Parents**        | - Add tasks for the children<br>- Review task completion<br>- Monitor rewards (points and avatars) |
| **Teachers**       | - Same role as parents, but in a classroom setting     |
| **Children (ADHD)**| - Complete tasks<br>- Receive encouragement via AI bot<br>- Play games for rewards<br>- Focus using the Pomodoro timer |
| **Developers**     | - Implement the app features, ensure functionality, and fix bugs |

---

## 2. Functional Requirements

### To-Do List

- Parents/Teachers can create tasks for the children.
- Tasks must have deadlines or reminders.
- Children cannot create or modify tasks, only mark them as completed.
- Task completion should trigger encouraging phrases.

### AI Bot

- The AI bot will read tasks aloud when needed.
- The AI bot will encourage children after task completion.

### Pomodoro Timer

- The timer helps children focus using 25-minute work intervals with 5-minute breaks.
- It should work offline and sync with Firebase when online.

### Reminder

- Local notifications will remind the child about tasks and deadlines.
- Notifications should function offline using SQLite.

### Game

- Implement a game (math puzzles or logic puzzles) with increasing difficulty levels.
- Each level completion will play a sound effect as a reward.
- The child earns avatars after completing levels successfully.

### Text-to-Speech (TTS)

- When the child struggles with reading, they can click on words, and the app will read the word out loud using TTS.
  
### Points System

- Task completion and game achievements reward points.
- Points can be spent on unlocking higher-level avatars.

### Synchronization

- Sync all tasks, points, and avatar data between local storage (SQLite) and Firebase when online.

---

## 3. Non-Functional Requirements

### Performance

- The app should run smoothly on both low-end and high-end devices.
  
### Security

- Data should be securely stored and synced (Firebase authentication and rules).
- Only authorized users (parents, teachers) can add or modify tasks.

### Scalability

- The app must support multiple children under a single account (family or classroom setup).

### Usability

- The app must be user-friendly, especially for children with ADHD.
  
### Offline Functionality

- The app should work fully offline with local storage via SQLite.
- Sync all data with Firebase once back online.

---

## 4. Success Criteria

- **Data Syncing**: Smooth synchronization of tasks, points, and avatar data between local (SQLite) and Firebase (remote).
- **User Engagement**: Children should be motivated to complete tasks with the help of the AI bot and rewards.
- **Offline Capability**: The app should work completely offline, and all data should sync when online again.
- **Smooth UI/UX**: The app should be easy to navigate, particularly for children with ADHD, with clear rewards for completing tasks and levels.
  
---

### Deliverables for Day 1

- Documented functional and non-functional requirements.
- Stakeholder map identifying users (parents, teachers, children).
- A list of success criteria to measure project effectiveness.
