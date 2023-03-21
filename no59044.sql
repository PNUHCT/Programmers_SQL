-- 오랜 기간 보호한 동물(1)

-- 아직 입양을 못 간 동물 중, 
-- 가장 오래 보호소에 있었던
-- 동물 3마리의 이름과 보호 시작일을 조회
-- 결과는 보호 시작일 순으로 조회

-- 차집합은 LEFT(또는 RIGHT) JOIN 사용
-- WHERE문을 이용해 비교_컬럼명 IS NULL을 이용한 차집합을 완성함

SELECT
    INS.NAME, 
    INS.DATETIME
FROM ANIMAL_INS INS
LEFT JOIN ANIMAL_OUTS OUTS ON OUTS.ANIMAL_ID LIKE INS.ANIMAL_ID
WHERE OUTS.ANIMAL_ID IS NULL 
ORDER BY INS.DATETIME LIMIT 3