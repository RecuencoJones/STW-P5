package generator;

import com.google.gson.Gson;
import db.Retriever;
import db.datos.PrediccionSemana;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;

/**
 * Created by david on 06/04/2015.
 */
public class Generator {

    public static void main(String[] args) {

        if(args.length!=1){
            System.err.println("No file given");
            System.exit(-1);
        }
        System.out.println(args[0]);

        try {
            PrediccionSemana p = Retriever.ultimaPrediccion();
            if(p!=null){
                System.out.println("Data successfully retrieved from database.");
                writeToFile(p, args[0]);
            }else{
                System.out.println("Data retrieval went wrong.");
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    private static void writeToFile(PrediccionSemana p, String filename){
        Gson gson = new Gson();
        String s = gson.toJson(p);

        File json = new File(filename);
        FileOutputStream outputStream;

        try {
            outputStream = new FileOutputStream(json);
            outputStream.write(s.getBytes());
            outputStream.close();
            System.out.println("JSON file written: "+filename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}