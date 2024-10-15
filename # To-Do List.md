# To-Do List

| **Day**  | **Main Task**                           | **Sub-Task**                                        | **Details**                                      |
|----------|------------------------------------------|----------------------------------------------------|-------------------------------------------------|
| **Day 1**| Requirement Analysis                     | Gather Requirements                                | Collect and document all functional requirements. |
| **Day 2**| Requirement Analysis                     | Define Technical Stack                             | Choose Firebase for cloud storage and SQLite for local storage. |
| **Day 3**| UI/UX Design                             | Design Initial Wireframes                          | Use Figma or Sketch to create wireframes for core screens. |
| **Day 4**| UI/UX Design                             | Create High-Fidelity Mockups                       | Create detailed visual designs for all app screens. |
| **Day 5**| Clean Architecture Setup                 | Define Layers (Domain, Data, Presentation)         | Define responsibilities and entities for each layer. |
| **Day 6**| Project Initialization                   | Create Flutter Project                             | Initialize the project with a folder structure following Clean Architecture. |
| **Day 7**| State Management Setup                   | Setup Bloc/Cubit for To-Do List                    | Set up Bloc/Cubit to manage To-Do List state (local & remote sync). |
| **Day 8**| Local Database Setup                     | Configure SQLite                                   | Implement SQLite for local task storage. |
| **Day 9**| Cloud Database Setup                     | Configure Firebase Firestore                       | Set up Firestore for remote task storage and syncing with local database. |
| **Day 10**| Domain Layer                            | Define Entities for Tasks and Points               | Create task, reward, and point entities (models). |
| **Day 11**| Data Layer                              | Implement Task Repositories                        | Create repositories to interact with both SQLite (local) and Firebase (remote). |
| **Day 12**| Data Layer                              | Implement Points Repositories                      | Create points repository for handling local (SQLite) and remote (Firestore) data. |
| **Day 13**| Presentation Layer                      | Build To-Do List UI                                | Create UI for displaying tasks (ListView/GridView with local data from SQLite). |
| **Day 14**| Presentation Layer                      | Add Task Input Form                                | Design a form for parents/teachers to input tasks (syncing to Firebase). |
| **Day 15**| To-Do List Logic                        | Connect Bloc to To-Do UI                           | Link Bloc with the To-Do List UI to display and sync tasks (local and remote). |
| **Day 16**| Reminder Setup                          | Setup Local Notifications                          | Use `flutter_local_notifications` for scheduling task reminders (local). |
| **Day 17**| Firebase Sync Setup                     | Implement Sync Mechanism                           | Sync task data between SQLite (offline) and Firebase (online). |
| **Day 18**| AI Bot Integration                      | Integrate ML Kit or Firebase ML                    | Set up Google ML Kit for text recognition and Firebase functions for responses. |
| **Day 19**| AI Bot Development                      | Develop AI Response Logic                          | Use `Dialogflow` or `Rasa` for AI bot motivational responses (cloud-based). |
| **Day 20**| Text-to-Speech (TTS) Setup              | Integrate `flutter_tts`                            | Implement TTS to read out words/phrases aloud. |
| **Day 21**| Text-to-Speech (TTS) Usage              | Connect TTS to UI                                  | Allow the child to click on words and trigger TTS reading. |
| **Day 22**| Pomodoro Timer Development              | Design Pomodoro Timer UI                           | Create UI for the timer with start, pause, and reset buttons. |
| **Day 23**| Pomodoro Timer Logic                    | Implement Pomodoro Timer Logic                     | Add logic for 25-minute work cycles and 5-minute breaks (stored locally). |
| **Day 24**| Pomodoro Timer Sync                     | Sync Timer with Task Progress                      | Sync Pomodoro progress (locally in SQLite and remotely in Firestore). |
| **Day 25**| Game Design                             | Define Game Logic and Levels                       | Plan out game levels (math puzzles or logic puzzles). |
| **Day 26**| Game Development                        | Build Simple Game Framework                        | Use `Flame` engine or custom Flutter Widgets for the game. |
| **Day 27**| Game Rewards                            | Add Sound Effects and Avatar Rewards               | Implement sound rewards and avatars for level completion. |
| **Day 28**| Points System                           | Build Points Calculation Logic                     | Develop the logic for awarding points for task and game completion (local and remote sync). |
| **Day 29**| Points System Integration               | Link Points with Task and Game Completion          | Automatically add points to both SQLite and Firestore upon completion. |
| **Day 30**| Avatar Store Development                | Create Avatar Purchase UI                          | Create a screen where children can exchange points for avatars. |
| **Day 31**| Avatar Data Sync                        | Sync Avatar Purchases Locally and Remotely         | Sync avatar purchases between local SQLite and Firestore. |
| **Day 32**| Database Testing                        | Test Data Storage and Retrieval                    | Ensure tasks, points, and avatar data are stored and retrieved from both local and remote databases. |
| **Day 33**| Game Testing                            | Test Game Levels and Rewards                       | Test all game levels and ensure rewards trigger correctly. |
| **Day 34**| Pomodoro and Reminder Testing           | Test Timer and Reminders                           | Verify that Pomodoro and task reminders work properly (local notifications). |
| **Day 35**| Firebase Testing                        | Test Data Sync Between Firebase and SQLite         | Test the synchronization mechanism for data consistency. |
| **Day 36**| Full Application Testing                | Perform End-to-End Testing                         | Test the entire app workflow from task input to task completion and reward system. |
| **Day 37**| Bug Fixing and Optimizations            | Fix Bugs Identified in Testing                     | Fix any bugs found during the testing phase. |
| **Day 38**| Code Refactoring                        | Improve Code Quality                               | Refactor code to improve readability and maintainability. |
| **Day 39**| Performance Optimization                | Optimize App Performance                          | Ensure smooth performance across devices. |
| **Day 40**| Documentation Writing                   | Write Technical Documentation                      | Create comprehensive documentation for the codebase and project. |
| **Day 41**| User Manual Creation                    | Write User Manual                                  | Create an easy-to-understand user guide for parents and teachers. |
| **Day 42**| Play Store/App Store Preparation        | Prepare for App Store Release                      | Set up app icon, splash screen, and prepare build files. |
| **Day 43**| App Store Submission                    | Submit App to Google Play and Apple Store          | Upload the final build to the stores for review. |
| **Day 44**| App Store Bug Fixing                    | Fix Bugs from Store Feedback                       | Address any issues raised during the app store review process. |
| **Day 45**| Final Testing                           | Final Testing on All Devices                       | Test the app on various devices to ensure compatibility. |
| **Day 46**| Project Review and Submission           | Review Entire Project                              | Final review of the project, ensuring all requirements are met. |
