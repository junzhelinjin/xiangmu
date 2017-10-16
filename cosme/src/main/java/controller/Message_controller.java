package controller;

import entity.Message;
import entity.Message_send;
import entity.Operator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Message_send_service;
import service.Message_service;
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
@RequestMapping("Message")
public class Message_controller extends Basic_controller<Message>{
    @Resource(name="Message_serviceImpl")
    Message_service service;
    @Resource(name = "Message_send_serviceImpl")
    Message_send_service mservice;
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
                        info.setWhere(" where message.infotype="+id1+"");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where message.status="+id+"");
                    }else{
                        info.setWhere(" where message.infotype="+id1+" and message.status="+id+"");
                    }
                }
            }
        }else{
            if((txt!=null&&txt.length()>0)&&(txt1!=null&&txt1.length()>0)){
                int id=Integer.parseInt(txt);
                int id1=Integer.parseInt(txt1);

                if(id==2){
                    if(id1==2){
                        info.setWhere(" where message.date like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where message.infotype="+id1+" and message.date like '%"+txt2+"%'");
                    }
                }else{
                    if(id1==2){
                        info.setWhere(" where message.status="+id+" and message.date like '%"+txt2+"%'");
                    }else{
                        info.setWhere(" where message.infotype="+id1+" and message.status="+id+" and message.date like '%"+txt2+"%'");
                    }

                }
            }
        }
        return super.index(info, req);
    }


    @RequestMapping("details")
    public String details(int id,ModelMap m){
        Message message=service.getById(id);
        int oid=message.getOperator_dest_id();
        Operator opt=oservice.getById(oid);
        m.put("name",opt.getName());
        m.put("info",message.getInfo());
        m.put("url",message.getUrl_s());
        m.put("url2",message.getUrl_p());
        return "pages/Messagedetails";
    }

    @RequestMapping("dels")
    public void dels(int id, HttpServletRequest req){
        List<Message> mes=service.getByWhere(new Search(" where send_id="+id));
        for(int i=0;i<mes.size();i++){
            int did=mes.get(i).getId();
            service.delete(did);
        }
    }

    @RequestMapping("inse")
    public @ResponseBody JsonData inse(int id, HttpServletRequest req){
        List<Message> m=service.getByWhere(new Search(" where send_id="+id));

        if(m.size()>0&&m!=null){
            dels(id, req);
            ind(id);
        }else{
            ind(id);
        }
        Message_send msd=mservice.getById(id);
        msd.setStatus(1);
        mservice.update1(msd);
        return new JsonData(1);
    }

    public void ind(int id){
        Message_send ms=mservice.getById(id);
        String ids=ms.getOperator_dest_ids();
        if(ids.length()>1){
            String[] idstr = ids.split(",");
            for (int i=0;i<idstr.length;i++){
                Message message=new Message();
                message.setDate(ms.getDate());
                message.setSend_id(ms.getId());
                message.setOperator_send_id(ms.getOperator_send_id());
                message.setOperator_dest_id(Integer.parseInt(idstr[i]));
                message.setInfotype(ms.getInfotype());
                message.setInfo_id(ms.getInfoid());
                message.setInfo(ms.getInfo());
                message.setStatus(0);
                message.setUrl_s(ms.getUrl_s());
                message.setUrl_p(ms.getUrl_p());
                service.insert(message);
            }
        }else{
            Message message=new Message();
            message.setDate(ms.getDate());
            message.setSend_id(ms.getId());
            message.setOperator_send_id(ms.getOperator_send_id());
            message.setOperator_dest_id(Integer.parseInt(ids));
            message.setInfotype(ms.getInfotype());
            message.setInfo_id(ms.getInfoid());
            message.setInfo(ms.getInfo());
            message.setStatus(0);
            message.setUrl_s(ms.getUrl_s());
            message.setUrl_p(ms.getUrl_p());
            service.insert(message);
        }

    }
}
