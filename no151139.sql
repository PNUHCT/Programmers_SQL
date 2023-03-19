-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
-- 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 
-- 총 대여 횟수가 5회 이상인 자동차들
-- 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력
-- 월을 기준으로 오름차순 정렬
-- 월이 같다면 자동차 ID를 기준으로 내림차순 정렬
-- 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.


SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(HISTORY_ID) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID
    IN (
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" AND "2022-10"
        GROUP BY CAR_ID
        HAVING COUNT(CAR_ID) >= 5
    ) 
    AND DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" AND "2022-10"
    -- 서브쿼리와 같은 WHERE 필터를 메인쿼리에서도 한번 더 해주는 이유 :
    -- 서브쿼리에서는 시작기간이 8~10월인 CAR_ID만 나오도록 필터링 한다.
    -- 이후 메인쿼리에서는 다시 테이블에서 8~10월인 HISTORY_ID를 필터링해야 하기때문에 두번 조건을 건다.
GROUP BY CAR_ID, MONTH
HAVING RECORDS > 0
ORDER BY MONTH ASC, CAR_ID DESC