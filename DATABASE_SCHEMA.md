# مخطط قاعدة البيانات لتطبيق "خُطى" (MVP)

## الجداول الرئيسية

### جدول المستخدمين (users)
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE,
    password_hash TEXT NOT NULL,
    user_type TEXT NOT NULL, -- parent/specialist
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

### جدول الوالدين (parents)
CREATE TABLE parents (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

### جدول المتخصصين (specialists)
CREATE TABLE specialists (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    specialization TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

### جدول الأطفال (children)
CREATE TABLE children (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    specialist_id TEXT,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    notes TEXT,
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);

### جدول الأسئلة (assessment_questions)
CREATE TABLE assessment_questions (
    id TEXT PRIMARY KEY,
    question_text TEXT NOT NULL,
    category TEXT NOT NULL, -- مثل: Conduct, Hyperactivity, etc.
    question_order INTEGER NOT NULL
);

### جدول التقييمات (assessments)
CREATE TABLE assessments (
    id TEXT PRIMARY KEY,
    child_id TEXT NOT NULL,
    assessor_type TEXT NOT NULL, -- parent/teacher
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    answers JSON NOT NULL,
    score INTEGER,
    recommendations TEXT,
    FOREIGN KEY (child_id) REFERENCES children(id)
);

### جدول النتائج (assessment_results)
CREATE TABLE assessment_results (
    id TEXT PRIMARY KEY,
    assessment_id TEXT NOT NULL,
    category TEXT NOT NULL, -- Conduct, Hyperactivity, etc.
    raw_score INTEGER NOT NULL,
    t_score INTEGER NOT NULL,
    interpretation TEXT,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id)
);

### جدول الرسائل (messages)
CREATE TABLE messages (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    specialist_id TEXT NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);

### الفهارس الأساسية (Basic Indexes)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_children_parent ON children(parent_id);
CREATE INDEX idx_children_specialist ON children(specialist_id);
CREATE INDEX idx_assessments_child ON assessments(child_id);
CREATE INDEX idx_messages_parent ON messages(parent_id);
CREATE INDEX idx_messages_specialist ON messages(specialist_id);
CREATE INDEX idx_questions_category ON assessment_questions(category);
CREATE INDEX idx_results_assessment ON assessment_results(assessment_id);
