select * from Buildings b where 
    SDO_WITHIN_DISTANCE(
        b.location,
        SDO_GEOMETRY
        (
            2001,
            8307,
            SDO_POINT_TYPE  
            (
                34.0202098185817,
                -118.285686557556,
                null
            ),
            null,
            null
        ), 
        'DISTANCE=100 UNIT=METER'
    )='TRUE'