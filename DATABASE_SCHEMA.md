# مخطط قاعدة البيانات لتطبيق "خُطى"

## الجداول الرئيسية

### جدول المستخدمين (users)

```sql
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE,
    password_hash TEXT NOT NULL,
    user_type TEXT NOT NULL, -- parent/specialist
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### جدول الوالدين (parents)

```sql
CREATE TABLE parents (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    phone TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### جدول المتخصصين (specialists)

```sql
CREATE TABLE specialists (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    qualification TEXT,
    specialization TEXT,
    working_hours TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### جدول الأطفال (children)

```sql
CREATE TABLE children (
    id TEXT PRIMARY KEY,
    parent_id TEXT,
    specialist_id TEXT,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    school_info TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);
```

### جدول التقييمات (assessments)

```sql
CREATE TABLE assessments (
    id TEXT PRIMARY KEY,
    child_id TEXT,
    parent_id TEXT,
    specialist_id TEXT,
    assessment_date DATE,
    type TEXT,
    score INTEGER,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (child_id) REFERENCES children(id),
    FOREIGN KEY (parent_id) REFERENCES parents(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);
```

### جدول نتائج التقييم (assessment_results)

```sql
CREATE TABLE assessment_results (
    id TEXT PRIMARY KEY,
    assessment_id TEXT,
    category TEXT,
    score INTEGER,
    observations TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES assessments(id)
);
```

### جدول خطط العلاج (treatment_plans)

```sql
CREATE TABLE treatment_plans (
    id TEXT PRIMARY KEY,
    child_id TEXT,
    specialist_id TEXT,
    start_date DATE,
    end_date DATE,
    goals TEXT,
    notes TEXT,
    status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (child_id) REFERENCES children(id),
    FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);
```

### جدول الأنشطة (activities)

```sql
CREATE TABLE activities (
    id TEXT PRIMARY KEY,
    plan_id TEXT,
    name TEXT NOT NULL,
    description TEXT,
    duration INTEGER,
    frequency TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES treatment_plans(id)
);
```

### جدول تقدم الأنشطة (activity_progress)

```sql
CREATE TABLE activity_progress (
    id TEXT PRIMARY KEY,
    activity_id TEXT,
    child_id TEXT,
    parent_id TEXT,
    completion_date DATE,
    status TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES activities(id),
    FOREIGN KEY (child_id) REFERENCES children(id),
    FOREIGN KEY (parent_id) REFERENCES parents(id)
);
```

### جدول الرسائل (messages)

```sql
CREATE TABLE messages (
    id TEXT PRIMARY KEY,
    sender_id TEXT,
    receiver_id TEXT,
    message TEXT NOT NULL,
    read_status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);
```

### الفهارس (Indexes)

```sql
-- فهارس للبحث السريع
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_parents_user_id ON parents(user_id);
CREATE INDEX idx_specialists_user_id ON specialists(user_id);
CREATE INDEX idx_children_parent_id ON children(parent_id);
CREATE INDEX idx_children_specialist_id ON children(specialist_id);
CREATE INDEX idx_assessments_child_id ON assessments(child_id);
CREATE INDEX idx_treatment_plans_child_id ON treatment_plans(child_id);
CREATE INDEX idx_messages_parent_id ON messages(parent_id);
CREATE INDEX idx_messages_specialist_id ON messages(specialist_id);
```

### العلاقات والقيود (Relationships & Constraints)

```sql
-- قيود الحذف للحفاظ على سلامة البيانات
ALTER TABLE children
ADD CONSTRAINT fk_children_parent
FOREIGN KEY (parent_id) REFERENCES parents(id)
ON DELETE CASCADE;

ALTER TABLE children
ADD CONSTRAINT fk_children_specialist
FOREIGN KEY (specialist_id) REFERENCES specialists(id)
ON DELETE SET NULL;

ALTER TABLE assessments
ADD CONSTRAINT fk_assessments_child
FOREIGN KEY (child_id) REFERENCES children(id)
ON DELETE CASCADE;

ALTER TABLE treatment_plans
ADD CONSTRAINT fk_treatment_plans_child
FOREIGN KEY (child_id) REFERENCES children(id)
ON DELETE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT fk_messages_parent
FOREIGN KEY (parent_id) REFERENCES parents(id)
ON DELETE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT fk_messages_specialist
FOREIGN KEY (specialist_id) REFERENCES specialists(id)
ON DELETE CASCADE;
```

## العلاقات

1. كل والد يمكن أن يكون لديه طفل أو أكثر
2. كل طفل مرتبط بوالد واحد ومتخصص واحد
3. المتخصص يمكنه متابعة عدة أطفال
4. كل تقييم مرتبط بطفل ووالد ومتخصص
5. كل خطة علاج مرتبطة بطفل ومتخصص
6. كل نشاط مرتبط بخطة علاج
7. تقدم الأنشطة مرتبط بالطفل والوالد

## ملاحظات التنفيذ

1. استخدام SQLite للتخزين المحلي
2. مزامنة البيانات مع Firebase عند توفر الاتصال
3. تشفير البيانات الحساسة
4. حفظ النسخ الاحتياطية بشكل دوري
5. تنظيف البيانات القديمة حسب السياسة المحددة
