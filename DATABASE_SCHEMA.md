# مخطط قاعدة البيانات لتطبيق "خُطى" (MVP)

## الجداول الرئيسية

### جدول المستخدمين (users)

```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    user_type TEXT NOT NULL CHECK (user_type IN ('parent', 'specialist')),
    full_name TEXT NOT NULL,
    phone_number TEXT,
    profile_image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
```

### جدول الوالدين (parents)

```sql
CREATE TABLE parents (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    address TEXT,
    emergency_contact TEXT,
    preferred_contact_method TEXT CHECK (preferred_contact_method IN ('email', 'phone', 'app')),
    notification_settings JSON,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### جدول المتخصصين (specialists)

```sql
CREATE TABLE specialists (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    specialization TEXT NOT NULL,
    license_number TEXT,
    education TEXT,
    years_of_experience INTEGER,
    availability_schedule JSON,
    max_patients INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### جدول الأطفال (children)

```sql
CREATE TABLE children (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    specialist_id TEXT,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK (gender IN ('male', 'female')),
    school_name TEXT,
    grade_level TEXT,
    medical_history TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES parents(id) ON DELETE CASCADE,
    FOREIGN KEY (specialist_id) REFERENCES specialists(id) ON DELETE SET NULL
);
```

### جدول التقييمات (assessments)

```sql
CREATE TABLE assessments (
    id TEXT PRIMARY KEY,
    child_id TEXT NOT NULL,
    assessor_id TEXT NOT NULL,
    assessment_type TEXT NOT NULL CHECK (assessment_type IN ('parent', 'teacher', 'self')),
    start_time TIMESTAMP NOT NULL,
    completion_time TIMESTAMP,
    status TEXT CHECK (status IN ('in_progress', 'completed', 'cancelled')),
    raw_score INTEGER,
    t_score FLOAT,
    percentile FLOAT,
    ai_analysis_result JSON,
    recommendations TEXT,
    notes TEXT,
    FOREIGN KEY (child_id) REFERENCES children(id) ON DELETE CASCADE,
    FOREIGN KEY (assessor_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### جدول أسئلة التقييم (assessment_questions)

```sql
CREATE TABLE assessment_questions (
    id TEXT PRIMARY KEY,
    question_text TEXT NOT NULL,
    category TEXT NOT NULL,
    subcategory TEXT,
    question_order INTEGER NOT NULL,
    scoring_weight FLOAT DEFAULT 1.0,
    age_group TEXT,
    is_reverse_scored BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### جدول إجابات التقييم (assessment_answers)

```sql
CREATE TABLE assessment_answers (
    id TEXT PRIMARY KEY,
    assessment_id TEXT NOT NULL,
    question_id TEXT NOT NULL,
    answer_value INTEGER NOT NULL CHECK (answer_value BETWEEN 0 AND 3),
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES assessment_questions(id)
);
```

### جدول المحادثات (conversations)

```sql
CREATE TABLE conversations (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    specialist_id TEXT NOT NULL,
    child_id TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_message_at TIMESTAMP,
    status TEXT CHECK (status IN ('active', 'archived', 'blocked')),
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id),
    FOREIGN KEY (child_id) REFERENCES children(id)
);
```

### جدول الرسائل (messages)

```sql
CREATE TABLE messages (
    id TEXT PRIMARY KEY,
    conversation_id TEXT NOT NULL,
    sender_id TEXT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMP,
    message_type TEXT CHECK (message_type IN ('text', 'report', 'recommendation')),
    attachment_url TEXT,
    FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(id)
);
```

### جدول التقارير (reports)

```sql
CREATE TABLE reports (
    id TEXT PRIMARY KEY,
    assessment_id TEXT NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    report_type TEXT CHECK (report_type IN ('summary', 'detailed', 'progress')),
    report_data JSON,
    recommendations JSON,
    shared_with JSON,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE
);
```

### الفهارس الأساسية (Basic Indexes)

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_children_parent ON children(parent_id);
CREATE INDEX idx_children_specialist ON children(specialist_id);
CREATE INDEX idx_assessments_child ON assessments(child_id);
CREATE INDEX idx_messages_parent ON messages(conversation_id);
CREATE INDEX idx_messages_specialist ON messages(conversation_id);
CREATE INDEX idx_questions_category ON assessment_questions(category);
CREATE INDEX idx_results_assessment ON assessment_answers(assessment_id);
