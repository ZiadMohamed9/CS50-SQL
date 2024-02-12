CREATE INDEX student_index ON enrollments(student_id);
CREATE INDEX search_course_by_dns ON courses(department, number, semester);
CREATE INDEX course_index ON enrollments(course_id);
CREATE INDEX search_course_by_s ON courses(semester);
CREATE INDEX satisfies_by_courseId ON satisfies(course_id);
