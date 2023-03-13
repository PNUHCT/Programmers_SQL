-- 상반기 아이스크림 총주문량이 3,000보다 높으면서 
-- 아이스크림의 주 성분이 과일인 아이스크림의 맛을 
-- 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.

SELECT FH.FLAVOR
FROM FIRST_HALF FH
INNER JOIN ICECREAM_INFO II ON II.FLAVOR LIKE FH.FLAVOR
WHERE FH.TOTAL_ORDER >= 3000 AND II.INGREDIENT_TYPE LIKE "fruit_based"
ORDER BY TOTAL_ORDER DESC