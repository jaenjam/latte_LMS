		SELECT professor_no professorNo,
			   professor_pass professorPass
				FROM professor
				WHERE 
				professor_no ='100001' 
				AND
				professor_pass ='1234';	
				
				
				
				
				
		SELECT professor_no professorNo,
			   professor_pass professorPass
				FROM professor
				WHERE 
				professor_no = '100001'
				AND
				professor_lmslmspass = '1234';
				
				
SELECT 
		s.student_no
		, s.student_pass
		, s.major_no
		, s.student_name
		, s.student_regi_no
		, s.student_age
		, s.student_gender
		, s.student_telephone
		, s.student_email
		, s.student_address
		, s.student_detail_address
		, s.scholar_no
		, s.create_date
		, s.update_date
		, si.filename
		, sh.scholar_name
	FROM student s RIGHT OUTER JOIN student_img si
	ON	s.student_no = si.student_no
	RIGHT OUTER JOIN scholar sh
	ON s.scholar_no = sh.scholar_no
	WHERE s.student_no='300001';
	
	
	
	
	SELECT 
		s.student_no
		, s.student_pass
		, s.major_no
		, s.student_name
		, s.student_regi_no
		, s.student_age
		, s.student_gender
		, s.student_telephone
		, s.student_email
		, s.student_address
		, s.student_detail_address
		, s.scholar_no
		, s.create_date
		, s.update_date
		, sh.scholar_name
	FROM student s RIGHT OUTER JOIN scholar sh
	ON s.scholar_no = sh.scholar_no
	WHERE s.student_no='300001';
	
	
	SELECT 
		s.student_no
		, s.student_pass
		, s.major_no
		, s.student_name
		, s.student_regi_no
		, s.student_age
		, s.student_gender
		, s.student_telephone
		, s.student_email
		, s.student_address
		, s.student_detail_address
		, s.scholar_no
		, s.create_date
		, s.update_date
		, sh.scholar_name
		, si.filename
	FROM student s LEFT JOIN scholar sh
	ON s.scholar_no = sh.scholar_no
	LEFT JOIN student_img si
	ON s.student_no = si.student_no
	WHERE s.student_no='300001';
	
	
	
	
	SELECT 
		s.student_no
		, s.student_pass
		, s.major_no
		, s.student_name
		, s.student_regi_no
		, s.student_age
		, s.student_gender
		, s.student_telephone
		, s.student_email
		, s.student_address
		, s.student_detail_address
		, s.scholar_no
		, s.create_date
		, s.update_date
		, si.filename
	FROM student s FULL OUTER JOIN student_img si
	ON	s.student_no = si.student_no
	WHERE s.student_no='300001';
	
	
	
	
	SELECT
		p.*
		,sa.*
		FROM professor p INNER JOIN subject_approve sa
		ON p.professor_no = sa.professor_no
		WHERE p.professor_no='100001';
		
		
		SELECT 
		s.student_no
		, s.student_pass
		, s.major_no
		, s.student_name
		, s.student_regi_no
		, s.student_age
		, s.student_gender
		, s.student_telephone
		, s.student_email
		, s.student_address
		, s.student_detail_address
		, s.scholar_nostudent
		, s.create_date
		, s.update_date
		, sh.scholar_name
		, si.filename
	FROM 
		student s LEFT JOIN scholar sh
	ON 
		s.scholar_no = sh.scholar_no
	LEFT JOIN 
		student_img si
	ON 
		s.student_no = si.student_no
	WHERE 
		s.student_no='300001'
	AND
		s.student_pass='1234';	
		
		
UPDATE 
	student
