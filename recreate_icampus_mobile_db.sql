CREATE TABLE POSTS
(
  PID INTEGER NOT NULL,
  "UID" INTEGER,
  TIME DATE,
  TITLE VARCHAR2(100),
  RATING INTEGER,
  PLACE VARCHAR2(200),
  LOCATION "SDO_GEOMETRY",
  PHOTO VARCHAR2(300),
  SMALLPHOTO VARCHAR2(300),
  ICONPHOTO VARCHAR2(300),
  "COMMENT" VARCHAR2(300)
, CONSTRAINT POSTS_PK PRIMARY KEY
  (
    PID
  )
)


INSERT INTO USER_SDO_GEOM_METADATA
VALUES
(
  'POSTS',          -- TABLE_NAME
  'LOCATION',           -- COLUMN_NAME
  SDO_DIM_ARRAY         -- DIMINFO attribute for storing dimension bounds, tolerance
  (
    SDO_DIM_ELEMENT
    (
      'LONGITUDE',      -- DIMENSION NAME for first dimension
       -180,            -- SDO_LB for the dimension
       180,             -- SDO_UB for the dimension
       .5              -- Tolerance of 0.5 meters
    ),
    SDO_DIM_ELEMENT
    (
      'LATITUDE',       -- DIMENSION NAME for second dimension
       -90,             -- SDO_LB for the dimension
       90,              -- SDO_UB for the dimension
       .5              -- Tolerance of 0.5 meters
    )
    --,SDO_DIM_ELEMENT('Z', -100, 200, .5)
  ),
  8307                  -- SRID value for specifying a geodetic coordinate system
);
COMMIT;

create INDEX POSTS_LOCATION_IDX ON POSTS(LOCATION) INDEXTYPE IS MDSYS.SPATIAL_INDEX;



-------- USERS
drop trigger "ICAMPUS"."USERS_AUTO_INCREMENT";
drop sequence USERS_SEQUENCE

CREATE SEQUENCE USERS_SEQUENCE
START WITH 1000
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER "ICAMPUS"."USERS_AUTO_INCREMENT" 
BEFORE INSERT
ON "ICAMPUS"."USERS"
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT USERS_SEQUENCE.nextval INTO :NEW.UID FROM dual;
END;
/
ALTER TRIGGER "ICAMPUS"."USERS_AUTO_INCREMENT" ENABLE;


INSERT INTO USERS (fname, lname, facebook_id, email) VALUES ('hien', 'to','12345', 'hto@usc.edu');
INSERT INTO USERS (fname, lname, facebook_id, email) VALUES ('ali', 'khoda','77779', 'khodaei@usc.edu');



------- USER PREFERENCE

  CREATE TABLE "ICAMPUS"."USER_PREFERENCES" 
   (	"USER_ID" NUMBER(*,0), 
	"APPLICATION" VARCHAR2(100 BYTE), 
	"FAVORITE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
 