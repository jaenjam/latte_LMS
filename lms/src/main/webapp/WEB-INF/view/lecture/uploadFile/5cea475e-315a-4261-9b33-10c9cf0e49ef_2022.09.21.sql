-- --------------------------------------------------------
-- 호스트:                          13.124.159.158
-- 서버 버전:                        10.1.48-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- lms 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `lms`;
CREATE DATABASE IF NOT EXISTS `lms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lms`;

-- 테이블 lms.answer 구조 내보내기
DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `answer_no` int(11) NOT NULL COMMENT '대답번호',
  `question_no` int(11) NOT NULL COMMENT '질문번호',
  `answer_title` varchar(50) NOT NULL COMMENT '글제목',
  `answer_content` varchar(500) NOT NULL COMMENT '글내용',
  `answer_writer` varchar(50) NOT NULL COMMENT '작성자',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`answer_no`),
  KEY `FK_answer_question` (`question_no`),
  CONSTRAINT `FK_answer_question` FOREIGN KEY (`question_no`) REFERENCES `question` (`question_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='답변\r\n';

-- 테이블 데이터 lms.answer:~0 rows (대략적) 내보내기
DELETE FROM `answer`;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

-- 테이블 lms.attendance 구조 내보내기
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '출결관리번호',
  `student_no` int(11) NOT NULL COMMENT '학생번호',
  `subject_approve_no` int(11) NOT NULL COMMENT '과목승인번호',
  `attendance_date` date NOT NULL COMMENT '출석일',
  `attendance_state` enum('Y','N') NOT NULL COMMENT '출결상태',
  `attendance_etc` varchar(50) DEFAULT NULL COMMENT '비고',
  PRIMARY KEY (`attendance_no`) USING BTREE,
  KEY `FK_attendance_register` (`student_no`),
  KEY `FK_attendance_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_attendance_register` FOREIGN KEY (`student_no`) REFERENCES `register` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_attendance_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='출석부';

-- 테이블 데이터 lms.attendance:~0 rows (대략적) 내보내기
DELETE FROM `attendance`;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

-- 테이블 lms.club 구조 내보내기
DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `club_no` varchar(50) NOT NULL COMMENT '동아리코드',
  `club_name` varchar(50) NOT NULL COMMENT '동아리명',
  `club_room` varchar(50) NOT NULL COMMENT '동아리방',
  `professor_no` int(11) NOT NULL COMMENT '담당교수',
  PRIMARY KEY (`club_no`),
  KEY `FK_club_professor` (`professor_no`),
  CONSTRAINT `FK_club_professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='동아리';

-- 테이블 데이터 lms.club:~0 rows (대략적) 내보내기
DELETE FROM `club`;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
/*!40000 ALTER TABLE `club` ENABLE KEYS */;

-- 테이블 lms.community 구조 내보내기
DROP TABLE IF EXISTS `community`;
CREATE TABLE IF NOT EXISTS `community` (
  `community_no` int(11) NOT NULL COMMENT '커뮤니티번호',
  `student_no` int(11) NOT NULL COMMENT '학생사번',
  `community_title` varchar(50) NOT NULL COMMENT '제목',
  `community_content` varchar(500) NOT NULL COMMENT '내용',
  `cnt` int(11) NOT NULL COMMENT '조회수',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`community_no`),
  KEY `FK_community_student` (`student_no`),
  CONSTRAINT `FK_community_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='커뮤니티\r\n';

-- 테이블 데이터 lms.community:~0 rows (대략적) 내보내기
DELETE FROM `community`;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;

-- 테이블 lms.community_like 구조 내보내기
DROP TABLE IF EXISTS `community_like`;
CREATE TABLE IF NOT EXISTS `community_like` (
  `community_no` int(11) NOT NULL COMMENT '커뮤니티번호',
  `student_no` int(11) NOT NULL COMMENT '학생 사번',
  PRIMARY KEY (`student_no`,`community_no`) USING BTREE,
  KEY `FK_community_like_student` (`student_no`),
  KEY `FK_community_like_community` (`community_no`),
  CONSTRAINT `FK_community_like_community` FOREIGN KEY (`community_no`) REFERENCES `community` (`community_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_community_like_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='커뮤니티 글 좋아요';

-- 테이블 데이터 lms.community_like:~0 rows (대략적) 내보내기
DELETE FROM `community_like`;
/*!40000 ALTER TABLE `community_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_like` ENABLE KEYS */;

-- 테이블 lms.edu_grade 구조 내보내기
DROP TABLE IF EXISTS `edu_grade`;
CREATE TABLE IF NOT EXISTS `edu_grade` (
  `register_no` int(11) NOT NULL COMMENT '개별수강신청번호',
  `edu_credit_comple` int(11) NOT NULL COMMENT '이수학점',
  PRIMARY KEY (`register_no`),
  CONSTRAINT `FK_edu_grade_register` FOREIGN KEY (`register_no`) REFERENCES `register` (`register_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='성적';

-- 테이블 데이터 lms.edu_grade:~0 rows (대략적) 내보내기
DELETE FROM `edu_grade`;
/*!40000 ALTER TABLE `edu_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_grade` ENABLE KEYS */;

-- 테이블 lms.employee 구조 내보내기
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(11) NOT NULL COMMENT '직원사번',
  `employee_pass` varchar(50) NOT NULL COMMENT '직원비밀번호',
  `employee_name` varchar(50) NOT NULL COMMENT '이름',
  `employee_regi_no` varchar(50) NOT NULL COMMENT '주민번호',
  `employee_age` int(11) NOT NULL COMMENT '나이',
  `employee_gender` enum('여자','남자') NOT NULL COMMENT '성별',
  `employee_telephone` varchar(50) NOT NULL COMMENT '전화번호',
  `employee_email` varchar(50) NOT NULL COMMENT '이메일',
  `employee_address` varchar(50) NOT NULL COMMENT '주소',
  `employee_detail_address` varchar(50) NOT NULL COMMENT '상세주소',
  `employee_state` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '재직상태',
  `employee_active` enum('총관리자','서브관리자') NOT NULL DEFAULT '서브관리자' COMMENT '총관리자/서브관리자',
  `create_date` date NOT NULL COMMENT '생성일',
  `update_date` date NOT NULL COMMENT '수정일',
  `salary_no` varchar(50) NOT NULL DEFAULT 'E' COMMENT '연봉등급',
  PRIMARY KEY (`employee_no`),
  KEY `FK_employee_salary` (`salary_no`),
  CONSTRAINT `FK_employee_salary` FOREIGN KEY (`salary_no`) REFERENCES `salary` (`salary_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='총관리자/서브관리자(employee_active값으로 구분)';

-- 테이블 데이터 lms.employee:~0 rows (대략적) 내보내기
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- 테이블 lms.employee_img 구조 내보내기
DROP TABLE IF EXISTS `employee_img`;
CREATE TABLE IF NOT EXISTS `employee_img` (
  `employee_no` int(11) NOT NULL COMMENT '사번',
  `filename` varchar(50) NOT NULL COMMENT '현재파일이름',
  `origin_filename` varchar(50) NOT NULL COMMENT '기존파일이름',
  `content_type` varchar(50) NOT NULL COMMENT '파일형식',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`employee_no`),
  CONSTRAINT `FK_employee_img_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 이미지';

-- 테이블 데이터 lms.employee_img:~0 rows (대략적) 내보내기
DELETE FROM `employee_img`;
/*!40000 ALTER TABLE `employee_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_img` ENABLE KEYS */;

-- 테이블 lms.faq 구조 내보내기
DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `faq_no` int(11) NOT NULL COMMENT '번호',
  `faq_title` varchar(50) NOT NULL COMMENT '제목',
  `faq_content` varchar(500) NOT NULL COMMENT '내용',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`faq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='자주묻는질문';

-- 테이블 데이터 lms.faq:~0 rows (대략적) 내보내기
DELETE FROM `faq`;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- 테이블 lms.lecture 구조 내보내기
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecture_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `subject_approve_no` int(11) NOT NULL COMMENT '과목승인번호',
  `lecture_title` varchar(50) NOT NULL COMMENT '제목',
  `lecture_content` varchar(500) NOT NULL COMMENT '내용',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`lecture_no`) USING BTREE,
  KEY `FK_lecture_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_lecture_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강의자료';

-- 테이블 데이터 lms.lecture:~0 rows (대략적) 내보내기
DELETE FROM `lecture`;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;

-- 테이블 lms.lecture_file 구조 내보내기
DROP TABLE IF EXISTS `lecture_file`;
CREATE TABLE IF NOT EXISTS `lecture_file` (
  `lecturefile_no` int(11) NOT NULL COMMENT '파일번호',
  `lecture_no` int(11) NOT NULL COMMENT '번호',
  `lecture_filename` varchar(50) NOT NULL COMMENT '저장된이름',
  `lecture_originname` varchar(50) NOT NULL COMMENT '기존파일이름',
  `lecture_type` varchar(50) NOT NULL COMMENT '파일형식',
  `lecture_size` int(11) NOT NULL COMMENT '파일사이즈',
  PRIMARY KEY (`lecturefile_no`) USING BTREE,
  KEY `FK_lecture_file_lecture` (`lecture_no`),
  CONSTRAINT `FK_lecture_file_lecture` FOREIGN KEY (`lecture_no`) REFERENCES `lecture` (`lecture_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강의자료 파일';

-- 테이블 데이터 lms.lecture_file:~0 rows (대략적) 내보내기
DELETE FROM `lecture_file`;
/*!40000 ALTER TABLE `lecture_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_file` ENABLE KEYS */;

-- 테이블 lms.major 구조 내보내기
DROP TABLE IF EXISTS `major`;
CREATE TABLE IF NOT EXISTS `major` (
  `major_no` int(11) NOT NULL COMMENT '학과코드',
  `major_name` varchar(50) NOT NULL COMMENT '학과명',
  `major_room` varchar(50) NOT NULL COMMENT '학과방',
  PRIMARY KEY (`major_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학과';

-- 테이블 데이터 lms.major:~5 rows (대략적) 내보내기
DELETE FROM `major`;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` (`major_no`, `major_name`, `major_room`) VALUES
	(1001, '정보통신공학과', '102호');
INSERT INTO `major` (`major_no`, `major_name`, `major_room`) VALUES
	(1002, '실용음악학과', '105호');
INSERT INTO `major` (`major_no`, `major_name`, `major_room`) VALUES
	(1003, '항공과', '106호');
INSERT INTO `major` (`major_no`, `major_name`, `major_room`) VALUES
	(1004, '회계학과', '107호');
INSERT INTO `major` (`major_no`, `major_name`, `major_room`) VALUES
	(1005, '경제학과', '108호');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;

-- 테이블 lms.mulitple_test 구조 내보내기
DROP TABLE IF EXISTS `mulitple_test`;
CREATE TABLE IF NOT EXISTS `mulitple_test` (
  `multiplechoice_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '문제번호',
  `test_no` int(11) NOT NULL COMMENT '시험번호',
  `multiplechoice_question` varchar(500) NOT NULL COMMENT '문제',
  `multiplechoice_answer` int(11) NOT NULL COMMENT '정답',
  `multiplechoice_score` int(11) NOT NULL COMMENT '점수',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`multiplechoice_no`) USING BTREE,
  KEY `FK_mulitple_test_test` (`test_no`),
  CONSTRAINT `FK_mulitple_test_test` FOREIGN KEY (`test_no`) REFERENCES `test` (`test_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='객관식문제';

-- 테이블 데이터 lms.mulitple_test:~0 rows (대략적) 내보내기
DELETE FROM `mulitple_test`;
/*!40000 ALTER TABLE `mulitple_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `mulitple_test` ENABLE KEYS */;

-- 테이블 lms.multiple_test_example 구조 내보내기
DROP TABLE IF EXISTS `multiple_test_example`;
CREATE TABLE IF NOT EXISTS `multiple_test_example` (
  `multiplechoice_no` int(11) NOT NULL COMMENT '문제번호',
  `multiple_test_example_no` int(11) NOT NULL COMMENT '보기번호',
  `multiple_test_example_content` varchar(500) NOT NULL COMMENT '문제내용',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`multiple_test_example_no`,`multiplechoice_no`) USING BTREE,
  KEY `FK_multiple_test_example_mulitple_test` (`multiplechoice_no`),
  CONSTRAINT `FK_multiple_test_example_mulitple_test` FOREIGN KEY (`multiplechoice_no`) REFERENCES `mulitple_test` (`multiplechoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='문제에 대한 보기';

-- 테이블 데이터 lms.multiple_test_example:~0 rows (대략적) 내보내기
DELETE FROM `multiple_test_example`;
/*!40000 ALTER TABLE `multiple_test_example` DISABLE KEYS */;
/*!40000 ALTER TABLE `multiple_test_example` ENABLE KEYS */;

-- 테이블 lms.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_no` int(11) NOT NULL COMMENT '번호',
  `notice_title` varchar(50) NOT NULL COMMENT '공지제목',
  `notice_content` varchar(500) NOT NULL COMMENT '공지내용',
  `notice_writer` varchar(50) NOT NULL COMMENT '작성자',
  `cnt` int(11) NOT NULL COMMENT '조회수',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`notice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='전체공지사항';

-- 테이블 데이터 lms.notice:~0 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 lms.professor 구조 내보내기
DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `professor_no` int(11) NOT NULL COMMENT '교수사번(아이디)',
  `professor_pass` varchar(50) NOT NULL COMMENT '교수비밀번호',
  `major_no` int(11) NOT NULL COMMENT '학과코드',
  `professor_name` varchar(50) NOT NULL COMMENT '이름',
  `professor_regi_no` varchar(50) NOT NULL COMMENT '주민번호',
  `professor_age` int(11) NOT NULL COMMENT '나이',
  `professor_gender` enum('남자','여자') NOT NULL COMMENT '성별',
  `professor_telephone` varchar(50) NOT NULL COMMENT '전화번호',
  `professor_email` varchar(50) NOT NULL COMMENT '이메일',
  `professor_address` varchar(50) NOT NULL COMMENT '주소',
  `professor_detail_address` varchar(50) NOT NULL COMMENT '상세주소',
  `professor_room` varchar(50) DEFAULT NULL COMMENT '교수실',
  `professor_state` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '재직상태',
  `create_date` date NOT NULL COMMENT '생성일',
  `update_date` date NOT NULL COMMENT '수정일',
  `salary_no` varchar(50) NOT NULL DEFAULT 'E' COMMENT '연봉등급',
  PRIMARY KEY (`professor_no`),
  KEY `FK_professor_major` (`major_no`),
  KEY `FK_professor_salary` (`salary_no`),
  CONSTRAINT `FK_professor_major` FOREIGN KEY (`major_no`) REFERENCES `major` (`major_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_professor_salary` FOREIGN KEY (`salary_no`) REFERENCES `salary` (`salary_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='교수\r\n';

-- 테이블 데이터 lms.professor:~0 rows (대략적) 내보내기
DELETE FROM `professor`;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

-- 테이블 lms.professor_assess 구조 내보내기
DROP TABLE IF EXISTS `professor_assess`;
CREATE TABLE IF NOT EXISTS `professor_assess` (
  `professor_assess_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `register_no` int(11) NOT NULL,
  `professor_assess_score` int(11) NOT NULL COMMENT '만족도점수',
  PRIMARY KEY (`professor_assess_no`),
  KEY `FK_professor_assess_register` (`register_no`),
  CONSTRAINT `FK_professor_assess_register` FOREIGN KEY (`register_no`) REFERENCES `register` (`register_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생이 하는 교수 만족도 평가';

-- 테이블 데이터 lms.professor_assess:~0 rows (대략적) 내보내기
DELETE FROM `professor_assess`;
/*!40000 ALTER TABLE `professor_assess` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_assess` ENABLE KEYS */;

-- 테이블 lms.professor_homework 구조 내보내기
DROP TABLE IF EXISTS `professor_homework`;
CREATE TABLE IF NOT EXISTS `professor_homework` (
  `pf_homework_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과제생성번호',
  `subject_approve_no` int(11) NOT NULL COMMENT '과목승인번호',
  `pf_homework_title` varchar(50) NOT NULL COMMENT '제목',
  `pf_homework_content` varchar(500) NOT NULL COMMENT '내용',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`pf_homework_no`),
  KEY `FK_professor_homework_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_professor_homework_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='교수과제제출';

-- 테이블 데이터 lms.professor_homework:~0 rows (대략적) 내보내기
DELETE FROM `professor_homework`;
/*!40000 ALTER TABLE `professor_homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_homework` ENABLE KEYS */;

-- 테이블 lms.professor_img 구조 내보내기
DROP TABLE IF EXISTS `professor_img`;
CREATE TABLE IF NOT EXISTS `professor_img` (
  `professor_no` int(11) NOT NULL COMMENT '교수사번',
  `content_type` varchar(50) NOT NULL COMMENT '파일형식',
  `filename` varchar(50) NOT NULL COMMENT '현재파일이름',
  `origin_filename` varchar(50) NOT NULL COMMENT '기존파일이름',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`professor_no`),
  CONSTRAINT `FK_professor_img_professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='교수이미지';

-- 테이블 데이터 lms.professor_img:~0 rows (대략적) 내보내기
DELETE FROM `professor_img`;
/*!40000 ALTER TABLE `professor_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_img` ENABLE KEYS */;

-- 테이블 lms.question 구조 내보내기
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_no` int(11) NOT NULL COMMENT '번호',
  `student_no` int(11) NOT NULL COMMENT '작성자',
  `question_title` varchar(50) NOT NULL COMMENT '글제목',
  `question_content` varchar(500) NOT NULL COMMENT '글내용',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`question_no`),
  KEY `FK_question_student` (`student_no`),
  CONSTRAINT `FK_question_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='질문';

-- 테이블 데이터 lms.question:~0 rows (대략적) 내보내기
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 lms.register 구조 내보내기
DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `register_no` int(11) NOT NULL COMMENT '수강신청번호',
  `student_no` int(11) NOT NULL COMMENT '학생사번',
  `subject_approve_no` int(11) NOT NULL COMMENT '승인과목코드',
  `create_date` datetime NOT NULL COMMENT '작성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`register_no`) USING BTREE,
  KEY `FK_register_student` (`student_no`),
  KEY `FK_register_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_register_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_register_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='수강신청';

-- 테이블 데이터 lms.register:~0 rows (대략적) 내보내기
DELETE FROM `register`;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- 테이블 lms.salary 구조 내보내기
DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `salary_no` varchar(50) NOT NULL DEFAULT 'D' COMMENT '연봉등급',
  `salary_value` int(11) NOT NULL COMMENT '연봉',
  PRIMARY KEY (`salary_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='연봉\r\n\r\nA : 10000\r\nB : 9000\r\nC : 8000\r\nD : 7000\r\nE : 6000';

-- 테이블 데이터 lms.salary:~0 rows (대략적) 내보내기
DELETE FROM `salary`;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;

-- 테이블 lms.scholar 구조 내보내기
DROP TABLE IF EXISTS `scholar`;
CREATE TABLE IF NOT EXISTS `scholar` (
  `scholar_no` int(11) NOT NULL COMMENT '장학코드',
  `scholar_name` varchar(50) NOT NULL COMMENT '장학명',
  `scholar_price` int(11) NOT NULL COMMENT '장학금액',
  PRIMARY KEY (`scholar_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장학';

-- 테이블 데이터 lms.scholar:~0 rows (대략적) 내보내기
DELETE FROM `scholar`;
/*!40000 ALTER TABLE `scholar` DISABLE KEYS */;
/*!40000 ALTER TABLE `scholar` ENABLE KEYS */;

-- 테이블 lms.student 구조 내보내기
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(11) NOT NULL COMMENT '학생 학번',
  `student_pass` varchar(50) NOT NULL COMMENT '학생 비밀번호',
  `major_no` int(11) NOT NULL COMMENT '학과코드',
  `student_name` varchar(50) NOT NULL COMMENT '이름',
  `student_regi_no` varchar(50) NOT NULL COMMENT '주민번호',
  `student_age` int(11) NOT NULL COMMENT '나이',
  `student_gender` enum('남자','여자') NOT NULL COMMENT '성별',
  `student_telephone` varchar(50) NOT NULL COMMENT '전화번호',
  `student_email` varchar(50) NOT NULL COMMENT '이메일',
  `student_address` varchar(50) NOT NULL COMMENT '주소',
  `student_detail_address` varchar(50) NOT NULL COMMENT '상세주소',
  `student_state` enum('휴학','제적','자퇴','재학') NOT NULL DEFAULT '재학' COMMENT '학적상태(휴학,재적,자퇴,재학)',
  `student_top` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '과대표',
  `student_active` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '계정상태',
  `create_date` date NOT NULL COMMENT '생성일',
  `update_date` date NOT NULL COMMENT '수정일',
  `club_no` varchar(50) DEFAULT NULL COMMENT '동아리코드',
  `scholar_no` int(11) DEFAULT NULL COMMENT '장학코드',
  PRIMARY KEY (`student_no`),
  KEY `FK_student_major` (`major_no`),
  KEY `FK_student_club` (`club_no`),
  KEY `FK_student_scholar` (`scholar_no`),
  CONSTRAINT `FK_student_club` FOREIGN KEY (`club_no`) REFERENCES `club` (`club_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_major` FOREIGN KEY (`major_no`) REFERENCES `major` (`major_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_scholar` FOREIGN KEY (`scholar_no`) REFERENCES `scholar` (`scholar_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생';

-- 테이블 데이터 lms.student:~0 rows (대략적) 내보내기
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_pass`, `major_no`, `student_name`, `student_regi_no`, `student_age`, `student_gender`, `student_telephone`, `student_email`, `student_address`, `student_detail_address`, `student_state`, `student_top`, `student_active`, `create_date`, `update_date`, `club_no`, `scholar_no`) VALUES
	(300001, '1234', 1005, '김희원', '000209-222222', 23, '여자', '010-2222-2222', 'khw001@naver.com', '서울특별시 동작구', '어떤 아파트 102동 1209호', '재학', 'N', 'Y', '0000-00-00', '0000-00-00', NULL, NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 lms.student_homework 구조 내보내기
DROP TABLE IF EXISTS `student_homework`;
CREATE TABLE IF NOT EXISTS `student_homework` (
  `pf_homework_no` int(11) NOT NULL COMMENT '과제생성번호',
  `student_no` int(11) NOT NULL COMMENT '학생 학번',
  `homework_title` varchar(50) NOT NULL COMMENT '과제제목',
  `homework_content` text NOT NULL COMMENT '과제내용',
  PRIMARY KEY (`pf_homework_no`) USING BTREE,
  KEY `FK_student_homework_register` (`student_no`),
  CONSTRAINT `FK_student_homework_professor_homework` FOREIGN KEY (`pf_homework_no`) REFERENCES `professor_homework` (`pf_homework_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_homework_register` FOREIGN KEY (`student_no`) REFERENCES `register` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생과제제출';

-- 테이블 데이터 lms.student_homework:~0 rows (대략적) 내보내기
DELETE FROM `student_homework`;
/*!40000 ALTER TABLE `student_homework` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_homework` ENABLE KEYS */;

-- 테이블 lms.student_homework_file 구조 내보내기
DROP TABLE IF EXISTS `student_homework_file`;
CREATE TABLE IF NOT EXISTS `student_homework_file` (
  `pf_homework_no` int(11) NOT NULL COMMENT '과제생성번호',
  `student_no` int(11) NOT NULL COMMENT '학생 학번',
  `homework_filename` varchar(50) NOT NULL COMMENT '현재파일이름',
  `homework_originname` varchar(50) NOT NULL COMMENT '기존파일이름',
  `homework_filetype` varchar(50) NOT NULL COMMENT '파일형식',
  `homework_filesize` int(11) NOT NULL COMMENT '파일크기',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`pf_homework_no`) USING BTREE,
  KEY `FK_student_homework_file_student_homework_2` (`student_no`),
  CONSTRAINT `FK_student_homework_file_student_homework` FOREIGN KEY (`pf_homework_no`) REFERENCES `student_homework` (`pf_homework_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_homework_file_student_homework_2` FOREIGN KEY (`student_no`) REFERENCES `student_homework` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생과제제출파일';

-- 테이블 데이터 lms.student_homework_file:~0 rows (대략적) 내보내기
DELETE FROM `student_homework_file`;
/*!40000 ALTER TABLE `student_homework_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_homework_file` ENABLE KEYS */;

-- 테이블 lms.student_img 구조 내보내기
DROP TABLE IF EXISTS `student_img`;
CREATE TABLE IF NOT EXISTS `student_img` (
  `student_no` int(11) NOT NULL COMMENT '학번',
  `filename` varchar(50) NOT NULL COMMENT '현재파일이름',
  `origin_filename` varchar(50) NOT NULL COMMENT '기존파일이름',
  `content_type` varchar(50) NOT NULL COMMENT '파일형식',
  `create_date` datetime NOT NULL COMMENT '생성일',
  `update_date` datetime NOT NULL COMMENT '수정일',
  PRIMARY KEY (`student_no`),
  CONSTRAINT `FK_student_img_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생 이미지';

-- 테이블 데이터 lms.student_img:~0 rows (대략적) 내보내기
DELETE FROM `student_img`;
/*!40000 ALTER TABLE `student_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_img` ENABLE KEYS */;

-- 테이블 lms.subject 구조 내보내기
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_no` varchar(50) NOT NULL COMMENT '과목코드',
  `subject_name` varchar(50) NOT NULL COMMENT '과목명',
  `subject_state` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '개설상태',
  `subject_credit` int(11) NOT NULL COMMENT '학점',
  `subject_major` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '전필여부',
  `create_date` datetime NOT NULL COMMENT '개설날짜',
  `end_date` datetime NOT NULL COMMENT '폐강날짜',
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='과목';

-- 테이블 데이터 lms.subject:~0 rows (대략적) 내보내기
DELETE FROM `subject`;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- 테이블 lms.subject_approve 구조 내보내기
DROP TABLE IF EXISTS `subject_approve`;
CREATE TABLE IF NOT EXISTS `subject_approve` (
  `subject_approve_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과목승인번호',
  `major_no` int(11) NOT NULL COMMENT '학과명',
  `subject_no` varchar(50) NOT NULL COMMENT '과목명',
  `professor_no` int(11) NOT NULL COMMENT '교수사번(아이디)',
  `year` int(11) NOT NULL COMMENT '년도',
  `semester` int(11) NOT NULL COMMENT '학기',
  `start_date` datetime NOT NULL COMMENT '개강일',
  `end_date` datetime NOT NULL COMMENT '종강일',
  `total_date` int(11) NOT NULL COMMENT '총수업일수(계산해서 넣어주기)',
  `approve_active` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '개설과목 승인',
  `subject_room` varchar(255) NOT NULL COMMENT '강의실',
  `day` enum('월','화','수','목','금') NOT NULL COMMENT '요일',
  `start_time` int(11) NOT NULL COMMENT '시작시간',
  `end_time` int(11) NOT NULL COMMENT '종료시간',
  PRIMARY KEY (`subject_approve_no`),
  KEY `FK_subject_approve_major` (`major_no`),
  KEY `FK_subject_approve_subject` (`subject_no`),
  KEY `FK_subject_approve_professor` (`professor_no`),
  CONSTRAINT `FK_subject_approve_major` FOREIGN KEY (`major_no`) REFERENCES `major` (`major_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subject_approve_professor` FOREIGN KEY (`professor_no`) REFERENCES `professor` (`professor_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subject_approve_subject` FOREIGN KEY (`subject_no`) REFERENCES `subject` (`subject_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='학과별 승인된 과목';

-- 테이블 데이터 lms.subject_approve:~0 rows (대략적) 내보내기
DELETE FROM `subject_approve`;
/*!40000 ALTER TABLE `subject_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_approve` ENABLE KEYS */;

-- 테이블 lms.subject_assess 구조 내보내기
DROP TABLE IF EXISTS `subject_assess`;
CREATE TABLE IF NOT EXISTS `subject_assess` (
  `student_assess_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `register_no` int(11) NOT NULL,
  `s_assess_score` int(11) NOT NULL COMMENT '만족도점수',
  PRIMARY KEY (`student_assess_no`) USING BTREE,
  KEY `FK_subject_assess_register` (`register_no`),
  CONSTRAINT `FK_subject_assess_register` FOREIGN KEY (`register_no`) REFERENCES `register` (`register_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생이 하는 과목 만족도 평가';

-- 테이블 데이터 lms.subject_assess:~0 rows (대략적) 내보내기
DELETE FROM `subject_assess`;
/*!40000 ALTER TABLE `subject_assess` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_assess` ENABLE KEYS */;

-- 테이블 lms.subject_notice 구조 내보내기
DROP TABLE IF EXISTS `subject_notice`;
CREATE TABLE IF NOT EXISTS `subject_notice` (
  `subject_notice_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과목공지사항번호',
  `subject_approve_no` int(11) NOT NULL COMMENT '과목승인번호',
  `sb_notice_title` varchar(50) NOT NULL COMMENT '공지사항제목',
  `sb_notice_context` text NOT NULL COMMENT '공지사항내용',
  `cnt` int(11) NOT NULL COMMENT '조회수',
  `create_date` datetime NOT NULL COMMENT '공지사항작성일',
  `update_date` datetime NOT NULL COMMENT '공지사항수정일',
  PRIMARY KEY (`subject_notice_no`),
  KEY `FK_subject_notice_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_subject_notice_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='과목공지사항';

-- 테이블 데이터 lms.subject_notice:~0 rows (대략적) 내보내기
DELETE FROM `subject_notice`;
/*!40000 ALTER TABLE `subject_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_notice` ENABLE KEYS */;

-- 테이블 lms.subject_notice_like 구조 내보내기
DROP TABLE IF EXISTS `subject_notice_like`;
CREATE TABLE IF NOT EXISTS `subject_notice_like` (
  `subject_notice_no` int(11) NOT NULL COMMENT '과목공지사항번호',
  `student_no` int(11) NOT NULL COMMENT '학생학번',
  PRIMARY KEY (`subject_notice_no`,`student_no`) USING BTREE,
  KEY `FK_subject_notice_like_register` (`student_no`),
  CONSTRAINT `FK_subject_notice_like_register` FOREIGN KEY (`student_no`) REFERENCES `register` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subject_notice_like_subject_notice` FOREIGN KEY (`subject_notice_no`) REFERENCES `subject_notice` (`subject_notice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='과목공지사항 좋아요';

-- 테이블 데이터 lms.subject_notice_like:~0 rows (대략적) 내보내기
DELETE FROM `subject_notice_like`;
/*!40000 ALTER TABLE `subject_notice_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_notice_like` ENABLE KEYS */;

-- 테이블 lms.test 구조 내보내기
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `test_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '시험번호',
  `subject_approve_no` int(11) NOT NULL COMMENT '과목승인번호',
  `test_name` enum('중간',' 기말') NOT NULL COMMENT '중간/기말',
  PRIMARY KEY (`test_no`),
  KEY `FK_test_subject_approve` (`subject_approve_no`),
  CONSTRAINT `FK_test_subject_approve` FOREIGN KEY (`subject_approve_no`) REFERENCES `subject_approve` (`subject_approve_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='중간/기말';

-- 테이블 데이터 lms.test:~0 rows (대략적) 내보내기
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 테이블 lms.test_answer 구조 내보내기
DROP TABLE IF EXISTS `test_answer`;
CREATE TABLE IF NOT EXISTS `test_answer` (
  `multiplechoice_no` int(11) NOT NULL COMMENT '문제번호',
  `student_no` int(11) NOT NULL COMMENT '학생 학번',
  `answer_select` int(11) NOT NULL COMMENT '선택한답',
  `answer_score` int(11) NOT NULL COMMENT '점수',
  PRIMARY KEY (`multiplechoice_no`,`student_no`),
  KEY `FK_test_answer_register` (`student_no`),
  CONSTRAINT `FK_test_answer_mulitple_test` FOREIGN KEY (`multiplechoice_no`) REFERENCES `mulitple_test` (`multiplechoice_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_test_answer_register` FOREIGN KEY (`student_no`) REFERENCES `register` (`student_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='학생이 작성한 답안지';

-- 테이블 데이터 lms.test_answer:~0 rows (대략적) 내보내기
DELETE FROM `test_answer`;
/*!40000 ALTER TABLE `test_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_answer` ENABLE KEYS */;

-- 테이블 lms.timetable 구조 내보내기
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `timetable_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '스케쥴러번호',
  `register_no` int(11) NOT NULL,
  PRIMARY KEY (`timetable_no`) USING BTREE,
  KEY `FK_timetable_register` (`register_no`),
  CONSTRAINT `FK_timetable_register` FOREIGN KEY (`register_no`) REFERENCES `register` (`register_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='시간표';

-- 테이블 데이터 lms.timetable:~0 rows (대략적) 내보내기
DELETE FROM `timetable`;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