SET 
	student_pass = 	
	
	
	
	
	
	
	SELECT
		sa.subject_approve_no subjectApprove
		, sa.major_no majorNo
		, sa.subject_no subjectNo
		, sa.professor_no professorNo
		, sa.year year
		, sa.semester semester
		, sa.start_date startDate
		, sa.end_date endDate
		, sa.total_date totalDate
		, sa.approve_active approveActive
		, sa.subject_room subjectRoom
		, sa.day day
		, sa.start_time startTime
		, sa.end_date endDate
		, p.professor_no professorNo
		, p.major_no majorNo
		, p.professor_name professorName
		, m.major_name majorName
		, l.lecture_no
		, l.subject_approve_no
		, l.lecture_title
		, l.lecture_content
		, l.create_date
	FROM
		subject_approve sa 
	INNER JOIN 
		professor p
	ON
		sa.professor_no = p.professor_no
	INNER JOIN
		major m	
	ON
		sa.major_no = m.major_no
	INNER JOIN
		lecture l
	ON	
		sa.subject_approve_no = l.subject_approve_no
	WHERE	
		sa.professor_no = 100003;	
		
		
		
register
		
		
		
SELECT 
	sa.major_no majorNo
	, sa.professor_no professorNo
	, sa.year yearSa
	, sa.semester semester
	, sa.start_date startDate
	, sa.end_date endDate
	, sa.total_date totalDate
	, sa.subject_room subjectRoom
	, sa.day daySa
	, sa.start_time startTime
	, sa.end_time eneTime
	, s.subject_name subjectName
	, s.subject_no subjectNo
	, m.major_name majorName
	FROM
		subject_approve sa
	INNER JOIN
		subject s	
	ON
		sa.subject_no	= 	s.subject_no
	INNER JOIN
		major m
	ON
		sa.major_no = m.major_no
	WHERE
		sa.professor_no = '100003';
		
		
		
	INSERT INTO
		lecture
		(subject_approve_no
		, lecture_title
		, lecture_content
		, create_date
		, update_date)
		VALUES
		( '1'
		, "제발"
		, "제에에발"
		, NOW()
		, NOW())				
		
					
					
	INSERT INTO
		lecture
		(
		lecture_title
		, lecture_content
		, create_date
		, update_date)
	SELECT
		(
		"연습"
		, "제발"
		, NOW()
		, NOW())	
	FROM DUAL 
	WHERE NOT EXISTS
	(SELECT subject_approve_no
		FROM 
			lecture l
			INNER JOIN
			 subject_approve sa
			 ON
			  l.subject_approve_no = sa.subject_approve_no
			  INNER JOIN
			  	professor p
			  	ON
			  	sa.professor_no = p.professor_no
				WHERE			
					p.professor_no = '100003');
	


