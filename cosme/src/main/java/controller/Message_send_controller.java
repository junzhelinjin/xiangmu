package controller;

import entity.Message_send;
import entity.Notice;
import entity.Operator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Message_send_service;
import service.Operator_service;
import utils.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("Message_send")
public class Message_send_controller extends Basic_controller<Message_send>{
    @Resource(name = "Message_send_serviceImpl")
    Message_send_service service;
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
                        info.setWhere(" where message_send.infotype="+id1+"");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where message_send.status="+id+"");
                    }else{
                        info.setWhere(" where message_send.infotype="+id1+" and message_send.status="+id+"");
                    }
                }
            }
        }else{
            if((txt!=null&&txt.length()>0)&&(txt1!=null&&txt1.length()>0)){
                int id=Integer.parseInt(txt);
                int id1=Integer.parseInt(txt1);

                if(id==2){
                    if(id1==2){
                        info.setWhere(" where message_send.date like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where message_send.infotype="+id1+" and message_send.date like '%"+txt2+"%'");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where message_send.status="+id+" and message_send.date like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where message_send.infotype="+id1+" and message_send.status="+id+" and message_send.date like '%"+txt2+"%'");
                    }

                }
            }
        }
        return super.index(info, req);
    }

    @Override
    public JsonData insert(Message_send message_send, HttpServletRequest req) {
        message_send.setDate(AutoDate.Now());
//        req.getSession().getAttribute("user");
        message_send.setOperator_send_id(1);
        message_send.setInfoid(2);
        message_send.setStatus(0);
        message_send.setUrl_p("www.baidu.com");
        return super.insert(message_send, req);
    }
    @RequestMapping("statuslist")
    public @ResponseBody String[][] statuslist() {
        return new String[][]{{"0","普通"},{"1","加急"}};
    }

    @RequestMapping("noticetree")
    public String operatorlist(ModelMap m){
        m.put("operatorlist",oservice.getByWhere(new Search()));
        return "noticetree";
    }

    @RequestMapping("details")
    public String details(int id,ModelMap m){
        Message_send message_send=service.getById(id);
        m.put("name",message_send.getOperator_dest_names());
        m.put("info",message_send.getInfo());
        m.put("url",message_send.getUrl_p());
        return "pages/Message_senddetails";
    }
}
