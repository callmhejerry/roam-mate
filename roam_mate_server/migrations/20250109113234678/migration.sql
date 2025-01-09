BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" ALTER COLUMN "password" DROP NOT NULL;

--
-- MIGRATION VERSION FOR roam_mate
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roam_mate', '20250109113234678', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250109113234678', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
