-- DOCTOR 테이블에서 
-- 진료과가 흉부외과(CS)이거나 일반외과(GS)인 
-- 의사의 이름, 의사ID, 진료과, 고용일자를 조회
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬
-- 고용일자가 같다면 이름을 기준으로 오름차순 정렬

SELECT DR_NAME, DR_ID, MCDP_CD, 
    DATE_FORMAT(HIRE_YMD, "%Y-%m-%d") HIRE_YMD  -- 컬럼 형식 맞춰주기
FROM DOCTOR -- 테이블 설정
WHERE MCDP_CD LIKE "%CS%" OR MCDP_CD LIKE "%GS%" -- 조건 2개 
ORDER BY HIRE_YMD DESC, DR_NAME ASC -- 정렬 조건