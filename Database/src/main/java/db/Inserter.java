package db;

import db.dao.IntervaloDAO;
import db.dao.PrediccionDAO;
import db.datos.Periodo;
import db.datos.PrediccionSemana;

import java.sql.SQLException;

/**
 * Created by david on 06/04/2015.
 */
public class Inserter {
    
    public static boolean guardar(String filename, PrediccionSemana prediccionSemana) throws SQLException {

        // Insertar valores de Intervalos
        IntervaloDAO idao = new IntervaloDAO();
        idao.setConnection(ConnectionAdmin.getConnection());
        for(Periodo.Interval intervalo : Periodo.Interval.values()){
            idao.guardarIntervalo(intervalo);
        }
        
        // Insertar predicción
        PrediccionDAO pdao = new PrediccionDAO();
        pdao.setConnection(ConnectionAdmin.getConnection());
        return pdao.guardarPrediccion(filename, prediccionSemana);
    }
}
