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