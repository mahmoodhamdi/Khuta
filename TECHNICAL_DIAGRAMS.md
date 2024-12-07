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
    participant P as Parent/Teacher
    participant A as App
    participant DB as Database
    participant C as Calculator

    P->>A: Start Assessment
    A->>DB: Load Questions
    DB-->>A: Return Questions
    A->>P: Display Questions
    P->>A: Submit Answers
    A->>C: Calculate Scores
    C->>A: Return Results
    A->>DB: Save Results
    A->>P: Display Analysis
```

## Component Diagram

```mermaid
graph TD
    A[UI Layer] -->|User Input| B(Assessment Module)
    B -->|Data| C(Database Layer)
    B -->|Calculation| D(Scoring Engine)
    D -->|Results| B
    B -->|Display| A
    E[Authentication] -->|Security| A
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
