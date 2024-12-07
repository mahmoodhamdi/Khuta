# مخطط قاعدة البيانات لتطبيق "خُطى" (MVP)

## الجداول الرئيسية

### جدول المستخدمين (users)
```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE,
    password_hash TEXT NOT NULL,
    user_type TEXT NOT NULL, -- parent/specialist
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### جدول الوالدين (parents)
```sql
CREATE TABLE parents (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### جدول المتخصصين (specialists)
```sql
CREATE TABLE specialists (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    specialization TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### جدول الأطفال (children)
```sql
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
```

### جدول التقييمات (assessments)
```sql
CREATE TABLE assessments (
    id TEXT PRIMARY KEY,
    child_id TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    answers JSON NOT NULL,
    score INTEGER,
    recommendations TEXT,
    FOREIGN KEY (child_id) REFERENCES children(id)
);
```

### جدول الرسائل (messages)
```sql
CREATE TABLE messages (
    id TEXT PRIMARY KEY,
    parent_id TEXT NOT NULL,
    specialist_id TEXT NOT NULL,
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);
```

### الفهارس الأساسية (Basic Indexes)
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_children_parent ON children(parent_id);
CREATE INDEX idx_children_specialist ON children(specialist_id);
CREATE INDEX idx_assessments_child ON assessments(child_id);
CREATE INDEX idx_messages_parent ON messages(parent_id);
CREATE INDEX idx_messages_specialist ON messages(specialist_id);
```

---
ملاحظة: الجداول والميزات التالية ستضاف في التحديثات المستقبلية:
- جدول المواعيد (appointments)
- جدول خطط العلاج (treatment_plans)
- جدول الأنشطة (activities)
- جدول التقدم (progress)
- جدول الإشعارات (notifications)
- جدول المرفقات (attachments)
