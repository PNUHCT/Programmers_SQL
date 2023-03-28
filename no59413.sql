-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
-- 0시부터 23시까지, 
-- 각 시간대별로 입양이 몇 건이나 발생했는지 조회
-- 결과는 시간대 순으로 정렬

-- SET @을 이용해 변수선언
SET @HOUR = -1;

-- 변수를 이용해 0부터 23까지의 테이블 LOW를 만들어줌
-- COUNT는 기존 테이블에서 시간값이 @HOUR와 같은 값을 갖는 값만 COUNT
SELECT 
    (@HOUR := @HOUR+1) AS "HOUR",
    (SELECT COUNT(*) 
       FROM ANIMAL_OUTS
       WHERE HOUR(DATETIME) = @HOUR
       ) AS "COUNT"
       
-- 테이블 선택
FROM ANIMAL_OUTS

-- 23시까지로 고정하지 않으면 무제한 나옴
WHERE @HOUR < 23