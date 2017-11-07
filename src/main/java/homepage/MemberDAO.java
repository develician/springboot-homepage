package homepage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MemberDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int join(Member member) {
        String SQL = "INSERT INTO member values(?, ?, ?, ?, ?)";


        int join = jdbcTemplate.update(SQL, new Object[]{
                member.getUserID(), member.getUserPassword(), member.getUserBirth(), member.getUserEmail(), member.getUserGender()
        });
        return join;
    }

    public Member login(Member member) {
        String SQL = "SELECT * FROM member where userID = '" + member.getUserID() + "'" + " and userPassword = '" + member.getUserPassword() + "'";
        List<Member> memberList = jdbcTemplate.query(SQL, new MemberMapper());
        return memberList.size() > 0 ? memberList.get(0) : null;

    }


    private class MemberMapper implements RowMapper<Member> {


        @Override
        public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
            Member member = new Member();
            member.setUserID(rs.getString("userID"));
            member.setUserPassword(rs.getString("userPassword"));
            member.setUserBirth(rs.getString("userBirth"));
            member.setUserEmail(rs.getString("userEmail"));
            member.setUserGender(rs.getString("userGender"));
            return member;

        }
    }
}
