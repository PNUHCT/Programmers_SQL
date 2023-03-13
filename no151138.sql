-- 모든 컬럼 선택해줌
SELECT HISTORY_ID, CAR_ID,
    DATE_FORMAT(START_DATE, '%Y-%m-%d'), -- 비교할 두 날짜 컬럼 포맷팅
    DATE_FORMAT(END_DATE, '%Y-%m-%d'),
    if(DATEDIFF(END_DATE, START_DATE) >= 29, '장기 대여', '단기 대여') RENT_TYPE -- 둘 사이의 차이는 DATEDIFF, T/F에 따른 표기 및 컬럼명
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE DATE_FORMAT(START_DATE, "%Y-%m") LIKE '2022-09' -- 그 중 2022-09 이상인 애들만 추림
ORDER BY HISTORY_ID DESC -- 정렬조건은 대여기록ID DESC