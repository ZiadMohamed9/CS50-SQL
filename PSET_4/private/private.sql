CREATE TABLE "triplets" (
    "no.1" INTEGER,
    "no.2" INTEGER,
    "no.3" INTEGER
);

INSERT INTO "triplets" ("no.1", "no.2", "no.3")
VALUES (14, 98, 4),
       (114, 3, 5),
       (618, 72, 9),
       (630, 7, 3),
       (932, 12, 5),
       (2230, 50, 7),
       (2346, 44, 10),
       (3041, 14, 5);

CREATE VIEW "message" AS
SELECT substr("sentence", "no.2", "no.3") AS 'phrase'
FROM "sentences"
JOIN "triplets"
ON "sentences"."id" = "triplets"."no.1";

SELECT "phrase" FROM "message";
