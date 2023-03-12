package com.fh.controller.manage.client;

import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.service.manage.client.ClientService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/client")
public class ClientController extends BaseController {

    @Resource
    private ClientService clientService;
    String redirect="redirect:/client/findAllList.do";

    @RequestMapping(value = "/findAllList.do")
    public ModelAndView findAllList(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("pd"+pd);

        List<PageData> cList = clientService.findAllList(pd);
        System.out.println(cList);
        mv.setViewName("system/client/client_list");
        mv.addObject("cList",cList);
        return mv;
    }

    @RequestMapping(value = "/findById.do")
    public ModelAndView findById(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData cList = clientService.findById(pd);
        List<PageData> csname = clientService.findCsname(pd);
        mv.addObject("csname1",csname);
        System.out.println(csname);
        mv.setViewName("system/client/client_edit");
        mv.addObject("msg", "updateClient");
        mv.addObject("cList",cList);
        return mv;
    }

    @RequestMapping(value = "/findSellpById.do")

    public ModelAndView findSellpById(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> sellp = clientService.findSellpById(pd);
        System.out.println(sellp);
        mv.setViewName("system/client/client_editb");
        mv.addObject("msg", "updateSellpBy");
        mv.addObject("sellp",sellp);
        mv.addObject("pd",pd);
        return mv;
    }

    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> csname = clientService.findCsname(pd);
        mv.addObject("csname1",csname);
        mv.setViewName("system/client/client_edit");
        mv.addObject("msg", "insertClient");
        mv.addObject("pd",pd);
        return mv;
    }

    @RequestMapping(value = "/deleteClientById.do")
    public String deleteClientById(){
        PageData pd = new PageData();
        pd = this.getPageData();
        clientService.deleteClient(pd);
        return redirect;
    }

    @RequestMapping(value = "/deleteSellpById.do")
    @ResponseBody
    public String deleteSellpById(){
        PageData pd = new PageData();
        pd = this.getPageData();
        clientService.deleteSellpById(pd);
        return redirect;
    }

//    @RequestMapping(value = "/findCsname.do")
//    public ModelAndView findCsname(){
//        ModelAndView mv = this.getModelAndView();
//        PageData pd = new PageData();
//        pd = this.getPageData();
//        List<PageData> csname = clientService.findCsname(pd);
//        mv.addObject("csname",csname);
//        System.out.println(csname);
//        mv.setViewName("system/client/client_edit");
//
//        return mv;
//    }

    @RequestMapping(value = "/hasClino")
    @ResponseBody
    public Object hasClino(String clino) {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd.put("clino",clino);
        List<PageData> list = clientService.findClino(pd);
        System.out.println(list);
        System.out.println(pd);
        try {
            pd = this.getPageData();
            if (!list.isEmpty()) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    @RequestMapping(value = "/hasClifname")
    @ResponseBody
    public Object hasClifname(String clifname) {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd.put("supfname",clifname);
        List<PageData> list = clientService.findClifname(pd);
        System.out.println(list);
        System.out.println(pd);
        try {
            pd = this.getPageData();
            if (!list.isEmpty()) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    @RequestMapping(value = "/insertClient.do")
    public String insertClient(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        clientService.insertClient(pd);
        clientService.insertTaxinfo(pd);
        mv.addObject("msg", "success");
        return redirect;
    }

    @RequestMapping(value = "/insertSellp.do")
    @ResponseBody
    public String insertSellp(){

        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username", Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztime",dateFormat.format(date));
        clientService.insertSellp(pd);

        return redirect;
    }

    @RequestMapping(value = "/updateClient.do")
    public String updateClient(){
        PageData pd = new PageData();
        pd = this.getPageData();
        clientService.updateClientById(pd);
        clientService.updateTaxinfoById(pd);

        return redirect;
    }

    @RequestMapping(value = "/updateSellpBy.do")
    @ResponseBody
    public String updateSellpBy(){
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username",Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztime",dateFormat.format(date));
        clientService.updateSellpById(pd);
        return redirect;
    }

    @RequestMapping(value = "/getByClifname.do")
    @ResponseBody
    public Object getByClifname(String clifname) throws Exception {

        PageData pd = this.getPageData();
        pd = this.getPageData();
        pd.put("clifname",clifname);
        PageData byClifname = clientService.getByClifname(pd);
        String cliid = byClifname.get("cliid").toString();
        pd.put("cliid",cliid);
        PageData byId = clientService.findById(pd);
        System.out.println(byId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("byId",byId);
        System.out.println(jsonObject);
        return jsonObject;
    }
}
