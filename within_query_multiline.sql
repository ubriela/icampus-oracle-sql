select * from Buildings b where 
    SDO_WITHIN_DISTANCE(
        b.location,
        SDO_GEOMETRY
        (
            2002,   --  SDO_GTYPE
            8307,  --  SDO_SRID
            null,   --  SDO_POINT type is null
            sdo_elem_info_array
            (
              1,    --  Offset = 1
              2,    --  Element type = 2 for LINE STRING
              1    --  Interpretation is 1 if line string is connected by straight lines
            ),
            sdo_ordinate_array
            (
              34.022058, -118.291427,
              34.019603, -118.285764,
              34.022253, -118.284048
            )
        ), 
        'DISTANCE=10 UNIT=METER'
    )='TRUE'