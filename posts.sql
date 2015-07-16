INSERT INTO POSTS ("UID", time, title, rating, place, location, photo, smallphoto, iconphoto)
VALUES(
  1006, 
  CURRENT_TIMESTAMP(3),
  'Food',
  5,
  NULL,
  SDO_GEOMETRY(2001, 8307, SDO_POINT_TYPE (34.020209, -118.285686, null),null,null),
  '/Applications/NetBeans/apache-tomcat-7.0.14/webapps/ROOT/icampus/images/1099653312/abc_361528364.jpg',
    '/Applications/NetBeans/apache-tomcat-7.0.14/webapps/ROOT/icampus/images/1099653312/abc_361528364.jpg',
      '/Applications/NetBeans/apache-tomcat-7.0.14/webapps/ROOT/icampus/images/1099653312/abc_361528364.jpg'
);



CREATE SEQUENCE POSTS_SEQUENCE
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER "ICAMPUS"."POSTS_AUTO_INCREMENT" 
BEFORE INSERT
ON "ICAMPUS"."POSTS"
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT POSTS_SEQUENCE.nextval INTO :NEW.PID FROM dual;
END;
/
ALTER TRIGGER "ICAMPUS"."POSTS_AUTO_INCREMENT" ENABLE;
 
drop trigger "ICAMPUS"."POSTS_AUTO_INCREMENT";
drop sequence POSTS_SEQUENCE


create trigger "ICAMPUS"."POSTS_AUTO_INCREMENT"
before insert on "ICAMPUS"."POSTS"  
for each row
begin
select SEQ_1000.nextval into :NEW."POSTS" from dual;
end;


