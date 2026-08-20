select C.nombre, T.monto_bruto, T.descuento, T.monto_final, T.estado, 
    RT.estado AS ESTADO_DE_RESERVA from cliente C
    JOIN RESERVA_TEMPORAL RT on rt.cliente_id = c.cliente_id
    JOIN TRANSACCION_PAGO T on t.reserva_id = RT.RESERVA_ID
    where T.TRANSACCION_ID = 1;

----------------------------------------------------------------

DECLARE

    TYPE BOLETA_CLIENTE IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        estado_reserva RESERVA_TEMPORAL.estado%TYPE,
        monto_bruto transaccion_pago.monto_bruto%type,
        descuento_transaccion transaccion_pago.DESCUENTO%TYPE,
        monto_final transaccion_pago.MONTO_FINAL%TYPE,
        estado_transaccion  TRANSACCION_PAGO.ESTADO%TYPE
    );

    v_boleta boleta_cliente;



BEGIN
    SELECT C.nombre, 
           RT.estado, 
           T.monto_bruto, 
           T.descuento, 
           T.monto_final, 
           T.estado
    INTO v_boleta.nombre_cliente, v_boleta.estado_reserva,v_boleta.monto_bruto, v_boleta.descuento_transaccion, 
    v_boleta.monto_final, v_boleta.estado_transaccion
    FROM cliente C
    JOIN RESERVA_TEMPORAL RT on rt.cliente_id = c.cliente_id
    JOIN TRANSACCION_PAGO T on t.reserva_id = RT.RESERVA_ID
    WHERE T.TRANSACCION_ID = 1;

    DBMS_OUTPUT.PUT_LINE('*** BOLETA PUNTO TICKET***');
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '|| v_boleta.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('ESTADO DE LA RESERVA: '|| v_boleta.estado_reserva);
    DBMS_OUTPUT.PUT_LINE('MONTO BRUTO: '|| v_boleta.monto_bruto);
    DBMS_OUTPUT.PUT_LINE('NDESCUENTO: '|| v_boleta.descuento_transaccion);
    DBMS_OUTPUT.PUT_LINE('MONTO FINAL: '|| v_boleta.monto_final);
    DBMS_OUTPUT.PUT_LINE('ESTADO DE LA TRANSACCION: '|| v_boleta.estado_transaccion);
END;
/