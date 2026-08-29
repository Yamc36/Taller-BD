-- POR MEDIO DEL METODO CONSTRUCTOR DEL OBJETO
DECLARE 

    TYPE frutas IS VARRAY(5) OF VARCHAR2(80);

    v_frutera frutas := frutas('Manzana', 'GUAYABA', 'NARANJA', 'PERA');
BEGIN

    DBMS_OUTPUT.PUT_LINE(v_frutera(3));
    NULL;
END;
/



DECLARE 

    TYPE frutas IS VARRAY(5) OF VARCHAR2(80);

    v_frutera frutas := frutas();
BEGIN
    v_frutera.extend;
    v_frutera(1) := 'MANZANA';
    v_frutera.extend;
    v_frutera(2) := 'Frambuesa';
    DBMS_OUTPUT.PUT_LINE(v_frutera(1));
    DBMS_OUTPUT.PUT_LINE(v_frutera(2));
    NULL;
END;
/