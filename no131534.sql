-- 문제 --
-- USER_INFO 테이블과 ONLINE_SALE 테이블에서 -> FROM, JOIN
-- 2021년에 가입한 전체 회원들 중 -> WHERE
-- 상품을 구매한 회원수와, 상품을 구매한 회원의 비율 -> GROUP BY
-- (=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을
-- 년, 월 별로 출력 -> SELECT

-- 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림
-- 전체 결과는 년을 기준으로 오름차순 정렬
-- 년이 같다면 월을 기준으로 오름차순 정렬

-- 풀이 --
-- 조회할 컬럼 지정
-- 년, 월은 DATE_FORMAT을 써도 되나, DATE_FORMAT로 MONTH 표시시, 01, 02 등으로 나오므로 추가 작업 필요
-- COUNT는 GROUP BY를 이용해 2021년도 가입자만 COUNT하며, 이때, 중복 구매자를 제거해야하므로 DISTINCT 필수
-- 비율은 곧 "중복을_제외한_각_2021년_월별_가입자 / 2021년_전체_가입자로 나눈 값"이므로,
-- 2021 전체를 구하기 위한 서브쿼리 사용
-- FROM 및 JOIN은 서로 테이블 순서 바꿔도 상관없음
-- GROUP BY는 문제에서 "년,월 별로"라고했으므로 그대로 사용
-- ORDER BY도 오름차순이므로 ASC 생략

SELECT 
    YEAR(SALES_DATE) AS YEAR, 
    MONTH(SALES_DATE) AS MONTH, 
    COUNT(DISTINCT(OS.USER_ID)) AS PUCHASED_USERS,
    ROUND(COUNT(DISTINCT(OS.USER_ID))/(
        SELECT COUNT(USER_ID) FROM USER_INFO WHERE YEAR(JOINED) LIKE "2021"
    ), 1) AS PUCHASED_RATIO
FROM USER_INFO UI
INNER JOIN ONLINE_SALE OS ON OS.USER_ID LIKE UI.USER_ID
WHERE YEAR(JOINED) LIKE "2021"
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH