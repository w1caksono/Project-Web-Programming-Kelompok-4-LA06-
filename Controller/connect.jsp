<%@ page import="java.sql.*" %>
<%!
public static final class Connect {

    private final String USERNAME = "";
    private final String PASSWORD = "";
    private final String DATABASE = "";
    private final String HOST = "";
    private final String CONECTION = String.format("jdbc:mysql://%s/%s", HOST, DATABASE);

    private Connection con;
    private Statement st;
    private static Connect connect = null;

    private Connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(CONECTION, USERNAME, PASSWORD);
            st = con.createStatement();
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("Failed to connect the database, the system is terminated!");
        }
    }

    public static synchronized Connect getConnection() {
        return connect = (connect == null) ? new Connect() : connect;
    }

    public ResultSet executeQuery(String query) {
        ResultSet rs = null;
        try {
            rs = st.executeQuery(query);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public PreparedStatement prepareStatement(String query) {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ps;
    }
}

%>