UPDATE student
	SET
	 student_pass = '1234'
	 , student_telephone= "010-3333-3333"
	 , student_email = "kkhhww999@nave.com"
	 , student_address = "경기도 의정부시"
	 , student_detail_address = "어딘가"
	 , update_date = "2022-09-23"
	 WHERE
	 	student_no = '300002';				
	 	
	 	
	 	
	 	
		SELECT
			sa.subject_approve_no subjectApproveNo
			, sa.major_no majorNo
			, sa.subject_no subjectNo
			, sa.professor_no professorNo
			, sa.year year
			, sa.semester semester
			, sa.start_date startDate
			, sa.end_date endDate
			, sa.total_date totalDate
			, sa.approve_active approveActive
			, sa.subject_room subjectRoom
			, sa.day day
			, sa.start_time startTime
			, sa.end_date endDate
			, p.professor_no professorNo
			, p.major_no majorNo
			, p.professor_name professorName
			, m.major_name majorName
			, l.lecture_no lectureNo
			, l.subject_approve_no subjectApproveNoL
			, l.lecture_title lectureTitle
			, l.lecture_content lectureContent
			, l.create_date createDateL
			, l.update_date updateDateL
			, l.count countL
		FROM
			subject_approve sa 
		INNER JOIN 
			professor p
		ON
			sa.professor_no = p.professor_no
		INNER JOIN
			major m	
		ON
			sa.major_no = m.major_no
		INNER JOIN
			lecture l
		ON	
			sa.subject_approve_no = l.subject_approve_no
		WHERE	
			sa.professor_no = '100003';		 	
			
			
			
			
			
					select
			student_no studentNo
			, student_pass studentPass
			, major_no majorNo
			, student_name studentName
			, student_regi_no studentRegiNo
			, student_age studentAge
			, student_gender studentGender
			, student_telephone studentTelephone
			, student_email studentEmail
			, student_address studentAddress
			, student_detail_address studentDatailAddress
			, student_state studentState
			, student_top studentTop
			, student_active studentActive
			, create_date createDate
			, update_date updateDate
			, club_no clubNo
			, scholar_no scholarNo
		FROM
			student
		WHERE
			student_no = '300001'
		AND
			student_pass = '1234';
			
			
			
	SELECT
		sa.subject_approve_no
		, sa.major_no
		, sa.subject_no
		, sa.professor_no
		, sa.year
		, sa.semester
		, sa.start_date
		, sa.end_date
		, sa.total_date
		, sa.approve_active
		, sa.subject_room
		, sa.day
		, sa.start_time
		, sa.end_time
		, s.subject_name
		, s.subject_state
		, s.subject_credit
		, s.subject_major
		, p.professor_name
		, p.professor_room
		, p.professor_state
		, m.major_name
	FROM
		subject_approve sa
		INNER JOIN
			subject s
		ON
			sa.subject_no = s.subject_no
			INNER JOIN
				professor p
				ON
					sa.professor_no = p.professor_no
					INNER JOIN
						major m
							ON	
								sa.major_no = m.major_no
								WHERE
									sa.subject_approve_no = 1;
									
		SELECT
			sa.subject_approve_no subjectApproveNo
			, sa.major_no majorNo
			, sa.subject_no subjectNo
			, sa.professor_no professorNo
			, sa.year year
			, sa.semester semester
			, sa.start_date startDate
			, sa.end_date endDate
			, sa.total_date totalDate
			, sa.approve_active approveActive
			, sa.subject_room subjectRoom
			, sa.day day
			, sa.start_time startTime
			, sa.end_date endDate
			, p.professor_no professorNo
			, p.major_no majorNo
			, p.professor_name professorName
			, m.major_name majorName
			, l.lecture_no lectureNo
			, l.subject_approve_no subjectApproveNoL
			, l.lecture_title lectureTitle
			, l.lecture_content lectureContent
			, l.create_date createDateL
			, l.update_date updateDateL
			, l.count countL
		FROM
			subject_approve sa 
		INNER JOIN 
			professor p
		ON
			sa.professor_no = p.professor_no
		INNER JOIN
			major m	
		ON
			sa.major_no = m.major_no
		INNER JOIN
			lecture l
		ON	
			sa.subject_approve_no = l.subject_approve_no
		WHERE	
			sa.subject_approve_no = '1';			
			
			
			
			
		SELECT
			  lecture_no lectureNo
			, subject_approve_no subjectApproveNo
			, lecture_title lectureTitle
			, lecture_content lectureContent
			, create_date createDateL
			, update_date updateDateL
			, count countL

		FROM
		lecture 
		WHERE	
			subject_approve_no = '1';		
			
			
			
	INSERT INTO
		lecture
		(
		subject_approve_no
		, lecture_title
		, lecture_content
		, create_date
		, update_date
		)
		VALUES
		(1
		,"??"
		,"????"
		, now()
		, now()		
		)						
		
		
		
			DELETE 
	FROM
		lecture
	WHERE
		lecture_no = 30;
		
		
			SELECT
		subject_approve_no subjectApproveNo
	FROM
		lecture
	WHERE
		lecture_no =28;
		
		
		
		
			SELECT
		l.lecture_no lectureNo
		, l.subject_Approve_No subjectApproveNo 
		, l.lecture_title lectureTitle
		, l.lecture_content lectureContent
		, l.create_date createDate
		, l.update_date updateDate
		, l.count 
		, lf.lecturefile_no
		, lf.lecture_filename
		, lf.lecture_originname
		, lf.lecture_type
	FROM
		lecture	l INNER JOIN lecture_file lf
	ON
		l.lecture_no = lf.lecture_no
	WHERE
		l.lecture_no = 62;
		
		
	SELECT
		l.lecture_no lectureNo
		, l.subject_approve_No subjectApproveNo 
		, l.lecture_title lectureTitle
		, l.lecture_content lectureContent
		, l.create_date createDate
		, l.update_date updateDate
		, l.count 
		, lf.lecturefile_no
		, lf.lecture_filename lectureFilename
		, lf.lecture_originname lectureOriginName
		, lf.lecture_type lectureType
	FROM
		lecture	l INNER JOIN lecture_file lf
	ON
		l.lecture_no = lf.lecture_no
	WHERE
		l.lecture_no = '62';
		
		
		
		
	SELECT
		l.lecture_no lectureNo
		, l.subject_approve_no subjectApproveNo 
		, l.lecture_title lectureTitle
		, l.lecture_content lectureContent
		, l.create_date createDate
		, l.update_date updateDate
		, l.count 
		, lf.lecturefile_no lecturefileNo
		, lf.lecture_filename lectureFilename
		, lf.lecture_originname lectureOriginname
		, lf.lecture_type lectureType
	FROM
		lecture	l 
	INNER JOIN 
		lecture_file lf
	ON
		l.lecture_no = lf.lecture_no
	WHERE
		l.lecture_no = 62;
		
	
	
			SELECT
			  a.subject_approve_no 	subjectApproveNo
			, a.major_no 			majorNo
			, m.major_name 			majorName
			, a.subject_no 			subjectNo
			, s.subject_name 		subjectName
			, a.professor_no 		professorNo
			, p.professor_name 		professorName
			, a.year 				year
			, a.semester 			semester
			, a.start_date 			startDate
			, a.end_date 			endDate
			, a.total_date 			totalDate
			, a.approve_active 		approveActive
			, a.subject_room 		subjectRoom
			, a.day 				day
			, a.start_time 			startTime
			, a.end_time 			endTime
		FROM
			subject_approve a 
				
				INNER JOIN subject s
				ON a.subject_no = s.subject_no
				
				INNER JOIN professor p
				ON a.professor_no = p.professor_no
				
				INNER JOIN major m
				ON a.major_no = m.major_no
				
		ORDER BY a.subject_approve_no	
		
		
		SELECT 
			l.lecture_no lectureNo 
			, l.subject_approve_no subjectApproveNo 
			, l.lecture_title lectureTitle 
			, l.lecture_content lectureContent 
			, l.create_date createDate 
			, l.update_date updateDate 
			, l.count 
			, lf.lecturefile_no lecturefileNo 
			, lf.lecture_filename lectureFilename 
			, lf.lecture_originname lectureOriginname 
			, lf.lecture_type lectureType 
			FROM 
			lecture l 
			INNER JOIN 
			lecture_file lf 
			ON 
			l.lecture_no = lf.lecture_no
		 WHERE l.lecture_no = 67;
		 
		 
		 
		 	SELECT
		l.lecture_no lectureNo
		, l.subject_approve_no subjectApproveNo 
		, l.lecture_title lectureTitle
		, l.lecture_content lectureContent
		, l.create_date createDate
		, l.update_date updateDate
		, l.count 
		, lf.lecturefile_no lecturefileNo
		, lf.lecture_filename lectureFilename
		, lf.lecture_originname lectureOriginname
		, lf.lecture_type lectureType
	FROM
		lecture	l 
	LEFT JOIN 
		lecture_file lf
	ON
		l.lecture_no = lf.lecture_no
	WHERE
		l.lecture_no = 71;
		
		
		
		
		
		
			SELECT 
		 l.lecture_no lectureNo
		 , l.subject_approve_no subjectApproveNo
		 , l.lecture_title lectureTitle
		 , l.create_date createDate
		 , sh.student_submitck studentSubmitCk
	 FROM
	 	lecture l
	 	 LEFT JOIN
	 	  student_homework sh
	 	  ON
	 	 	l.lecture_no = sh.lecture_no
	 	 	WHERE
	 	 		l.subject_approve_no = 1;
	 	 		
	 	 		
	 	 		
	SELECT 
		l.lecture_no lectureNo
		, sh.student_no studentNo
		, sh.homework_title homeworkTitle 
		, sh.student_submitck studentSubmitCk
		, sh.score score
	FROM
		lecture l
		 RIGHT JOIN
		 	student_homework sh
		 ON
		  	l.lecture_no = sh.lecture_no
				WHERE
					l.lecture_no = 1;
					
					
