-- 재구매가 일어난 상품과 회원 리스트 구하기

-- ONLINE_SALE 테이블에서 
-- 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여,
-- 재구매한 회원 ID와 재구매한 상품 ID를 출력
-- 결과는 회원 ID를 기준으로 오름차순 정렬
-- 회원 ID가 같다면 상품 ID를 기준으로 내림차순 정렬

-- 원하는 컬럼 지정
-- 두 컬럼에 대한 COUNT를 해줄 것이므로, 두 컬럼 모두 GROUP BY
-- 이때, AND쓰면 합쳐져버리므로, ','사용
-- 두 컬럼 모두 적용해야하므로 COUNT(*)
-- 중복 검사이므로, >1이면 2 이상이 되므로 중복 검사
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*)>1
ORDER BY USER_ID ASC, PRODUCT_ID DESC