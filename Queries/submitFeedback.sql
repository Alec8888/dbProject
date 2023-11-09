INSERT INTO Feedback (feedback_id, email, name, query1, query2, query3, query4, query5, feedback)
VALUES (FEEDBACK_ID_SEQ.NEXTVAL, :email, :name, :q1, :q2, :q3, :q4, :q5, :feedback)