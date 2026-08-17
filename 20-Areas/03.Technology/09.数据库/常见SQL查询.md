---
created: 2026-08-14T16:21:00
updated: 2026-08-14T16:41:29
---

```sql
--**查出所有 `TRANS_RESULTRELATION = 'S'` 的记录，这些记录的JSON中，`rows` 数组里至少有一个 `CLAUSE` 同时包含 `AND` 和 `OR`，并且没有任何一个 `CLAUSE` 包含 `(`。**
SELECT tb.*
FROM T__BOMSENDLOG tb
WHERE tb.TRANS_RESULTRELATION = 'S'
AND JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*].CLAUSE')
AND JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*]?(@.CLAUSE like "%AND%" && @.CLAUSE like "%OR%")')
AND NOT JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*]?(@.CLAUSE like "%(%")');
```
```sql
--查询TRANS_DATARELATION的值JSON的参数CLAUSE的值同时包含AND和OR 但不包括(，且为最新的数据
WITH set_A AS (
    SELECT tb.*
    FROM T__BOMSENDLOG tb
    WHERE tb.TRANS_RESULTRELATION = 'S'
    AND JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*].CLAUSE')
    AND JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*]?(@.CLAUSE like "%AND%" && @.CLAUSE like "%OR%")')
    AND NOT JSON_EXISTS(tb.TRANS_DATARELATION, '$.rows[*]?(@.CLAUSE like "%(%")')
),
item_global_max AS (
    -- 全表B，每个ITEM_ID全局最大BATCH_NO
    SELECT ITEM_ID, MAX(BATCH_NO) AS GLOBAL_MAX_BATCH
    FROM T__BOMSENDLOG
    GROUP BY ITEM_ID
)
SELECT sa.*
FROM set_A sa
INNER JOIN item_global_max igm 
    ON sa.ITEM_ID = igm.ITEM_ID
WHERE sa.BATCH_NO = igm.GLOBAL_MAX_BATCH;
```
