SELECT * FROM CLIENTE;
SELECT * FROM TRANSACCION_PAGO;
SELECT * FROM RESERVA_TEMPORAL;

SELECT c.nombre, rt.ESTADO AS ESTADO_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_TRANSACCION FROM CLIENTE c 
JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
WHERE tp.TRANSACCION_ID = 1; 

DECLARE 

    TYPE boleta IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        estado_reserva RESERVA_TEMPORAL.ESTADO%TYPE,
        monto_bruto TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
        descuento_cliente TRANSACCION_PAGO.DESCUENTO%TYPE,
        monto_final TRANSACCION_PAGO.MONTO_FINAL%TYPE,
        estado_pago TRANSACCION_PAGO.ESTADO%TYPE
    );
    v_boleta boleta;

BEGIN
    SELECT c.nombre, rt.ESTADO AS ESTADO_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_TRANSACCION INTO v_boleta.nombre_cliente, v_boleta.estado_reserva, v_boleta.monto_bruto, v_boleta.descuento_cliente, v_boleta.monto_final, v_boleta.estado_pago FROM CLIENTE c 
    JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
    JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
    WHERE tp.TRANSACCION_ID = 3; 

    DBMS_OUTPUT.PUT_LINE('**** BOLETA PUNTO TICKET******');
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_boleta.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('Estado de reserva: ' || v_boleta.estado_reserva);
    DBMS_OUTPUT.PUT_LINE('Monto Bruto: ' || v_boleta.monto_bruto);
    DBMS_OUTPUT.PUT_LINE('Descuento cliente: ' || v_boleta.descuento_cliente);
    DBMS_OUTPUT.PUT_LINE('Monto final: ' || v_boleta.MONTO_FINAL);
    DBMS_OUTPUT.PUT_LINE('Estado pado: ' || v_boleta.estado_pago);

    NULL; 
END;
/