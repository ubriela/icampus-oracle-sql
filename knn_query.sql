select b.id, b.name, b.shortname, b.address, b.location, SDO_NN_DISTANCE(1) dist 
from Buildings b where 
    SDO_NN(
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
        'SDO_BATCH_SIZE=100',
        1
    )='TRUE'
AND ROWNUM<=5