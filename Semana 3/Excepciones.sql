DECLARE
    v_nombre CLIENTE.NOMBRE%TYPE;
BEGIN
    SELECT nombre INTO v_nombre
    FROM CLIENTE;

    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nombre);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro el cliente');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('La consulta retorna demasiadas filas');
        DBMS_OUTPUT.PUT_LINE('Utilice un cursor');
END;
/ 


DECLARE
    v_resultado NUMBER;
BEGIN
    v_resultado := 100/0;

    DBMS_OUTPUT.PUT_LINE(v_resultado);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontro el cliente');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('La consulta retorna demasiadas filas');
        DBMS_OUTPUT.PUT_LINE('Utilice un cursor');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('NO SE PUEDE DIVIDIR ENTRE CERO IMBECIL');
END;
/ 
   