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
public class HomePageDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public int add(Article article) {
        String SQL = "INSERT INTO article (title, content, saveName, originalName)"
                + "values(?, ?, ?, ?)";
        int update = jdbcTemplate.update(SQL, new Object[]{
                article.getTitle(), article.getContent(),
                article.getSaveName(), article.getOriginalName()});
        return update;
    }

    public List<Article> getList() {
        String SQL = "SELECT * FROM article";
        return jdbcTemplate.query(SQL, new ArticleMapper());
    }

    public List<Article> getById(int articleNum){
        String SQL = "SELECT * FROM article where id = '" + articleNum + "'";
        return jdbcTemplate.query(SQL, new ArticleMapper());

    }

    public boolean nextPage(int articleID){
        String SQL = "SELECT * FROM article where id < ? order by id desc";
        if(jdbcTemplate.query(SQL, new Object[]{articleID}, new ArticleMapper()).size() > 0){
            return true;
        }
        return false;
    }

    public static final class ArticleMapper implements RowMapper<Article> {


        @Override
        public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
            Article article = new Article();
            article.setId(rs.getInt("id"));
            article.setCreatedAt(rs.getString("createdAt"));
            article.setTitle(rs.getString("title"));
            article.setContent(rs.getString("content"));
            article.setSaveName(rs.getString("saveName"));
            article.setOriginalName(rs.getString("originalName"));
            return article;

        }
    }




}
