-- 진료과별 총 예약 횟수 출력하기

-- APPOINTMENT 테이블에서 
-- 2022년 5월에 예약한 환자 수를 
-- 진료과코드 별로 조회
-- 이때, 컬럼명은 '진료과 코드', '5월예약건수'로 지정
-- 결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬
-- 예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬

-- 정렬 조건을 AS로 한 '5월예약건수'로 지정하면 올바르게 수행되지 않음
-- 따라서 ORDER BY COUNT(*)로 지정해줘야 함
SELECT 
    MCDP_CD AS '진료과코드',
    COUNT(*) AS '5월예약건수'
FROM  
    APPOINTMENT
WHERE 
    DATE_FORMAT(APNT_YMD, "%Y-%m") LIKE "2022-05%" 
GROUP BY 
    MCDP_CD
ORDER BY 
    COUNT(*), MCDP_CD