BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room" (
    "id" bigserial PRIMARY KEY,
    "address" text NOT NULL,
    "lat" double precision NOT NULL,
    "long" double precision NOT NULL,
    "roomType" text NOT NULL,
    "preferredGender" text NOT NULL,
    "numberOfRoomMate" bigint NOT NULL,
    "roomRules" json NOT NULL,
    "rent" double precision NOT NULL,
    "photos" json NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room_amenities" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "amenityId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "room_amenities"
    ADD CONSTRAINT "room_amenities_fk_0"
    FOREIGN KEY("roomId")
    REFERENCES "room"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "room_amenities"
    ADD CONSTRAINT "room_amenities_fk_1"
    FOREIGN KEY("amenityId")
    REFERENCES "amenities"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR roam_mate
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roam_mate', '20250202214739168', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250202214739168', "timestamp" = now();

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