lms					
INSERT INTO dumi_ex(noo, title, content)
    SELECT dumi.noo, dumi.title, dumi.content
        FROM dumi
		  	WHERE NO = 3;	
			  
UPDATE
	dumi_ex
	SET
	NOW = NOW()
	WHERE NO=3; 	
	
	
	
	
	
			SELECT
			  a.subject_approve_no 	subjectApproveNo
			, a.major_no 			majorNo
			, m.major_name 			majorName
			, a.subject_no 			subjectNo
			, s.subject_name 		subjectName
			, s.subject_credit		subjectCredit
			, a.professor_no 		professorNo
			, p.professor_name 		professorName
			, a.year 				year
			, a.semester 			semester
			, a.start_date 			startDate
			, a.end_date 			endDate
			, a.total_date 			totalDate
			, a.approve_active 		approveActive
			, a.subject_room 		subjectRoom
			, a.day 				day
			, a.start_time 			startTime
			, a.end_time 			endTime
		FROM
			subject_approve a 
				
				INNER JOIN subject s
				ON a.subject_no = s.subject_no
				
				INNER JOIN professor p
				ON a.professor_no = p.professor_no
				
				INNER JOIN major m
				ON a.major_no = m.major_no
				
		ORDER BY a.subject_approve_no	
		
		
		
		
