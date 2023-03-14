-- USER_INFO 테이블에서 
-- 나이 정보가 없는 회원이 몇 명인지 출력
-- 이때 컬럼명은 USERS로 지정해주세요.

-- null값까지 count하기 위해선 *로 지정
SELECT COUNT(*) AS USERS
FROM USER_INFO
-- 나이 컬럼이 is null인 경우 필터링
WHERE AGE IS NULL