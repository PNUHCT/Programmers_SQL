-- 가격대 별 상품 개수 구하기

-- PRODUCT 테이블에서
-- 만원 단위의 가격대 별로 상품 개수를 출력
-- 이때 컬럼명은 각각 컬럼명은 PRICE_GROUP, PRODUCTS로 지정
-- 가격대 정보는 각 구간의 최소금액(10,000원 이상 ~ 20,000 미만인 구간인 경우 10,000)으로 표시
-- 가격대를 기준으로 오름차순 정렬

-- 1. SELECT 문에서 구성하기
SELECT
    FLOOR(PRICE/10000)*10000 AS PRICE_GROUP,
    COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP

-- 2. 테이블 설정부터 그룹화
-- SELECT 
--     PRICE_GROUP,
--     COUNT(PRICE_GROUP) AS PRODUCTS
-- FROM (
--     SELECT FLOOR(PRICE/10000)*10000 AS PRICE_GROUP 
--     FROM PRODUCT
-- )
-- GROUP BY PRICE_GROUP
-- ORDER BY PRICE_GROUP