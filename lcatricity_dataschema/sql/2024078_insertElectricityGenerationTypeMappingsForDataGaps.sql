-- 2024-07-28
-- Add a mapping to generation type "Other" for ENTSO-E generation types for which there is no characterization data yet available

INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (11,'ENTSO-E',0,'Biomass','Filling missing generation types');
INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (12,'ENTSO-E',0,'Fossil Oil','Filling missing generation types');
INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (13,'ENTSO-E',0,'Geothermal','Filling missing generation types');
INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (14,'ENTSO-E',0,'Other','Filling missing generation types');
INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (15,'ENTSO-E',0,'Other renewable','Filling missing generation types');
INSERT INTO public."ElectricityGenerationTypesMapping" ("Id","DataSourceName","ElectricityGenerationTypeId","ExternalName","Comment")
	VALUES (16,'ENTSO-E',0,'Waste','Filling missing generation types');
