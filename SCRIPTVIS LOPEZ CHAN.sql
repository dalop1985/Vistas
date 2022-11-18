/**************************************************************************************************
* David José de Jesús López Chan	       													      *
* Sistema: Nómina																	    		  *
* Objetivo: Creación de Vistas de las tablas que necesitamos		.		                      *																			  
* ------------------------------------------------------------------------------------------------*
*																						          *
* Versión   Fecha        Usuario            Descripción									          *
* -------   ----------   ------------------ ------------------------------------------- ----------*
*  1.0      14/11/2022   David López	    Creación de Vistas para las tablas de empleados y     *
*  											personas.											  *
**************************************************************************************************/
use nomina;
CREATE OR REPLACE VIEW  personas AS
SELECT * FROM nompersona;

CREATE OR REPLACE VIEW empleados AS
SELECT nomempleados.nom_id_empleado, nompersona.nom_nombre, nompersona.nom_apellido, nompersona.nom_casado
FROM nomempleados
INNER JOIN nompersona ON nomempleados.nom_id_persona = nompersona.nom_id_persona;

CREATE OR REPLACE VIEW calculo AS
SELECT NOMEMPLEADOS.NOM_SUELDODIARIO * .15 AS PARTICIPACION 
FROM NOMEMPLEADOS;

CREATE OR REPLACE VIEW DEDUCCIONES AS
SELECT sum(NOM_IMPORTEDEDUCCION) FROM NOMPROCESOS where NOM_IDEMPLEADO = 2;

CREATE OR REPLACE VIEW DATOS AS
SELECT * FROM nomprocesos
  INNER JOIN nomempleados
  ON nomprocesos.nom_idempleado = nomempleados.nom_id_empleado;


