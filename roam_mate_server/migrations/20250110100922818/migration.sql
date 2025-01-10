BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "otp_verifcation" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "otp_verifcation" (
    "id" bigserial PRIMARY KEY,
    "otp" text NOT NULL,
    "expiredAt" timestamp without time zone NOT NULL,
    "email" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "unique_verification_email_idx" ON "otp_verifcation" USING btree ("email");


--
-- MIGRATION VERSION FOR roam_mate
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roam_mate', '20250110100922818', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250110100922818', "timestamp" = now();

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
