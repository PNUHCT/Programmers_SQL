-- 카테고리 별 상품 개수 구하기

-- PRODUCT 테이블에서 
-- 상품 카테고리 코드(PRODUCT_CODE 앞 2자리) 별 상품 개수를 출력
-- 상품 카테고리 코드를 기준으로 오름차순 정렬

-- 왼쪽의 두글자만 선택하는 방법 : LEFT(컬럼명, 2)
-- 전체를 조건에 맞게 카운트 할 것이므로 COUNT(*)
SELECT 
    LEFT(PRODUCT_CODE, 2) AS CATEGORY,
    COUNT(*) AS PRODUCTS
FROM PRODUCT 
GROUP BY CATEGORY
ORDER BY CATEGORY