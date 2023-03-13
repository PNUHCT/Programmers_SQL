-- 상반기 아이스크림 총주문량이 3,000보다 높으면서 
-- 아이스크림의 주 성분이 과일인 아이스크림의 맛을 
-- 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.

-- FIRST_HALF의 FLAVOR를 출력할것임
SELECT FH.FLAVOR
FROM FIRST_HALF FH
-- ICECREAM_INFO 테이블을 조인 FLAVOR가 공통인자이므로 ON FLAVOR
INNER JOIN ICECREAM_INFO II ON II.FLAVOR LIKE FH.FLAVOR
-- 필토 조건 AND로 넣어줌
WHERE FH.TOTAL_ORDER >= 3000 AND II.INGREDIENT_TYPE LIKE "fruit_based"
-- 정렬
ORDER BY TOTAL_ORDER DESC