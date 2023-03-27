-- MEMBER_PROFILE와 REST_REVIEW 테이블에서 
-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회

-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
-- 결과는 리뷰 작성일을 기준으로 오름차순
-- 리뷰 텍스트를 기준으로 오름차순 정렬

# SELECT MP.MEMBER_NAME, RR.REVIEW_TEXT, DATE_FORMAT(RR.REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
# FROM REST_REVIEW RR
# INNER JOIN MEMBER_PROFILE MP ON RR.MEMBER_ID LIKE MP.MEMBER_ID
# WHERE RR.MEMBER_ID 
#     IN (
#         SELECT MEMBER_ID
#         FROM REST_REVIEW
#         GROUP BY MEMBER_ID 
#         HAVING COUNT(*) 
#         = (SELECT MAX(COUNT(*)) FROM REST_REVIEW GROUP BY MEMBER_ID)
#     )
# ORDER BY REVIEW_DATE, REVIEW_TEXT

# SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
# FROM REST_REVIEW
# LEFT JOIN (
#     SELECT MEMBER_ID, RANK() OVER(ORDER BY COUNT(MEMBER_ID) DESC) AS REVIEW_RANK
#     FROM REST_REVIEW 
#     GROUP BY MEMBER_ID
# ) AS REST_REVIEW_RANK ON REST_REVIEW.MEMBER_ID LIKE REST_REVIEW_RANK.MEMBER_ID
# LEFT JOIN MEMBER_PROFILE ON REST_REVIEW.MEMBER_ID LIKE MEMBER_PROFILE.MEMBER_ID
# WHERE REVIEW_RANK = 1 
# ORDER BY REVIEW_DATE, REVIEW_TEXT

-- 출력할 컬럼 선언
SELECT MP.MEMBER_NAME, RR.REVIEW_TEXT, DATE_FORMAT(RR.REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE

-- 출력할 컬럼이 들어있는 테이블 선언
FROM REST_REVIEW RR
INNER JOIN MEMBER_PROFILE MP ON MP.MEMBER_ID LIKE RR.MEMBER_ID

-- 같은 테이블에서 특정 컬럼값을 랭킹으로 정렬해서 JOIN시킴 (즉, 랭킹 컬럼을 추가하기 위한 JOIN)
INNER JOIN (
    SELECT MEMBER_ID, RANK() OVER(ORDER BY COUNT(MEMBER_ID) DESC) AS REVIEW_RANK
    FROM REST_REVIEW RR
    GROUP BY MEMBER_ID
) AS RRR ON RRR.MEMBER_ID LIKE RR.MEMBER_ID

-- 랭킹 순에서 1위만 뽑아옴
WHERE RRR.REVIEW_RANK = 1

-- 정렬 조건 선언
ORDER BY RR.REVIEW_DATE, RR.REVIEW_TEXT