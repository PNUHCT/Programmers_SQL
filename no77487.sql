-- 헤비 유저가 소유한 장소

-- 공간을 둘 이상 등록한 사람을 "헤비 유저" == HOST_ID가 두 번이상 중복되는 경우
-- ID, NAME, HOST_ID를 (즉 (*))
-- 아이디 순으로 오름차순 정렬

-- 모든 컬럼을 출력할 것이므로 SELECT는 *
-- 

SELECT *
FROM PLACES
WHERE HOST_ID IN (
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(*)>1
    )
ORDER BY ID