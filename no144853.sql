-- BOOK 테이블에서 2021년에 출판된 '인문' 카테고리에 속하는 도서 리스트를 찾아서
-- 도서 ID(BOOK_ID), 출판일 (PUBLISHED_DATE)을 출력하는 SQL문을 작성해주세요.
-- 결과는 출판일을 기준으로 오름차순 정렬해주세요.
-- BOOK_ID와 PUBLISHED_DATE를 출력할 것이다. 이때, PUBLISHED_DATE는 date_format화 해서 필터링 할때 사용
SELECT BOOK_ID, date_format(BK.PUBLISHED_DATE, "%Y-%m-%d") PUBLISHED_DATE
FROM BOOK BK  -- 테이블 선택
WHERE BK.PUBLISHED_DATE LIKE "2021%" AND CATEGORY LIKE "인문" -- 두 가지 필터 조건
ORDER BY BOOK_ID ASC