package com.fh.controller.manage.company;

import com.fh.controller.base.BaseController;
import com.fh.service.manage.company.CompanyService;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/company")
public class CompanyController extends BaseController {
    @Resource
    private CompanyService companyService;
    String redirect="redirect:/company/listcompany.do";

    @RequestMapping(value = "/listcompany.do")
    public ModelAndView findAllList(){
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("pd"+pd);

        List<PageData> cList = companyService.findAllList(pd);
        System.out.println(cList);
        mv.setViewName("system/company/company_list");
        mv.addObject("cList",cList);
        return mv;
    }

    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {

        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/company/company_edit");
        mv.addObject("msg", "insertCompany");
        return mv;
    }

    @RequestMapping(value = "/findOneById.do")
    public ModelAndView findOneById(){

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData st = companyService.findById(pd);
        System.out.println("st"+st);

        mv.setViewName("system/company/company_edit");
        mv.addObject("msg", "updateCompanyById");
        mv.addObject("st", st);
        return mv;
    }

    @RequestMapping(value = "/findBankById.do")
    public ModelAndView findBankById(){

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("pd"+pd);
        List<PageData> bList = companyService.findBankById(pd);
        System.out.println(bList);
        mv.setViewName("system/company/company_editb");
        mv.addObject("msg", "updateBankinfoById");
        mv.addObject("bList", bList);
        mv.addObject("pd",pd);
        return mv;
    }


    @RequestMapping(value = "/deleteCompanyById.do")
    public String deleteCompanyById(){
        PageData pd = new PageData();
        pd = this.getPageData();
        companyService.deleteCompanyById(pd);
        return redirect;
    }

    @RequestMapping(value = "/deleteBankById.do")
    @ResponseBody
    public String deleteBankById(){
        PageData pd = new PageData();
        pd = this.getPageData();
        companyService.deleteBankById(pd);
        return "success";

    }

    @RequestMapping(value = "/insertCompany.do")
    public String insertCompany(){
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username",Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztime",dateFormat.format(date));
        companyService.insertCompany(pd);
        companyService.insertTaxinfo(pd);
        System.out.println(pd+"成功");

        return redirect;
    }

    @RequestMapping(value = "/insertBankinfo.do",method = RequestMethod.POST)
    @ResponseBody
    public String insertBankinfo(){

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        companyService.insertBankinfo(pd);
        System.out.println(pd);
        mv.addObject("msg", "success");
        return "";

    }

    @RequestMapping(value = "/updateCompanyById.do")
    public String updateCompany(){

        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("username",Jurisdiction.getUsername());
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("cztiem",dateFormat.format(date));
        System.out.println(pd);
        companyService.updateCompanyById(pd);
        companyService.updateTxaInfoById(pd);
        return redirect;
    }

    @RequestMapping(value = "/updateBankinfoById.do")
    @ResponseBody
    public String updateBankinfo(){

        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println("执行了"+pd.toString());
        companyService.updateBankInfoById(pd);
        System.out.println(pd);
        return "success";
    }


    @RequestMapping(value = "/hasCno")
    @ResponseBody
    public Object hasCno(String cno) {
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        pd.put("cno",cno);
        List<PageData> list = companyService.findCno(pd);
        System.out.println(pd);
        System.out.println(list);
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

}