SELECT
	student_no
		FROM
			register
				WHERE
					subject_approve_no = '1';	
					
					
					
					
					
		INSERT INTO
			lecture
			(
			subject_approve_no
			, lecture_title
			, lecture_content
			, create_date
			, update_date
			)
			VALUES
			('1'
			,"연속쿼리실험용"
			,"연속쿼리실험용"
			, now()
			, now()		
			)

		<selectKey resultType="integer" order="AFTER" keyProperty="lectureNo"> 
		SELECT LAST_INSERT_ID()
		</selectKey>	

				INSERT INTO 
			student_homework
		(
		student_no
		, lecture_no
		, homework_title
		, homework_content
		)
		VAUES
		(
		#{studentNo}
		, #{lectureNo}
		, #{homeworkTitle}
		, #{homeworkTitle}
		)	
			WHERE (
				select 
					student_no studentNo
						FROM
						register
							WHERE
								subject_approve_no = #{subjectApproveNo}						
			)
			
			
			
	SELECT
		subject_approve_no
		, create_date
		, update_date
	FROM
		register
	WHERE
		student_no = 300001;
		
		
		
	SELECT
		r.subject_approve_no
		, r.create_date
		, r.update_date
		, sa.subject_approve_no
		, sa.professor_no
		, sa.year
		, sa.semester
		, pa.register_no
		, pa.professor_assess_score
		, pa.professor_assess_ck
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
	WHERE
		student_no = 300001;							
		
		
		
SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pf.professor_name professorName
		, s.subject_name subjectName
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
lms	

	SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pf.professor_name professorName
		, s.subject_name subjectName
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		r.subject_approve_no = 1;
		
		
		
		
		
SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;	
		
SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk

	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
				RIGHT JOIN
					subject s
					ON
					sa.subject_no = s.subject_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 

	WHERE
		student_no = 300001;	
		
		
		
		SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, s.subject_name subjectName
		, s.subject_credit subjectCredit

	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
				RIGHT JOIN
					subject s
					ON
					sa.subject_no = s.subject_no
		

	WHERE
		student_no = 300001;	
		
		
		
SELECT
		r.student_no studentNo
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
				RIGHT JOIN
					subject s
					ON
					sa.subject_no = s.subject_no
						RIGHT JOIN
						professor_assess pa
							ON
						r.register_no = pa.register_no

	WHERE
		student_no = 300001;	
		


		
INSERT INTO register 
(student_no
, subject_approve_no
, create_date
, update_date
)
VALUE
('300001'
, 5
, NOW()
, NOW())
WHERE
student_no = 300001;

SELECT
MAX(register_no)
FROM
register
WHERE
student_no='300001';


