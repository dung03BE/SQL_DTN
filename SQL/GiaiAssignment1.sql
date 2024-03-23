use testingsystem;
select *from Question_Category;
select *from Question_Level;
select *from Question;
INSERT INTO Question (title,Question_Category_ID, `type`,`status`,level_ID,version,author_ID,create_time,Image_ID)
			VALUES 	('Cau hoi moi 1',1,'Multiple-Choice',1,1,1,1,'2007-03-20',1),
					('Cau hoi moi 2',1,'Essay',0,2,1,1,'2007-03-20',1),
					('Cau hoi moi 3',1,'Essay',1,1,1,1,'2007-03-20',1),
                    ('Cau hoi moi 4',1,'Multiple-Choice',0,1,1,1,'2007-03-20',1),
                    ('Cau hoi moi 5',1,'Essay',1,1,1,1,'2007-03-20',1),
                    ('Cau hoi moi 6',1,'Multiple-Choice',0,1,1,1,'2007-03-20',1),
                    ('Cau hoi moi 7',1,'Essay',1,1,1,1,'2007-03-20',1),
                    ('Cau hoi moi 8',1,'Multiple-Choice',0,3,1,1,'2007-03-20',1),
                    ('Cau hoi moi 9',1,'Multiple-Choice',1,4,1,1,'2007-03-20',1),
                    ('Cau hoi moi 10',1,'Multiple-Choice',1,1,1,1,'2007-03-20',1);
 -- Câu 2: Lấy ra số lượng câu hỏi của từng type level mức độ khó 
select *from Question_Category;
select *from Question_Level;
select *from Question;
 select COUNT(*) as 'de' from Question,Question_Level where Question.Level_id=Question_Level.id and  `level` = 'Easy';
 select COUNT(*) as  'kho' from Question,Question_Level where Question.Level_id=Question_Level.id and  `level` = 'Hard';
 select COUNT(*) as 'binh thg' from Question,Question_Level where Question.Level_id=Question_Level.id and  `level` = 'Medium';
 select COUNT(*) as 'qua kho' from Question,Question_Level where Question.Level_id=Question_Level.id and  `level` = 'Very Hard';
 -- Câu 3: Lấy ra toàn bộ danh sách các câu hỏi đúng
 select *from Answer;
 select * from Answer, Question where Answer.question_ID = Question.id and is_correct = 1;
 -- Cậu 4:  lấy ra toàn bộ danh sách user là NAM có ngày sinh từ: 1981-01-15 đến 1997-10-20
 select *from User;
 select *from User where gender='M' and date_Of_Birth Between  '1981-01-15' and '1997-10-20' ;