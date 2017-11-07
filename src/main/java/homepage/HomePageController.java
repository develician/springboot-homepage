package homepage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;

@Controller
public class HomePageController {

    @Autowired
    GalleryService gallery;
    @Autowired
    AccountService account;


    private final String basePath = "/tmp/upload/";

    @RequestMapping("/index")
    public String index(Model model) {
        //model.addAttribute("list", gallery.getList());
//        String pageNum = request.getQueryString();
//        model.addAttribute("pageNum", pageNum);

        return "index";

    }

    @RequestMapping("/gallery")
    public String gallery(HttpServletRequest request, Model model) {

        String articleNum = request.getParameter("articleNum");
        if(articleNum == null){
            return "redirect:/upload.action";
        }
        else if(Integer.parseInt(articleNum) > gallery.getList().size()){
            return "redirect:/index.action";
        }
        else{
            model.addAttribute("articleNum", articleNum);
            model.addAttribute("articleList", gallery.getById(Integer.parseInt(articleNum)));
            return "gallery";
        }


    }

    @RequestMapping("/upload")
    public String upload() {
        return "upload";

    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String uploadAction(Article article, @RequestParam("file") MultipartFile file) {
        saveFile(article, file);
        gallery.add(article);
        return "redirect:/index.action";

    }

    private void saveFile(Article article, @RequestParam("file") MultipartFile file) {
        String saveName = String.valueOf(new Date().getTime());

        OutputStream fos = null;

        try {
            fos = new FileOutputStream(basePath + File.separator + saveName);

            fos.write(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        article.setOriginalName(file.getOriginalFilename());
        article.setSaveName(saveName);
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginAction(@ModelAttribute Member member, HttpSession session, RedirectAttributes redirectAttributes) {
//        ModelAndView loginMav = new ModelAndView();
//        loginMav.setViewName("redirect:/login.action");
        Member loginMember = account.login(member);
        if (loginMember != null) {
            session.setAttribute("memberLoginInfo", loginMember);
            return "redirect:/index.action";
        }
        else{
            redirectAttributes.addFlashAttribute("message", "ID or Password is incorrect");
            return "redirect:/login.action";
        }



    }
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.setAttribute("memberLoginInfo", null);
        return "redirect:/index.action";

    }

    //
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String join() {
        return "join";
    }

    @RequestMapping(value = "/join", method = {RequestMethod.POST})
    public String joinAction(Member member, HttpServletRequest request) {
        if (request.getParameter("userPassword1").equals(request.getParameter("userPassword2"))) {
            member.setUserPassword(request.getParameter("userPassword1"));
        }
        member.setUserBirth(request.getParameter("userYear") + "-" + request.getParameter("userMonth") + "-" + request.getParameter("userDay"));

        account.join(member);
        return "redirect:/index.action";
    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void image(HttpServletRequest request, HttpServletResponse response) {
        String saveName = request.getQueryString();

        if (saveName == null) {
            return;
        }
        File f = new File(basePath + saveName);
        InputStream is = null;
        try {
            is = new FileInputStream(f);
            OutputStream oos = response.getOutputStream();

            byte[] buf = new byte[8192];
            int c = 0;
            while ((c = is.read(buf, 0, buf.length)) > 0) {
                oos.write(buf, 0, c);
                oos.flush();
            }
            oos.close();
            is.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


}
