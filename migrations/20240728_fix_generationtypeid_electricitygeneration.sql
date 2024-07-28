
-- Date: 2024-07-28
-- Author: Artur Donaldson
-- This script corrects for an issue identified in the ETL where the id stored in the GenerationTypeId column of the ElectricityGeneration table was
-- the id of the electricitygeneration mapping, which is incorrect. It should instead be the value from the "ElectricityGenerationTypeId" column in the ElectricityGenerationTypesMapping table

-- Add a new column to store the id of the mapping used

BEGIN;
ALTER TABLE public."ElectricityGeneration" ADD GenerationTypeMappingId int4 NULL;
COMMIT;

-- Copy the data from the GenerationTypeId column to a new column generationtypemappingid
BEGIN;

UPDATE public."ElectricityGeneration"
set generationtypemappingid = "GenerationTypeId";

SELECT "generationtypemappingid", "GenerationTypeId"
FROM "ElectricityGeneration";

COMMIT;

-- Update the values in the electricitygeneration table
begin;

--alter table public."ElectricityGeneration" drop constraint "UX_ElectricityGeneration";

WITH UpdateTable AS (
    SELECT eg."Id",
           eg."GenerationTypeId" AS "CurrentValue",
           egtm."ElectricityGenerationTypeId" AS "CorrectValue"
    FROM "ElectricityGenerationTypesMapping" egtm
    JOIN "ElectricityGeneration" eg ON egtm."Id" = eg."generationtypemappingid"
)
update public."ElectricityGeneration" eg set "GenerationTypeId" = up."CorrectValue"
from UpdateTable up where up."Id" = eg."Id";

--CREATE UNIQUE INDEX "UX_ElectricityGeneration" ON public."ElectricityGeneration" USING btree ("RegionId", "GenerationTypeId", "DateStamp");
--ALTER TABLE public."ElectricityGeneration" ADD CONSTRAINT "UX_ElectricityGeneration" UNIQUE ("RegionId", "GenerationTypeId", "DateStamp");

SELECT eg."Id",
       eg."GenerationTypeId" AS "CurrentValue",
       egtm."ElectricityGenerationTypeId" AS "CorrectValue"
FROM public."ElectricityGenerationTypesMapping" egtm
JOIN public."ElectricityGeneration" eg ON egtm."Id" = eg."generationtypemappingid"
limit 100;

--REINDEX INDEX "UX_ElectricityGeneration";

commit;