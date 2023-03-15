-- 성분으로 구분한 아이스크림 총 주문량

-- 상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량을
-- 총주문량이 작은 순서대로 조회
-- 이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.

-- 두 테이블의 같은 컬럼(FLAVOR)에 JOIN
-- 결과로 뽑을 컬럼 지정
-- TOTAL_ORDER를 합산해야 하므로 SUM (COUNT 아님. 헷갈리지 않기)
-- 조회는 성분별로이므로, GROUP BY II.INGREDIENT_TYPE
SELECT II.INGREDIENT_TYPE, SUM(FH.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF FH
INNER JOIN ICECREAM_INFO II ON II.FLAVOR = FH.FLAVOR
GROUP BY II.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC