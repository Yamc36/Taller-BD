DECLARE
    CURSOR c_clienteS IS
        SELECT * FROM CLIENTE;

BEGIN
    FOR por_cada_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('*******INFORME DE CLIENTE********');
        DBMS_OUTPUT.PUT_LINE('NOMBRE ' || por_cada_cliente.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('RUT ' || por_cada_cliente.RUT);
        DBMS_OUTPUT.PUT_LINE('TELEFONO ' || por_cada_cliente.TELEFONO);
    END LOOP;
    NULL;
END;
/
--Cursor con JOIN

SELECT c.NOMBRE, rt.ESTADO AS ESTADO_DE_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_PAGO FROM CLIENTE c 
JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
WHERE tp.ESTADO = 'APROBADO';

DECLARE
    CURSOR c_transacciones_aprobadas is 
        SELECT c.NOMBRE, rt.ESTADO AS ESTADO_DE_RESERVA, tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_PAGO FROM CLIENTE c 
    JOIN RESERVA_TEMPORAL rt ON rt.CLIENTE_ID = c.CLIENTE_ID 
    JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.RESERVA_ID
    WHERE tp.ESTADO = 'APROBADO';
BEGIN
    FOR i IN c_transacciones_aprobadas LOOP
        DBMS_OUTPUT.PUT_LINE('***TRANSACCIONES APROBADAS***');
        DBMS_OUTPUT.PUT_LINE('NOMBRE: '|| i.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('Monto Final: '|| i.MONTO_FINAL);
        DBMS_OUTPUT.PUT_LINE('Estado: '|| i.ESTADO_DE_PAGO);
        
    END LOOP;
END;
/

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) 
VALUES('11.111.111-1', 'JUAN', 'Vargas', 'jvargos@gmail.com', '+56911111112', systimestamp);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) 
VALUES('11.111.111-2', 'Matis', 'Vargas', 'jvirgas@gmail.com', '+56911111113', systimestamp);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) 
VALUES('11.111.111-3', 'Vale', 'Vargas', 'jvarges@gmail.com', '+56911111141', systimestamp);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) 
VALUES('11.111.111-4', 'yona', 'Vargas', 'avirgas@gmail.com', '+56911111191', systimestamp);

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) 
VALUES('11.111.111-5', 'maxi', 'Vargas', 'jvlrgas@gmail.com', '+56911111151', systimestamp);

COMMIT;


DELETE FROM CLIENTE 
WHERE RUT IN (
    '11.111.111-1', 
    '11.111.111-2', 
    '11.111.111-3', 
    '11.111.111-4', 
    '11.111.111-5'
);
COMMIT;




DECLARE
    CURSOR c_clientes_por_apellido(p_apellido VARCHAR2, p_nombre_contenga_letra VARCHAR2) IS
    SELECT cliente_id, nombre, apellido, EMAIL
    FROM CLIENTE
    WHERE apellido = p_apellido AND nombre LIKE p_nombre_contenga_letra;

    TYPE v_nombres IS VARRAY(5) OF VARCHAR2(20);

    v_arreglo_nombres v_nombres := v_nombres ('Vargas', 'Soto', 'Morales', 'Pérez' );

BEGIN
    FOR un_cliente in c_clientes_por_apellido(v_arreglo_nombres(1), '%i%') LOOP
        DBMS_OUTPUT.PUT_LINE(un_cliente.nombre);
    END LOOP;

END;
/