package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QFileDTO;

public class QFileDAO {
	// singletone
		private QFileDAO() {
		}

		public static QFileDAO instance;

		public synchronized static QFileDAO getInstance() {
			if (instance == null) {
				instance = new QFileDAO();
			}
			return instance;
		}

		// JNDI
		private Connection getConnection() throws Exception {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			return ds.getConnection();
		}

		// 1. 글 추가하기 insert
		public int insert(QFileDTO dto) throws Exception {
			String sql = "insert into q_file values(q_file_sequence.nextval, ?, ?, ?)";
			try (Connection con = this.getConnection();
					PreparedStatement ps = con.prepareStatement(sql);) {
				ps.setString(1, dto.getqFileOriname());
				ps.setString(2, dto.getqFileSysname());
				ps.setInt(3, dto.getqFileParentSeq());
				return ps.executeUpdate();
			}
		}
		
		//3. 보드에 포함된 file 가져오기
		public QFileDTO selectByParentSeq(int boardseq) throws Exception{
			String sql="select * from q_file where q_file_parent_seq=?";

			try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);){
				ps.setInt(1,boardseq);
				try(ResultSet rs=ps.executeQuery();){
					while(rs.next()){
						int seq=rs.getInt(1);
						String oriname=rs.getString(2);
						String sysname=rs.getString(3);
						int parent_seq=rs.getInt(4);

						return new QFileDTO(seq, oriname, sysname, parent_seq);

					}
					return null;
				}
			}
		}



}
