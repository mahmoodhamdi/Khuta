# مخطط قاعدة البيانات لتطبيق "خُطى" (MVP)

## الجداول الرئيسية

### جدول المستخدمين (users)

```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    user_type TEXT NOT NULL CHECK (user_type IN ('parent', 'specialist', 'admin')),
    full_name TEXT NOT NULL,
    phone_number TEXT,
    profile_image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
```

### جدول الأطفال (children)

```sql
CREATE TABLE children (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK (gender IN ('male', 'female')),
    medical_history TEXT,
    current_medications TEXT,
    allergies TEXT,
    special_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### جدول التقييمات (assessments)

```sql
CREATE TABLE assessments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    child_id INTEGER NOT NULL,
    assessment_type TEXT NOT NULL,
    score INTEGER NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (child_id) REFERENCES children(id)
);
```

### جدول الأسئلة (questions)

```sql
CREATE TABLE questions (
    id TEXT PRIMARY KEY,
    category TEXT NOT NULL,
    text TEXT NOT NULL,
    type TEXT CHECK (type IN ('scale', 'boolean', 'text')),
    options JSON,
    scoring_rules JSON,
    weight FLOAT
);
```

### جدول الإجابات (responses)

```sql
CREATE TABLE responses (
    id TEXT PRIMARY KEY,
    assessment_id TEXT NOT NULL,
    question_id TEXT NOT NULL,
    answer TEXT NOT NULL,
    score FLOAT,
    notes TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id)
);
```

### جدول النتائج (results)

```sql
CREATE TABLE results (
    id TEXT PRIMARY KEY,
    assessment_id TEXT NOT NULL,
    total_score FLOAT NOT NULL,
    severity_level TEXT CHECK (severity_level IN ('mild', 'moderate', 'severe')),
    recommendations TEXT,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id) ON DELETE CASCADE
);
```

### جدول التقدم (progress)

```sql
CREATE TABLE progress (
    id TEXT PRIMARY KEY,
    child_id TEXT NOT NULL,
    period TEXT NOT NULL,
    score_change FLOAT NOT NULL,
    improvement_areas JSON,
    challenges JSON,
    notes TEXT,
    FOREIGN KEY (child_id) REFERENCES children(id) ON DELETE CASCADE
);
```

### جدول الإعدادات (settings)

```sql
CREATE TABLE settings (
    user_id TEXT PRIMARY KEY,
    preferences JSON,
    notifications JSON,
    theme TEXT,
    system_settings JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### جدول السجلات (logs)

```sql
CREATE TABLE logs (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    action TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details JSON,
    ip_address TEXT,
    user_agent TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

## الفهارس الأساسية (Basic Indexes)

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_children_parent ON children(parent_id);
CREATE INDEX idx_assessments_child ON assessments(child_id);
CREATE INDEX idx_responses_assessment ON responses(assessment_id);
CREATE INDEX idx_results_assessment ON results(assessment_id);
CREATE INDEX idx_questions_category ON questions(category);
