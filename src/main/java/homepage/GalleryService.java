package homepage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryService {
    @Autowired
    HomePageDAO homePageDAO;

    public int add(Article article) {
        return homePageDAO.add(article);
    }

    public List<Article> getList(){
        return homePageDAO.getList();
    }

    public List<Article> getById(int articleNum) {
        return homePageDAO.getById(articleNum);
    }
}
