package controller;

import entity.Notice;
import entity.Operator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Notice_service;
import service.Operator_service;
import utils.AutoDate;
import utils.JsonData;
import utils.JsonList;
import utils.Search;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("Notice")
public class Notice_controller extends Basic_controller<Notice>{
    @Resource(name = "Notice_serviceImpl")
    Notice_service service;
    @Resource(name = "Operator_serviceImpl")
    Operator_service oservice;

    @Override
    public JsonList index(Search info, HttpServletRequest req) {
        String txt=req.getParameter("txt");
        String txt1=req.getParameter("txt1");
        String txt2=req.getParameter("txt2");
        if(txt2==null){
            if((txt!=null&&txt.length()>0)&&(txt1!=null&&txt1.length()>0)){
                int id=Integer.parseInt(txt);
                int id1=Integer.parseInt(txt1);

                if(id==2){
                    if(id1==2){

                    }else{
                        info.setWhere(" where notice.type="+id1+"");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where notice.status="+id+"");
                    }else{
                        info.setWhere(" where notice.type="+id1+" and notice.status="+id+"");
                    }
                }
            }
        }else{
            if((txt!=null&&txt.length()>0)&&(txt1!=null&&txt1.length()>0)){
                int id=Integer.parseInt(txt);
                int id1=Integer.parseInt(txt1);

                if(id==2){
                    if(id1==2){
                        info.setWhere(" where notice.createdate like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where notice.type="+id1+" and notice.createdate like '%"+txt2+"%'");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where notice.status="+id+" and notice.createdate like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where notice.type="+id1+" and notice.status="+id+" and notice.createdate like '%"+txt2+"%'");
                    }

                }
            }
        }
        return super.index(info, req);
    }

    @Override
    public JsonData insert(Notice notice, HttpServletRequest req) {
        notice.setCreatedate(AutoDate.Now());
        notice.setStartdate(AutoDate.Now());
//        req.getSession().getAttribute("user");
        notice.setOperator_id(1);
        notice.setStatus(0);
        return super.insert(notice, req);
    }

    @RequestMapping("typelist")
    public @ResponseBody String[][] typelist(){
        return new String[][]{{"0","普通"},{"1","加急"}};
    }

    @RequestMapping("noticetree")
    public String operatorlist(ModelMap m){
        m.put("operatorlist",oservice.getByWhere(new Search()));
        return "noticetree";
    }
    @RequestMapping("foredit")
    public String foredit(int id,ModelMap m){
        Notice notice=service.getById(id);
        String ids=notice.getDestids();
        List<Operator> opts;
        String str="";
        if(ids.length()>0&&ids!=null){
            opts=oservice.getByWhere(new Search(" where id in("+ids+")"));
            for(int i=0;i<opts.size();i++){
                if(i>0){
                    str=str+" , "+opts.get(i).getName();
                }else{
                    str=str+opts.get(i).getName();
                }
            }
        }
        m.put("str",str);
        return "pages/NoticeEdit";
    }
    @RequestMapping("details")
    public String details(int id,ModelMap m){
        Notice notice=service.getById(id);
        String ids=notice.getDestids();
        String ids1=notice.getOkids();
        String ids2=notice.getNoids();
        List<Operator> opts,opts1,opts2;
        String str="";
        String str1="";
        String str2="";
        if(ids.length()>0&&ids!=null){
            opts=oservice.getByWhere(new Search(" where id in("+ids+")"));
            for(int i=0;i<opts.size();i++){
                if(i>0){
                    str=str+" , "+opts.get(i).getName();
                }else{
                    str=str+opts.get(i).getName();
                }
            }
        }
        if(ids1.length()>0&&ids1!=null){
            opts1=oservice.getByWhere(new Search(" where id in("+ids1+")"));
            for(int i=0;i<opts1.size();i++){
                if(i>0){
                    str1=str1+" , "+opts1.get(i).getName();
                }else{
                    str1=str1+opts1.get(i).getName();
                }
            }
        }
        if(ids2.length()>0&&ids2!=null){
            opts2=oservice.getByWhere(new Search(" where id in("+ids2+")"));
            for(int i=0;i<opts2.size();i++){
                if(i>0){
                    str2=str2+" , "+opts2.get(i).getName();
                }else{
                    str2=str2+opts2.get(i).getName();
                }
            }
        }
        m.put("str",str);
        m.put("str1",str1);
        m.put("str2",str2);
        m.put("text",notice.getMessage());
        return "pages/Noticedetails";
    }

}
