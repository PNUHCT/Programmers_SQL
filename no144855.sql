-- 2022년 1월의 카테고리 별
-- 도서 판매량을 합산
-- 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력
-- 결과는 카테고리명을 기준으로 오름차순 정렬

SELECT BK.CATEGORY,SUM(BS.SALES) AS TOTAL_SALES
FROM BOOK_SALES BS
INNER JOIN BOOK BK
ON BS.BOOK_ID LIKE BK.BOOK_ID
WHERE DATE_FORMAT(BS.SALES_DATE, "%Y-%m") LIKE "2022-01"
GROUP BY BK.CATEGORY
ORDER BY BK.CATEGORY ASC