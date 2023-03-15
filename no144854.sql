-- '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력
-- 결과는 출판일을 기준으로 오름차순 정렬해주세요.

-- BOOK 테이블에 있는 AUTHOR_ID에 AUTHOR를 JOIN해주고,
-- 각 테이블에서 필요한 컬럼을 SELECT
-- 이때, 출판일은 DATE_FORMAT으로 지정해줘야 원하는 결과 형태로 나옴
-- 카테고리는 '경제'를 포함해야함
SELECT BK.BOOK_ID, AR.AUTHOR_NAME, DATE_FORMAT(BK.PUBLISHED_DATE, "%Y-%m-%d") AS PUBLISHED_DATE
FROM BOOK BK
INNER JOIN AUTHOR AR ON AR.AUTHOR_ID = BK.AUTHOR_ID
WHERE BK.CATEGORY LIKE "경제"
ORDER BY BK.PUBLISHED_DATE