# المخططات التقنية لتطبيق "خُطى"

## Class Diagram

```mermaid
classDiagram
    class User {
        +String userId
        +String email
        +String password
        +DateTime createdAt
        +registerUser()
    }

    class Child {
        +String childId
        +String parentId
        +String name
        +int age
        +String gender
        +getAssessments()
    }

    class Assessment {
        +String assessmentId
        +String childId
        +DateTime date
        +String assessorType
        +calculateScores()
        +generateRecommendations()
    }

    class Result {
        +String resultId
        +String assessmentId
        +String category
        +int rawScore
        +int tScore
        +String interpretation
    }

    User "1" -- "*" Child
    Child "1" -- "*" Assessment
    Assessment "1" -- "*" Result

## Use Case Diagram

```mermaid
graph TD
    A[Parent/Guardian] -->|Register| B(Create Account)
    A -->|Login| C(Access Dashboard)
    C -->|Add Child| D(Child Profile)
    D -->|Start Assessment| E(Conners Assessment)
    E -->|Complete| F(View Results)
    F -->|Generate| G(Treatment Plan)
    G -->|Track| H(Daily Activities)
    H -->|Update| I(Progress Tracking)
    I -->|Generate| J(Progress Reports)
    A -->|View| K(Historical Data)
    A -->|Manage| L(Settings)
```
graph TD
    A[Parent/Teacher] -->|Register| B(Create Account)
    A -->|Login| C(Access Dashboard)
    C -->|Start Assessment| D(Answer Questions)
    D -->|Submit| E(Calculate Results)
    E -->|View| F(Analysis & Recommendations)
    F -->|Track Progress| G(Compare Results Over Time)

## Sequence Diagram - Assessment Flow

```mermaid
sequenceDiagram
    participant U as User
    participant A as App
    participant DB as Database
    participant R as Report Generator

    U->>A: Start Assessment
    A->>DB: Load Questions
    DB-->>A: Return Questions
    A->>U: Display Questions
    U->>A: Submit Answers
    A->>DB: Save Answers
    A->>A: Calculate Score
    A->>DB: Save Results
    A->>R: Generate Report
    R-->>A: Return Report
    A->>U: Display Results & Recommendations
```

## Component Diagram

```mermaid
graph TD
    A[UI Layer] -->|API Calls| B(Business Logic Layer)
    B -->|Data Access| C(Data Layer)
    B -->|Services| D(External Services)
    
    subgraph UI Components
        A1[Authentication UI]
        A2[Assessment UI]
        A3[Dashboard UI]
        A4[Reports UI]
    end
    
    subgraph Business Logic
        B1[Auth Service]
        B2[Assessment Service]
        B3[Treatment Service]
        B4[Report Service]
    end
    
    subgraph Data Layer
        C1[Local Storage]
        C2[SQLite Database]
        C3[File Storage]
    end
```

## State Diagram - Assessment Process

```mermaid
stateDiagram-v2
    [*] --> Registration
    Registration --> Profile
    Profile --> Assessment
    Assessment --> InProgress
    InProgress --> Completed
    Completed --> Analysis
    Analysis --> PlanGeneration
    PlanGeneration --> Implementation
    Implementation --> Monitoring
    Monitoring --> Evaluation
    Evaluation --> [*]
```