INSERT INTO professor_assess
(
register_no
)
VALUE
(
	(SELECT
	MAX(register_no)
	FROM
	register
	WHERE
	student_no='300001')
)



	INSERT INTO professor_assess
	(
	register_no
	)
	VALUE
	(
		(SELECT
		MAX(register_no)
		FROM
		register
		WHERE
		student_no=300001)
	)
	
	
		INSERT INTO subject_assess
	(
	register_no
	)
	VALUE
	(
		(SELECT
		MAX(register_no)
		FROM
		register
		WHERE
		student_no=300001)
	)
	
	
	
	
	
		SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		LEFT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					LEFT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							LEFT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								LEFT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
		
		
		SELECT
		*
		FROM
		register


	SELECT
	distinct
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
		
	SELECT
	distinct
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		LEFT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					LEFT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							LEFT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								LEFT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
		
SELECT 
			r.create_date createDate
			, r.update_date updateDate
			, sa.professor_no professorNo
			, sa.year yearS
			, sa.semester semesterS
			, pa.register_no registerNo
			, pa.professor_assess_score professorAssessScore
			, pa.professor_assess_ck professorAssessCk
			, pf.professor_name professorName
			, s.subject_name subjectName
			, s.subject_credit subjectCredit
	FROM
			register r
				RIGHT JOIN
				subject_approve sa 
					ON
					r.subject_approve_no = sa.subject_approve_no
							RIGHT JOIN
							professor_assess pa 
								ON
								r.register_no= pa.register_no
								RIGHT JOIN
								professor pf 
									ON
									sa.professor_no = pf.professor_no
									RIGHT JOIN
										subject s 
										ON
										sa.subject_no = s.subject_no
	WHERE
			r.subject_approve_no= 1;
			
			
	SELECT
			pa.register_no registerNo
			, pa.professor_assess_score professorAssessScore
			, pa.professor_assess_ck professorAssessCk
			, r.*

			FROM
			professor_assess pa
			RIGHT JOIN
				register r
				ON
				pa.register_no = r.register_no
				WHERE
					r.subject_approve_no = 1;
	


	SELECT
			pa.register_no registerNo
			, pa.professor_assess_score professorAssessScore
			, pa.professor_assess_ck professorAssessCk
			, r.register_no
			, r.student_no
			, r.subject_approve_no
			, sa.major_no
			, sa.subject_no
			, sa.professor_no
			, sa.semester
			, s.subject_name
			, st.student_name
			FROM
			professor_assess pa
			RIGHT JOIN
				register r
				ON
				pa.register_no = r.register_no
				RIGHT JOIN
					subject_approve sa
					ON
						r.subject_approve_no = sa.subject_approve_no
						RIGHT JOIN
						subject s
							ON
							sa.subject_no = s.subject_no
							RIGHT JOIN
								student st
									ON
									r.student_no=st.student_no
				WHERE
					r.subject_approve_no = 1;
	
	
	
	
