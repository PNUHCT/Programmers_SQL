-- 상품 별 오프라인 매출 구하기

-- PRODUCT 테이블과 OFFLINE_SALE 테이블에서 
-- 상품코드 별 매출액(판매가 * 판매량) 합계를 출력
-- 매출액을 기준으로 내림차순 정렬
-- 매출액이 같다면 상품코드를 기준으로 오름차순 정렬

-- 두 테이블을 같은 컬럼인 PRODUCT_ID로 JOIN
-- 두 컬럼의 곱의 합계를 SUM 메소드로 구하고, SALES로 명명
-- PRODUCT_CODE로 그룹화 하고 (그룹화안하면 총합이 되어버림)
-- 정렬

SELECT PD.PRODUCT_CODE, SUM(PD.PRICE * OS.SALES_AMOUNT) AS SALES
FROM PRODUCT PD
INNER JOIN OFFLINE_SALE OS ON PD.PRODUCT_ID LIKE OS.PRODUCT_ID
GROUP BY PD.PRODUCT_CODE
ORDER BY SALES DESC, PD.PRODUCT_CODE ASC