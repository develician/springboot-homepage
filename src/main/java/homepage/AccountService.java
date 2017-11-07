package homepage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    MemberDAO memberDAO;

    public int join(Member member) {
        return memberDAO.join(member);
    }

    public Member login(Member member){
        return memberDAO.login(member);
    }
}
