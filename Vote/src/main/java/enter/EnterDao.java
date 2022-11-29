package enter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JdbcTemplate;
import util.DBSql;

public class EnterDao {
	public ArrayList<EnterDto> selectAll() {
		ArrayList<EnterDto> res = null;
		String sql = DBSql.readEnterSql.text();
		
		try(Connection con = JdbcTemplate.getConnection();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();) {
			
			if(rs != null) {
				res = new ArrayList<EnterDto>();
				while(rs.next()) {
					EnterDto dto = new EnterDto();
					dto.setEnterName(rs.getString(2));
					dto.setVoteCount(rs.getInt(3));
					res.add(dto);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return res;
	}
	
}
