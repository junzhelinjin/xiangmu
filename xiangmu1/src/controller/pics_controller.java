package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import entity.pics;
import service.pics_service;
import utils.JsonData;
import utils.SeachInfo;

@Controller
@RequestMapping("admin/pics")
public class pics_controller extends Basic_controller<pics> {
	@Resource(name = "pics_serviceImpl")
	pics_service service;

	@RequestMapping("index")
	public String index(SeachInfo info,ModelMap m, HttpServletRequest req) {
		m.put("list", service.getallwhere(info));
		m.put("where", info);
		return "pics/index";
	}
	
	@RequestMapping("list")
	public @ResponseBody List<pics> list(String ids){
		return service.getByWhere(new SeachInfo(ids, false)); 
	}
	
	@RequestMapping("delpic")
	public @ResponseBody JsonData delpic(int id){
		pics info=service.getById(id);
		new File(info.getPath()).delete();
		service.delete(id);
		return new JsonData(1);
	}
	@RequestMapping("upload")
	public @ResponseBody JsonData upload(MultipartFile file,HttpServletRequest req) throws Exception{
		String path=req.getRealPath("../upload");
		String fname=file.getOriginalFilename();		
		String ex="";
		if(fname.lastIndexOf(".")>-1)
			ex=fname.substring(fname.lastIndexOf("."));
		fname=new SimpleDateFormat("yyyyMMddHHmmssms").format(new Date())+ex;
		File f = new File(path, fname);
		if(!f.exists())f.mkdirs();
		file.transferTo(f);
		ex="/upload/"+fname;
		service.insert(new pics(ex, f.getPath()));
		return new JsonData(service.getMaxId(),ex);
	}
}
