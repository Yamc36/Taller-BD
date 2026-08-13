select C.nombre, T.monto_bruto, T.descuento, T.monto_final, T.estado, 
    RT.estado AS ESTADO_DE_RESERVA from cliente C
    JOIN RESERVA_TEMPORAL RT on rt.cliente_id = c.cliente_id
    JOIN TRANSACCION_PAGO T on t.reserva_id = t.transaccion_id
    where T.TRANSACCION_ID = 3;

----------------------------------------------------------------

DECLARE

    TYPE BOLETA_CLIENTE IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        estado_reserva RESERVA_TEMPORAL.estado%TYPE,
        monto_bruto transaccion_pago.monto_bruto%type,
        descuento_transaccion transaccion_pago.DESCUENTO%TYPE,
        monto_final transaccion_pago.MONTO_FINAL%TYPE,
        estado_transaccion transaccion_pago.ESTADO%TYPE
    );

    v_boleta boleta_cliente


BEGIN
    select C.nombre, T.monto_bruto, T.descuento, T.monto_final, T.estado, 
    RT.estado AS ESTADO_DE_RESERVA INTO v_boleta.nombre_cliente, v_boleta from cliente C
    JOIN RESERVA_TEMPORAL RT on rt.cliente_id = c.cliente_id
    JOIN TRANSACCION_PAGO T on t.reserva_id = t.transaccion_id
    where T.TRANSACCION_ID = 3;
    NULL;

END;