DATABASE student_subjects:
    (John, CS101), (Mary, CS102), (Alex, CS101)

DATABASE teacher_subjects:
    (Dr_Smith, CS101), (Dr_Jones, CS102)

FUNCTION get_students_for_teacher(teacher_name):
    FOR EACH (teacher, subject) IN teacher_subjects:
        IF teacher == teacher_name THEN
            FOR EACH (student, student_subject) IN student_subjects:
                IF student_subject == subject THEN
                    PRINT student
                END IF
            END FOR
        END IF
    END FOR
END FUNCTION
