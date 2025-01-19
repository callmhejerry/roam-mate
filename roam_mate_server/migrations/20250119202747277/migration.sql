BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "amenities" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "property" (
    "id" bigserial PRIMARY KEY,
    "location" text NOT NULL,
    "price" double precision NOT NULL,
    "roomType" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "image" text NOT NULL,
    "otherImages" text NOT NULL,
    "video" text,
    "numberOfRooms" bigint,
    "verified" boolean NOT NULL,
    "propertyOwnerName" text NOT NULL,
    "propertyOwnerEmail" text,
    "propertyOwnerPhoneNumber" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "property_location_idx" ON "property" USING btree ("location");
CREATE INDEX "property_price_idx" ON "property" USING btree ("price");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "property_amenities" (
    "id" bigserial PRIMARY KEY,
    "propertyId" bigint NOT NULL,
    "amenityId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "property_review" (
    "id" bigserial PRIMARY KEY,
    "propertyId" bigint NOT NULL,
    "studentIdId" bigint NOT NULL,
    "rating" double precision NOT NULL,
    "comment" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "property_amenities"
    ADD CONSTRAINT "property_amenities_fk_0"
    FOREIGN KEY("propertyId")
    REFERENCES "property"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "property_amenities"
    ADD CONSTRAINT "property_amenities_fk_1"
    FOREIGN KEY("amenityId")
    REFERENCES "amenities"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "property_review"
    ADD CONSTRAINT "property_review_fk_0"
    FOREIGN KEY("propertyId")
    REFERENCES "property"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "property_review"
    ADD CONSTRAINT "property_review_fk_1"
    FOREIGN KEY("studentIdId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR roam_mate
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roam_mate', '20250119202747277', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250119202747277', "timestamp" = now();

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