SELECT
	distinct
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;			
					
					
SELECT DISTINCT
			r.subject_approve_no subjectApproveNo
			, r.create_date createDate
			, r.update_date updateDate
			, sa.professor_no professorNo
			, sa.year yearS
			, sa.semester semesterS
			, pa.register_no registerNo
			, pa.professor_assess_score professorAssessScore
			, pa.professor_assess_ck professorAssessCk
			, pf.professor_name professorName
			, s.subject_name subjectName
			, s.subject_credit subjectCredit
			, st.student_name studentName
	FROM
			register r
				RIGHT JOIN
				subject_approve sa 
					ON
					r.subject_approve_no = sa.subject_approve_no
							RIGHT JOIN
							professor_assess pa 
								ON
								r.register_no= pa.register_no
								RIGHT JOIN
								professor pf 
									ON
									sa.professor_no = pf.professor_no
									RIGHT JOIN
										subject s 
										ON
										sa.subject_no = s.subject_no
										RIGHT JOIN
											student st
											ON
											r.student_no= st.student_no



	SELECT
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
	INSERT INTO professor_assess
	(
	register_no
	)
	VALUE
	(
		(SELECT
		MAX(register_no)
		FROM
		register
		WHERE
		student_no=300004)
	)		
	
	
	
	
		SELECT
	distinct
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		LEFT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					LEFT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							LEFT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								LEFT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
									
									
									
	SELECT
		pa.AVG(professor_assess_score)
		FROM
		professor_assess pa
		WHERE
			pa.subject_approve_no = 1;
			



	SELECT
		pa.AVG(professor_assess_score)
		FROM
		professor_assess pa
		WHERE
			pa.register_no(SELECT r.register_no
									FROM register r
									WHERE r.register_no =  )
									
									
									
	SELECT 
		pa.professor_assess_score
		, r.subject_approve_no
		, AVG(professor_assess_score)
		FROM professor_assess pa 
			LEFT JOIN
				register r
				ON 
				pa.register_no = r.register_no
				WHERE 
					r.subject_approve_no = 1
					
					
	SELECT 
		pa.professor_assess_score
		, r.subject_approve_no
		, AVG(professor_assess_score)
		FROM professor_assess pa 
			LEFT JOIN
				register r
				ON 
				pa.register_no = r.register_no

	SELECT
		r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		RIGHT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					RIGHT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							RIGHT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								RIGHT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
		
		
	** 교ㅜ평가	**
		
	SELECT
	distinct
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, pa.register_no registerNo
		, pa.professor_assess_score professorAssessScore
		, pa.professor_assess_ck professorAssessCk
		, pa.professor_assess_ck professorAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		LEFT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					LEFT JOIN
						professor_assess pa
							ON
							r.register_no= pa.register_no 
							LEFT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								LEFT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;	
		
		
		** 강의평가**
		
	SELECT
	distinct
		r.student_no
		, r.subject_approve_no subjectApproveNo
		, r.create_date createDate
		, r.update_date updateDate
		, sa.professor_no professorNo
		, sa.year yearS
		, sa.semester semesterS
		, sba.register_no registerNo
		, sba.subject_assess_score subjectAssessScore
		, sba.subject_assess_ck subjectAssessCk
		, sba.subject_assess_content subjectAssessContent
		, pf.professor_name professorName
		, s.subject_name subjectName
		, s.subject_credit subjectCredit
	FROM
		register r
		LEFT JOIN
			subject_approve sa
				ON
				r.subject_approve_no = sa.subject_approve_no
					LEFT JOIN
						subject_assess sba
							ON
							r.register_no= sba.register_no 
							LEFT JOIN
							professor pf
								ON
								sa.professor_no = pf.professor_no
								LEFT JOIN
									subject s
									ON
									sa.subject_no = s.subject_no
							
	WHERE
		student_no = 300001;
		
		
		** 과제 평가>>> 리스트 긁어오기 **		
	
	SELECT
	DISTINCT 
	sh.pf_homework_no pfhomeworkNo
	,sh.student_no studentNo
	, sh.lecture_no lectureNo
	, sh.homework_title homeworkTitle
	, sh.homework_content homeworkContent
	, sh.student_submitck studentSubmitCk
	, sh.score score
	, l.subject_approve_no	subjectApproveNo
	, sa.subject_no subjectNo
	, sa.professor_no professorNo
	, sa.subject_no subjectNo
	, sa.major_no majorNo
	, s.subject_name subjectName
	, st.student_name studentName
	FROM
		student_homework sh
		RIGHT JOIN
			lecture l
			ON
				sh.lecture_no=l.lecture_no
				RIGHT JOIN
				subject_approve sa
					ON
					l.subject_approve_no = sa.subject_approve_no
						RIGHT JOIN
						subject s
						ON
						sa.subject_no = s.subject_no
							RIGHT JOIN
							student st
								ON
								sh.student_no = st.student_no
						WHERE
						sh.lecture_no = 1;
						
						
						
	UPDATE
	student_homework
	SET
	score = 90
	, student_submitck = '미제출'
	WHERE
	pf_homework_no = 1
	
	
	UPDATE
	student_homework
	SET
	score = 100
	WHERE
	pf_homework_no = 1		
	
	
	UPDATE
	student_homework
	SET
	student_submitck = '제출'
	WHERE
	pf_homework_no = 1
						
						
							UPDATE
	student_homework
	SET
	score = 90
	, student_submitck = '제출'
	WHERE
	pf_homework_no = 1;
	
	
	UPDATE
	professor_assess
	SET
	professor_assess_ck = "N"
	WHERE 
	register_no = 6;
	
	
	select
	pa.register_no
	, pa.professor_assess_score
	, pa.professor_assess_content
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no
	, sa.professor_no
	, sa.year
	, sb.subject_name
	, p.professor_name
	, st.student_name
	FROM
	professor_assess pa
	RIGHT JOIN
		register r
		ON
			pa.register_no = r.register_no
			RIGHT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no
				 RIGHT JOIN
					subject sb
					ON
					sa.subject_no = sb.subject_name
						RIGHT JOIN
						professor p
						ON
						sa.professor_no = p.professor_no
						RIGHT JOIN
						student st
							ON
							r.student_no=st.student_no
							
							
							
