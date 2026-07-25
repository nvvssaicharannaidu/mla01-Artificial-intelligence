% --- Facts: Patient Diagnoses ---
patient(john, diabetes).
patient(mary, hypertension).
patient(alex, anemia).
patient(lisa, celiac).

% --- Knowledge Base: Recommended Diets for Diseases ---
diet_plan(diabetes, 'Low carbohydrate, sugar-free, high fiber diet').
diet_plan(hypertension, 'Low sodium, low fat, potassium-rich diet').
diet_plan(anemia, 'Iron-rich diet (spinach, legumes, red meat)').
diet_plan(celiac, 'Strict gluten-free diet').

% --- Rule: Suggest diet for a patient ---
suggest_diet(Patient, Plan) :-
    patient(Patient, Disease),
    diet_plan(Disease, Plan).