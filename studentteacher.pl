% Facts: student(StudentName, SubjectCode)
student(john, cs101).
student(mary, cs102).
student(alex, cs101).
student(lisa, math201).

% Facts: teacher(TeacherName, SubjectCode)
teacher(dr_smith, cs101).
teacher(dr_jones, cs102).
teacher(dr_taylor, math201).

% Rule: Teacher teaches Student if they share the same SubjectCode
teaches(Teacher, Student) :-
    teacher(Teacher, SubCode),
    student(Student, SubCode).