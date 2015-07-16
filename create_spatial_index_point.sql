INSERT INTO USER_SDO_GEOM_METADATA
VALUES
(
  'posts',          -- TABLE_NAME
  'location',           -- COLUMN_NAME
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