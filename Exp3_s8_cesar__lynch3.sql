CREATE TABLE escueladeporte (
    id_escuelas NUMBER PRIMARY KEY,
    nombreescuela VARCHAR2(100) NOT NULL,
    tipo_escuela VARCHAR2(100) NOT NULL,
    contactos VARCHAR2(100),
    direcciones VARCHAR2(100)
);


CREATE TABLE personas (
    id_personas NUMBER PRIMARY KEY,
    nombrepersonal VARCHAR2(100) NOT NULL,
    profesiones VARCHAR2(100),
    pais VARCHAR2(100),
    id_escuelas NUMBER,
    CONSTRAINT fk_escuela_personal FOREIGN KEY (id_escuelas) REFERENCES escueladeporte(id_escuelas)
);
CREATE TABLE costos (
    idcostos NUMBER PRIMARY KEY,
    tiposdecosto VARCHAR2(100) NOT NULL,
    montos NUMBER(20, 2),
    id_escuelas NUMBER,
    CONSTRAINT fk_costo_escuela FOREIGN KEY (id_escuelas) REFERENCES escueladeporte(id_escuelas)
);
CREATE TABLE instalaciones (
    idinstalaciones NUMBER PRIMARY KEY,
    tipoinstalacion VARCHAR2(100) NOT NULL,
    capacidades NUMBER,
    id_escuelas NUMBER,
    CONSTRAINT fk_instalacion_escuela FOREIGN KEY (id_escuelas) REFERENCES escueladeporte(id_escuelas)
);

CREATE SEQUENCE seq_escuelas
START WITH 1
INCREMENT BY 1;

--
CREATE SEQUENCE seq_personas
START WITH 1
INCREMENT BY 1;


INSERT INTO escueladeporte (id_escuelas, nombreescuela, tipo_escuela, contactos, direcciones)
VALUES (seq_escuelas.NEXTVAL, 'Escuela de tenis', 'tenis', 'contacto@tenis.cl', 'Av. las condes 1234');


INSERT INTO personas (id_personas, nombrepersonal, profesiones, pais, id_escuelas)
VALUES (seq_personas.NEXTVAL, 'pedro pascal', 'Entrenador', 'Chileno', 3);

INSERT INTO costos (idcostos, tiposdecosto, montos, id_escuelas)
VALUES (1, 'Sueldo ', 120000000, 3);

-- 
INSERT INTO instalaciones (idinstalaciones, tipoinstalacion, capacidades, id_escuelas)
VALUES (1, 'Cancha de tenis', 100, 3);




INSERT INTO escueladeporte (id_escuelas, nombreescuela, tipo_escuela, contactos, direcciones)
VALUES (seq_escuelas.NEXTVAL, 'Escuela de Fútbol u_de chile', 'Fútbol', 'contacto@escuelauchile.cl', 'Av.los alamos 3323');

INSERT INTO personas (id_personas, nombrepersonal, profesiones, pais, id_escuelas)
VALUES (seq_personas.NEXTVAL, 'cesar lynch', 'Entrega de agua', 'Chileno', 1);

--
INSERT INTO escueladeporte (id_escuelas, nombreescuela, tipo_escuela, contactos, direcciones)
VALUES (seq_escuelas.NEXTVAL, 'Escuela de Natacion', 'natacion', 'contacto@delfin.cl', 'Av.los condores 10234');


INSERT INTO personas (id_personas, nombrepersonal, profesiones, pais, id_escuelas)
VALUES (seq_personas.NEXTVAL, 'julieta', 'Entrenadora numero one', 'Chilena', 2);

SELECT * FROM escueladeporte;
SELECT nombreescuela FROM escueladeporte;

SELECT nombreescuela FROM escueladeporte
WHERE tipo_escuela = 'natacion';

SELECT p.nombrepersonal, p.profesiones, p.pais 
FROM personas p
JOIN escueladeporte e ON p.id_escuelas = e.id_escuelas
WHERE e.nombreescuela = 'Escuela de Fútbol u_de chile';

SELECT c.tiposdecosto, c.montos
FROM costos c
JOIN escueladeporte e ON c.id_escuelas = e.id_escuelas
WHERE e.nombreescuela = 'Escuela de Natacion';



SELECT nombreescuela FROM escueladeporte WHERE tipo_escuela = 'natacion';


DELETE FROM escueladeporte WHERE nombreescuela = 'Escuela de Natacion';

UPDATE escueladeporte
SET direcciones = 'Av. Nueva lyon 4497'
WHERE id_escuelas = 3;

SELECT nombreescuela FROM escueladeporte
WHERE tipo_escuela = 'Fútbol' AND contactos IS NOT NULL;
SELECT e.nombreescuela, SUM(c.montos) AS total_costos
FROM escueladeporte e
JOIN costos c ON e.id_escuelas = c.id_escuelas
WHERE e.id_escuelas = 3
GROUP BY e.nombreescuela;





-- Eliminar todos de persoans
DELETE FROM personas;
