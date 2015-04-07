package db;

import db.datos.PrediccionSemana;
import db.dao.PrediccionDAO;

import java.sql.SQLException;

/**
 * Created by david on 06/04/2015.
 */
public class Retriever {
    
    public static PrediccionSemana ultimaPrediccion() throws SQLException {

        PrediccionDAO pdao = new PrediccionDAO();
        pdao.setConnection(ConnectionAdmin.getConnection());
        return pdao.getPrediccion();
    }
}
