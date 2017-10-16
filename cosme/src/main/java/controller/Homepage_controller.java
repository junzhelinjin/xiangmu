package controller;

import entity.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.Notice_service;
import utils.AutoDate;
import utils.Search;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("Homepage")
public class Homepage_controller {
    @Resource(name = "Notice_serviceImpl")
    Notice_service service;

    @RequestMapping("list")
    public String list(ModelMap m, HttpServletRequest req){
        List<Notice> no=service.getByWhere(new Search());
        List<Notice> no1=new ArrayList<Notice>();
//        req.getSession().getAttribute("user");
        for(int i=0;i<no.size();i++){
            String ids=no.get(i).getDestids();
            boolean status=ids.contains("1");
            if(status){
                String time= AutoDate.Now();
                String detime=no.get(i).getDestdate();
//                if(detime-time>0){
//
//                }
                no1.add(no.get(i));
            }
        }
        m.put("list",no1);
        return "pages/workbench";
    }
}