select
	pa.register_no
	, pa.professor_assess_score
	, pa.professor_assess_content
	, r.student_no
	, r.subject_approve_no

	FROM
	professor_assess pa
	INNER JOIN
		register r
		ON
			pa.register_no = r.register_no
			
			
			
	select
	pa.register_no
	, pa.professor_assess_score
	, pa.professor_assess_content
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no
	, sa.professor_no
	, sa.year
	FROM
	professor_assess pa
	RIGHT JOIN
		register r
		ON
			pa.register_no = r.register_no
			RIGHT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no



	SELECT
	pa.register_no
	, pa.professor_assess_score
	, pa.professor_assess_content
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no SUBJECTNO
	, sa.professor_no
	, sa.year
	, sb.subject_name
	, p.professor_name
	, st.student_name
	FROM
	professor_assess pa
	INNER JOIN
		register r
		ON
			pa.register_no = r.register_no
			LEFT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no
				 LEFT JOIN
					subject sb
					ON
					sa.subject_no = sb.subject_name
						LEFT JOIN
						professor p
						ON
						sa.professor_no = p.professor_no
						LEFT JOIN
						student st
							ON
							r.student_no=st.student_no	
							WHERE
							sa.subject_approve_no = 8;				
			
			
			
	SELECT
	pa.register_no
	, AVG(pa.professor_assess_score)
	, pa.professor_assess_content
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no SUBJECTNO
	, sa.professor_no
	, sa.year
	, sb.subject_name
	, p.professor_name
	, st.student_name
	FROM
	professor_assess pa
	INNER JOIN
		register r
		ON
			pa.register_no = r.register_no
			LEFT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no
				 LEFT JOIN
					subject sb
					ON
					sa.subject_no = sb.subject_name
						LEFT JOIN
						professor p
						ON
						sa.professor_no = p.professor_no
						LEFT JOIN
						student st
							ON
							r.student_no=st.student_no	
							WHERE
							sa.subject_approve_no			
							
							
	SELECT
		AVG(pa.professor_assess_score)
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no SUBJECTNO
	, sa.professor_no
	, sa.year
	, sb.subject_name
	, p.professor_name
	FROM
	professor_assess pa
	INNER JOIN
		register r
		ON
			pa.register_no = r.register_no
			LEFT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no
				 LEFT JOIN
					subject sb
					ON
					sa.subject_no = sb.subject_name
						LEFT JOIN
						professor p
						ON
						sa.professor_no = p.professor_no
						order by sa.subject_approve_no DESC			
						



	SELECT
		AVG(pa.professor_assess_score)
	, r.student_no
	, r.subject_approve_no
	, sa.subject_no SUBJECTNO
	, sa.professor_no
	, sa.year
	, sb.subject_name
	, p.professor_name
	FROM
	professor_assess pa
	INNER JOIN
		register r
		ON
			pa.register_no = r.register_no
			LEFT JOIN
			subject_approve sa
				ON
				 r.register_no = sa.subject_approve_no
				 LEFT JOIN
					subject sb
					ON
					sa.subject_no = sb.subject_name
						LEFT JOIN
						professor p
						ON
						sa.professor_no = p.professor_no
						order by sa.subject_approve_no DESC																	