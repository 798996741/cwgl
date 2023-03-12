package com.fh.controller.finance.reim;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fh.controller.base.BaseController;
import com.fh.pojo.massage.send.Text;
import com.fh.pojo.massage.send.TextMessage;
import com.fh.pojo.massage.send.Textcard;
import com.fh.pojo.massage.send.TextcardMessage;
import com.fh.service.app.SendMessageService;
import com.fh.service.appstaff.WXreimManager;
import com.fh.service.finance.reim.ReimdetService;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.*;
import com.fh.utils.WeiXinParamesUtil;
import com.fh.utils.WeiXinUtil;
import com.fh.utils.refreshToken;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/reimdet")
public class ReimdetController extends BaseController {
    String menuUrl = "reimdet/findReimdet.do";
    String redirect = "redirect:/reimdet/findReimdet.do";
    @Resource(name = "reimdetServiceImpl")
    private ReimdetService reimdetService;
    @Resource(name = "fhlogService")
    private FHlogManager FHLOG;
    @Resource(name = "WXreimService")
    private WXreimManager wXreimManager;

    @RequestMapping(value = "/findReimdet.do", method = RequestMethod.GET)
    public ModelAndView FindAllList() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        URLDecoder urlDecoder = new URLDecoder();
        String keywords = pd.getString("keywords");				//关键词检索条件
        String keywords1 = keywords == null ? "" : urlDecoder.decode(keywords, "utf-8");
        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords1.trim());
        }

        String csname = pd.getString("csname");
        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
        if (null != csname && !"".equals(csname)) {
            pd.put("csname", csname1);
        }else if (null == csname || "".equals(csname)){
            pd.put("csname", "宇伦");
        }
        String time = pd.getString("time");
        if (null != time && !"".equals(time)) {
            pd.put("time1", time + "-01");
            pd.put("time2", time + "-31");
        }else if (null == time || "".equals(time)){
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            pd.put("time1", dateFormat.format(date) + "-01");
            pd.put("time2", dateFormat.format(date) + "-31");
        }

        String reimtime = pd.getString("reimtime");
        if (null != reimtime && !"".equals(reimtime)) {
            pd.put("reimtime", reimtime);
        }
        String oneclass = pd.getString("oneclass");
        String oneclass1 = oneclass == null ? "" : urlDecoder.decode(oneclass, "utf-8");
        if (null != oneclass && !"".equals(oneclass)) {
            pd.put("oneclass", oneclass1);
        }
        String twoclass = pd.getString("twoclass");
        String twoclass1 = twoclass == null ? "" : urlDecoder.decode(twoclass, "utf-8");
        if (null != twoclass && !"".equals(twoclass)) {
            pd.put("twoclass", twoclass1);
        }
        String isapply = pd.getString("isapply");
        if (null != isapply && !"".equals(isapply)) {
            pd.put("isapply", isapply);
        }
        String isreim = pd.getString("isreim");
        if (null != isreim && !"".equals(isreim)) {
            pd.put("isreim", isreim);
        }
        String proclass = pd.getString("proclass");
        String proclass1 = proclass == null ? "" : urlDecoder.decode(proclass, "utf-8");
        if (null != proclass && !"".equals(proclass)) {
            pd.put("proclass", proclass1);
        }
        String ispur = pd.getString("ispur");
        if (null != ispur && !"".equals(ispur)) {
            pd.put("ispur", ispur);
        }
        String billtype = pd.getString("billtype");
        String billtype1 = billtype == null ? "" : urlDecoder.decode(billtype, "utf-8");
        if (null != billtype && !"".equals(billtype)) {
            pd.put("billtype", billtype1);
        }
        String name = pd.getString("name");
        if (null != name && !"".equals(name)) {
            pd.put("name", name);
        }
        String isaudit = pd.getString("isaudit");
        if (null != isaudit && !"".equals(isaudit)) {
            pd.put("isaudit", isaudit);
        }

        List<PageData> getcsname = reimdetService.getcsname(pd);
        List<PageData> getname = reimdetService.getname(pd);
        List<PageData> getclassname = reimdetService.getclassname(pd);
        List<PageData> pdec = reimdetService.getPdec(pd);
        List<PageData> relist = reimdetService.FindAllList(pd);
        List<PageData> oneClass = reimdetService.getOneclass(pd);
        List<PageData> twoClass = reimdetService.getTowclass(pd);
        List<PageData> threeClass = reimdetService.getThreeclass(pd);
        List<PageData> fourClass = reimdetService.getfourclass(pd);
        pd.put("username",Jurisdiction.getUsername());
        PageData user = reimdetService.getUser(pd);
        mv.addObject("user", user);
        System.out.println(oneClass+"oneClass");
        System.out.println(twoClass+"twoClass");
        System.out.println(threeClass+"threeClass");
        System.out.println(fourClass+"fourClass");
        mv.addObject("pd", pd);
        mv.addObject("relist", relist);
        mv.addObject("getcsname", getcsname);
        mv.addObject("oneClass", oneClass);
        mv.addObject("threeClass", threeClass);
        mv.addObject("twoClass", twoClass);
        mv.addObject("fourClass", fourClass);
        mv.addObject("getname", getname);
        mv.addObject("getclassname", getclassname);
        mv.addObject("pdec", pdec);
        mv.addObject("QX", Jurisdiction.getHC());
        mv.setViewName("reim/reimdet/reimdet_list");
        return mv;
    }

    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        URLDecoder urlDecoder = new URLDecoder();
        String csname = pd.getString("csname");
        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
        pd.put("csname", csname1);
        String time = pd.getString("time");
        pd.put("username", Jurisdiction.getUsername());
        List<PageData> getname = reimdetService.getname(pd);
        List<PageData> oneClass = reimdetService.getOneclass(pd);
        List<PageData> twoClass = reimdetService.getTowclass(pd);
        List<PageData> threeClass = reimdetService.getThreeclass(pd);
        List<PageData> fourClass = reimdetService.getfourclass(pd);
        List<PageData> pdec = reimdetService.getPdec(pd);

        PageData user = reimdetService.getUser(pd);
        System.out.println(oneClass+"oneClass");
        System.out.println(twoClass+"twoClass");
        System.out.println(threeClass+"threeClass");
        System.out.println(fourClass+"fourClass");
        mv.addObject("user", user);
        mv.addObject("getname", getname);
        mv.addObject("oneClass", oneClass);
        mv.addObject("twoClass", twoClass);
        mv.addObject("threeClass", threeClass);
        mv.addObject("fourClass", fourClass);
        mv.addObject("pdec", pdec);
        mv.addObject("pd", pd);
        mv.addObject("msg", "insertReimdet");

        mv.setViewName("reim/reimdet/reimdet_add");
        return mv;
    }

    @RequestMapping(value = "/findReimdetById.do")
    public ModelAndView findReimdetById() throws Exception {
//        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
//            return null;
//        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        URLDecoder urlDecoder = new URLDecoder();
        String csname = pd.getString("csname");
        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
        if (null != csname && !"".equals(csname)) {
            pd.put("csname", csname1);
        }else if (null == csname || "".equals(csname)){
            pd.put("csname", "宇伦");
        }
        String time = pd.getString("time");
        pd.put("username", Jurisdiction.getUsername());
        PageData reimdet = reimdetService.findReimdetById(pd);
        List<PageData> getname = reimdetService.getname(pd);
        List<PageData> oneClass = reimdetService.getOneclass(pd);
        List<PageData> twoClass = reimdetService.getTowclass(pd);
        List<PageData> threeClass = reimdetService.getThreeclass(pd);
        List<PageData> fourClass = reimdetService.getfourclass(pd);
        List<PageData> pdec = reimdetService.getPdec(pd);
        PageData user = reimdetService.getUser(pd);
        System.out.println(oneClass+"oneClass");
        System.out.println(twoClass+"twoClass");
        System.out.println(threeClass+"threeClass");
        System.out.println(fourClass+"fourClass");
        mv.addObject("user", user);
        mv.addObject("pd", pd);
        mv.addObject("getname", getname);
        mv.addObject("oneClass", oneClass);
        mv.addObject("twoClass", twoClass);
        mv.addObject("threeClass", threeClass);
        mv.addObject("fourClass", fourClass);
        mv.addObject("pdec", pdec);
        mv.addObject("reimdet", reimdet);
        mv.addObject("QX", Jurisdiction.getHC());
        mv.addObject("msg", "updateReimdet");
        mv.setViewName("reim/reimdet/reimdet_add");
        return mv;
    }

    @RequestMapping(value = "/insertReimdet.do", method = RequestMethod.POST)
    public String insertReimdet() throws Exception {
//        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
//            return null;
//        } //校验权限
        PageData pd = new PageData();
        pd = this.getPageData();
        String csname = pd.getString("csname").trim();
        pd.put("csname", csname);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("date", dateFormat.format(date));
        String username = Jurisdiction.getUsername();
        pd.put("filname", username);
        pd.put("auditor", "admin");

        reimdetService.insertReimdet(pd);
        String s="redirect:/reimdet/findReimdet.do?csname="+pd.getString("csname")+"&time="+pd.getString("time");
        return s;
    }

    @RequestMapping(value = "/updateReimdet.do", method = RequestMethod.POST)
    public String updateReimdet() throws Exception {
//        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
//            return null;
//        } //校验权限
        PageData pd = new PageData();
        pd = this.getPageData();
        String csname = pd.getString("csname").trim();
        pd.put("csname", csname);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        pd.put("date", dateFormat.format(date));
        reimdetService.updateReimdet(pd);

        PageData pageData = new PageData();
        pageData.put("uid",pd.getString("uid"));
        List<PageData> list = wXreimManager.getreimdetByUid(pd);
        System.out.println(list);
        if (list!=null){
            Boolean bool = null;
            String sum="";
            for (PageData data : list) {
                String isaudit = data.getString("isaudit");
                sum+=isaudit;
            }
            System.out.println(sum);
            if (!sum.contains("2")){
                if (sum.contains("1")){
                    PageData reimauditdetails = wXreimManager.reimauditdetails(pd);
                    String content="您的报销申请财务部门未通过，如需报销请继续提出申请！";
                    String name = pd.getString("name");
                    sendText(content, name);
                    PageData pd1 = new PageData();
                    pd1.put("deptauditor",Jurisdiction.getUsername());
                    pd1.put("depttime",getTime());
                    pd1.put("deptsche","2");
                    pd1.put("id",reimauditdetails.getString("id"));
                    wXreimManager.updatedeptsche(pd1);
                }else {
                    PageData reimauditdetails = wXreimManager.reimauditdetails(pd);
                    String managerauditor = reimauditdetails.getString("managerauditor");
                    String uid = reimauditdetails.getString("uid");
                    //0.设置消息内容
                    String title = "待办事宜";
                    String description = "有一条报销申请待处理";
                    String url = "http://webchat.ada-robotics.com:8051/cwgl/app_reim/managerauditlist.do?managerauditor="+managerauditor+"&uid="+uid;
                    sendTextCard(title, description, url, managerauditor);
                    if (sum.contains("3")){
                        String content="您的报销申请财务部门已通过，但是材料不全，请前往补齐材料！";
                        String name = pd.getString("name");
                        sendText(content, name);
                    }

                    PageData pd1 = new PageData();
                    pd1.put("deptauditor",Jurisdiction.getUsername());
                    pd1.put("depttime",getTime());
                    pd1.put("deptsche","1");
                    pd1.put("id",reimauditdetails.get("id").toString());
                    wXreimManager.updatedeptsche(pd1);
                }
            }
        }



        String s="redirect:/reimdet/findReimdet.do?csname="+pd.getString("csname")+"&time="+pd.getString("time");
        return s;
    }

    @RequestMapping(value = "/deleteReimdetbyid.do")
    public String deleteReimdetbyid() throws Exception {
//        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
//            return null;
//        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        reimdetService.deleteReimdetbyid(pd);
        URLDecoder urlDecoder = new URLDecoder();
//        String csname = pd.getString("csname");
//        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
        String s="redirect:/reimdet/findReimdet.do?csname="+pd.getString("csname")+"&time="+pd.getString("time");
        return s;
    }

    /**
     * 导出用户信息到EXCEL
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/excel")
    public ModelAndView exportExcel(HttpServletResponse response, HttpServletRequest request) throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导出合同信息到EXCEL");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
//            if (Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
            //关键词检索条件
            URLDecoder urlDecoder = new URLDecoder();
            String csname = pd.getString("csname");
            String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
            if (null != csname && !"".equals(csname)) {
                pd.put("csname", csname1);
            }else if (null == csname || "".equals(csname)){
                pd.put("csname", "宇伦");
            }
            String time = pd.getString("time");
            if (null != time && !"".equals(time)) {
                pd.put("time1", time + "-01");
                pd.put("time2", time + "-31");
            }else if (null == time || "".equals(time)){
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
                pd.put("time1", dateFormat.format(date) + "-01");
                pd.put("time2", dateFormat.format(date) + "-31");
            }

            String reimtime = pd.getString("reimtime");
            if (null != reimtime && !"".equals(reimtime)) {
                pd.put("reimtime", reimtime);
            }
            String oneclass = pd.getString("oneclass");
            String oneclass1 = oneclass == null ? "" : urlDecoder.decode(oneclass, "utf-8");
            if (null != oneclass && !"".equals(oneclass)) {
                pd.put("oneclass", oneclass1);
            }
            String twoclass = pd.getString("twoclass");
            String towclass1 = twoclass == null ? "" : urlDecoder.decode(oneclass, "utf-8");
            if (null != twoclass && !"".equals(twoclass)) {
                pd.put("twoclass", towclass1);
            }
            String isapply = pd.getString("isapply");
            if (null != isapply && !"".equals(isapply)) {
                pd.put("isapply", isapply);
            }
            String isreim = pd.getString("isreim");
            if (null != isreim && !"".equals(isreim)) {
                pd.put("isreim", isreim);
            }
            String proclass = pd.getString("proclass");
            String proclass1 = proclass == null ? "" : urlDecoder.decode(proclass, "utf-8");
            if (null != proclass && !"".equals(proclass)) {
                pd.put("proclass", proclass1);
            }
            String ispur = pd.getString("ispur");
            if (null != ispur && !"".equals(ispur)) {
                pd.put("ispur", ispur);
            }
            String billtype = pd.getString("billtype");
            String billtype1 = billtype == null ? "" : urlDecoder.decode(billtype, "utf-8");
            if (null != billtype && !"".equals(billtype)) {
                pd.put("billtype", billtype1);
            }
            String name = pd.getString("name");
            if (null != name && !"".equals(name)) {
                pd.put("name", name);
            }
            String isaudit = pd.getString("isaudit");
            if (null != isaudit && !"".equals(isaudit)) {
                pd.put("isaudit", isaudit);
            }
            HSSFWorkbook wb = new HSSFWorkbook();
            //创建sheet页
            HSSFSheet sheet = wb.createSheet("报销明细记录");
            HSSFRow titleRow = sheet.createRow(0);

            titleRow.createCell((short) 0).setCellValue("公司");
            titleRow.createCell((short) 1).setCellValue("报销日期");
            titleRow.createCell((short) 2).setCellValue("报销人");
            titleRow.createCell((short) 3).setCellValue("报销事由");
            titleRow.createCell((short) 4).setCellValue("报销分类");
            titleRow.createCell((short) 5).setCellValue("二级分类");
            titleRow.createCell((short) 6).setCellValue("三级分类");
            titleRow.createCell((short) 7).setCellValue("四级分类");
            titleRow.createCell((short) 8).setCellValue("票据数量");
            titleRow.createCell((short) 9).setCellValue("交通金额");
            titleRow.createCell((short) 10).setCellValue("住宿金额");
            titleRow.createCell((short) 11).setCellValue("出差金额");
            titleRow.createCell((short) 12).setCellValue("实报金额");
            titleRow.createCell((short) 13).setCellValue("项目分类");
            titleRow.createCell((short) 14).setCellValue("票据类型");
            titleRow.createCell((short) 15).setCellValue("是否有出差申请单");
            titleRow.createCell((short) 16).setCellValue("是否有采购申请单");
//            titleRow.createCell((short) 17).setCellValue("是否已报销");
            titleRow.createCell((short) 17).setCellValue("备注");
//            titleRow.createCell((short) 18).setCellValue("审核状态");


            List<PageData> reimdet = reimdetService.FindAllList(pd);
//            System.out.println(sellList);

            List<PageData> varList = new ArrayList<PageData>();
            for (int i = 0; i < reimdet.size(); i++) {
                HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
                dataRow.createCell((short) 0).setCellValue(reimdet.get(i).getString("csname"));
                dataRow.createCell((short) 1).setCellValue(reimdet.get(i).getString("time"));
                dataRow.createCell((short) 2).setCellValue(reimdet.get(i).getString("name"));
                dataRow.createCell((short) 3).setCellValue(reimdet.get(i).getString("reason"));
                dataRow.createCell((short) 4).setCellValue(reimdet.get(i).getString("oneclassname"));
                dataRow.createCell((short) 5).setCellValue(reimdet.get(i).getString("twoclassname"));
                dataRow.createCell((short) 6).setCellValue(reimdet.get(i).getString("threeclassname"));
                dataRow.createCell((short) 7).setCellValue(reimdet.get(i).getString("fourclassname"));
                dataRow.createCell((short) 8).setCellValue(reimdet.get(i).getString("billnum"));
                dataRow.createCell((short) 9).setCellValue(reimdet.get(i).get("tripmon").toString());
                dataRow.createCell((short) 10).setCellValue(reimdet.get(i).get("hostelmon").toString());
                dataRow.createCell((short) 11).setCellValue(reimdet.get(i).get("mission").toString());
                dataRow.createCell((short) 12).setCellValue(reimdet.get(i).get("realmon").toString());
                dataRow.createCell((short) 13).setCellValue(reimdet.get(i).getString("proclass"));
                dataRow.createCell((short) 14).setCellValue(reimdet.get(i).getString("billtype"));
                String isapply1 = reimdet.get(i).getString("isapply");
                if ("0".equals(isapply1)) {
                    dataRow.createCell((short) 15).setCellValue("是");
                } else if ("1".equals(isapply1)) {
                    dataRow.createCell((short) 15).setCellValue("否");
                }
//                String ispur1 = reimdet.get(i).getString("ispur");
//                if ("0".equals(ispur1)) {
//                    dataRow.createCell((short) 16).setCellValue("后期报销");
//                } else if ("1".equals(ispur1)) {
//                    dataRow.createCell((short) 16).setCellValue("确认报销");
//                }
                String isreim1 = reimdet.get(i).getString("isreim");
                if ("0".equals(isreim1)) {
                    dataRow.createCell((short) 16).setCellValue("是");
                } else if ("1".equals(isreim1)) {
                    dataRow.createCell((short) 16).setCellValue("否");
                }
                dataRow.createCell((short) 17).setCellValue(reimdet.get(i).getString("remark"));
//                String isaudit1 = reimdet.get(i).getString("isaudit");
//                if ("0".equals(isreim1)) {
//                    dataRow.createCell((short) 18).setCellValue("审核通过");
//                } else if ("1".equals(isreim1)) {
//                    dataRow.createCell((short) 18).setCellValue("审核不通过");
//                } else if ("2".equals(isreim1)) {
//                    dataRow.createCell((short) 18).setCellValue("暂未审核");
//                }


            }

// 设置下载时客户端Excel的名称
            String filename = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "-reimdet.xls";
            //设置下载的文件
            System.out.println(filename);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment;filename=" + filename);
            OutputStream ouputStream = response.getOutputStream();//打开流
            wb.write(ouputStream); //在excel内写入流
            ouputStream.flush();// 刷新流
            ouputStream.close();// 关闭流

//            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
//        mv.setViewName("redirect:/reimdet/findReimdet.do");
        return mv;
    }

    @RequestMapping(value = "/goload.do")
    public ModelAndView goload() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("reim/reimdet/reimdet_export");
        return mv;
    }

    /**
     * 从EXCEL导入到数据库
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/readExcel")
    public ModelAndView readExcel(
            @RequestParam(value = "excel", required = false) MultipartFile file
    ) throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "从EXCEL导入到数据库");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;                                //文件上传路径
            String fileName = FileUpload.fileUp(file, filePath, "reimdetexcel");                            //执行上传
            List<PageData> listPd = (List) ObjectExcelRead.readExcel(filePath, fileName, 1, 0, 0);        //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
            List<PageData> oneClass = reimdetService.getOneclass(pd);
            List<PageData> twoClass = reimdetService.getTowclass(pd);
            List<PageData> threeClass = reimdetService.getThreeclass(pd);
            List<PageData> fourClass = reimdetService.getfourclass(pd);
            /*存入数据库操作======================================*/
            System.out.println(listPd);
            for (int i = 0; i < listPd.size(); i++) {
                pd.put("csname", listPd.get(i).getString("var0"));
                pd.put("time", listPd.get(i).getString("var1"));
                pd.put("name", listPd.get(i).getString("var2"));
                pd.put("reason", listPd.get(i).getString("var3"));
                String var4 = listPd.get(i).getString("var4");

                for (PageData aClass : oneClass) {
                    String oneclass = aClass.getString("oneclass");
                    if (var4.equals(oneclass)) {
                        pd.put("oneclass", aClass.getString("code"));
                    }
                }
                String var5 = listPd.get(i).getString("var5");

                for (PageData aClass : twoClass) {
                    String twoclass = aClass.getString("twoclass");
                    if (var5.equals(twoclass)) {
                        pd.put("twoclass", aClass.getString("code"));
                    }
                }
                String var6 = listPd.get(i).get("var6").toString();
                for (PageData aClass : threeClass) {
                    String threeclass = aClass.getString("threeclass");
                    if (var6.equals(threeclass)) {
                        pd.put("threeclass", aClass.getString("code"));
                    }
                }
                String var7 = listPd.get(i).get("var7").toString();
                for (PageData aClass : fourClass) {
                    String fourclass = aClass.getString("fourclass");
                    if (var7.equals(fourclass)) {
                        pd.put("fourclass", aClass.getString("code"));
                    }
                }
                pd.put("billnum", listPd.get(i).get("var8").toString());
                String var9 = listPd.get(i).get("var9").toString();
                if (var9 != "" && var9 != null) {
                    BigDecimal tripmon = new BigDecimal(var9);
                    pd.put("tripmon", tripmon);
                }
                String var10 = listPd.get(i).get("var10").toString();
                if (var10 != "" && var10 != null) {
                    BigDecimal hostelmon = new BigDecimal(var10);
                    pd.put("hostelmon", hostelmon);
                }
                String var11 = listPd.get(i).get("var11").toString();
                if (var11 != "" && var11 != null) {
                    BigDecimal mission = new BigDecimal(var11);
                    pd.put("mission", mission);
                }
                String var12 = listPd.get(i).get("var12").toString();
                if (var12 != "" && var12 != null) {
                    BigDecimal realmon = new BigDecimal(var12);
                    pd.put("realmon", realmon);
                }

                pd.put("proclass", listPd.get(i).getString("var13"));

                String var14 = listPd.get(i).getString("var14");
                if ("发票".equals(var14)) {
                    pd.put("billtype", 0);
                } else if ("收据".equals(var14)) {
                    pd.put("billtype", 1);
                } else if ("付款截图".equals(var14)) {
                    pd.put("billtype", 2);
                }

                String var15 = listPd.get(i).getString("var15");
                if (var15.equals("是")) {
                    pd.put("isapply", 0);
                } else if (var15.equals("否")) {
                    pd.put("isapply", 1);
                }
                String var16 = listPd.get(i).getString("var16");
                if (var16.equals("是")) {
                    pd.put("ispur", 0);
                } else if (var16.equals("否")) {
                    pd.put("ispur", 1);
                }
//                String var17 = listPd.get(i).getString("var17");
//                if (var17.equals("是")) {
//                    pd.put("isreim", 0);
//                } else if (var17.equals("否")) {
//                    pd.put("isreim", 1);
//                }
                pd.put("remark", listPd.get(i).getString("var17"));
//                String var18 = listPd.get(i).getString("var18");
//                if (var18.equals("审核通过")) {
//                    pd.put("isaudit", 0);
//                } else if (var18.equals("审核不通过")) {
//                    pd.put("isaudit", 1);
//                } else if (var18.equals("暂未审核")) {
//                    pd.put("isaudit", 2);
//                }

                pd.put("filname","admin");
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                pd.put("date", dateFormat.format(date));

                reimdetService.insertReimdet(pd);
            }
        }
        mv.addObject("msg", "success");

        mv.setViewName("redirect:/reimdet/findReimdet.do");
        return mv;
    }

    @RequestMapping(value = "/getProce_reim.do")
    public ModelAndView getProce_reim() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        PageData pd2 = new PageData();
        PageData pd3 = new PageData();
        pd = this.getPageData();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
        URLDecoder urlDecoder = new URLDecoder();
        String csname = pd.getString("csname");
        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
        if (null != csname && !"".equals(csname)) {
            pd.put("csname", csname1);
            pd2.put("csname", csname1);
            pd3.put("csname", csname1);
        }else if (null == csname || "".equals(csname)){
            pd.put("csname", "宇伦");
            pd2.put("csname", "宇伦");
            pd3.put("csname", "宇伦");
        }
        String time1 = pd.getString("time1");
        if (null != time1 && !"".equals(time1)) {
            pd.put("time1", time1);
            pd2.put("time1", time1);
            pd3.put("time1", time1);
        }else if (null == time1 || "".equals(time1)){
            pd.put("time1", dateFormat.format(date)+"-01");
            pd2.put("time1", dateFormat.format(date)+"-01");
            pd3.put("time1", dateFormat.format(date)+"-01");
        }
        String time2 = pd.getString("time2");
        if (null != time2 && !"".equals(time2)) {
            pd.put("time2", time2);
            pd2.put("time2", time2);
            pd3.put("time2", time2);
        }else if (null == time2 || "".equals(time2)){
            pd.put("time2", dateFormat.format(date)+"-31");
            pd2.put("time2", dateFormat.format(date)+"-31");
            pd3.put("time2", dateFormat.format(date)+"-31");
        }
        pd.put("proce", '1');
        pd2.put("proce", '1');
        pd3.put("proce", '1');

        List<PageData> reimstat = reimdetService.getReimstat(pd);
        List<PageData> oneClass = reimdetService.getOneclass(pd);
        List<PageData> getcsname = reimdetService.getcsname(pd);
        HashMap<String, HashMap<String, BigDecimal>> map = new HashMap<>();
        System.out.println(oneClass+"oneClass");
        //填入分类名称
        for (PageData pageData : reimstat) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            map.put(pageData.getString("name"), monmap);
        }
        System.out.println(map);
        //填入中间数据
        for (PageData reimstatpd : reimstat) {
            String oneclass = reimstatpd.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(reimstatpd.get("realmon").toString());
            String name = reimstatpd.getString("name");
            System.out.println(oneclass);
            System.out.println(realmon);
            System.out.println(name);
            for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                if (mapEntry.getKey().equals(name)) {
                    BigDecimal add = map.get(name).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = map.get(name);
                    oneclassMap.put(oneclass, add);
                    map.put(name, oneclassMap);
                }
            }

        }
        //已报销总和
        HashMap<String, HashMap<String, BigDecimal>> hashMap2 = new HashMap<>();

        pd2.put("isreim","0");
        List<PageData> reimstat2 = reimdetService.getReimstat(pd2);
        for (PageData pageData : reimstat2) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            hashMap2.put(pageData.getString("name"), monmap);
        }

        for (PageData pageData : reimstat2) {
            String oneclass = pageData.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
            String name = pageData.getString("name");
            for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap2.entrySet()) {
                if (entry.getKey().equals(name)) {
                    BigDecimal add = hashMap2.get(name).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = hashMap2.get(name);
                    oneclassMap.put(oneclass, add);
                    hashMap2.put(name, oneclassMap);
                }
            }
        }

        HashMap<String, BigDecimal> altotal = new HashMap();
        for (PageData pageData : reimstat2) {
            String name = pageData.getString("name");
            altotal.put(name, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = hashMap2.get(name);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                altotal.put(name, Entry.getValue().add(altotal.get(name)));
            }
        }
        BigDecimal alsum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
            alsum=alsum.add(entry.getValue());
        }

        //未报销总和
        HashMap<String, HashMap<String, BigDecimal>> hashMap3 = new HashMap<>();
        pd3.put("isreim","1");
        List<PageData> reimstat3 = reimdetService.getReimstat(pd3);
        for (PageData pageData : reimstat3) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            hashMap3.put(pageData.getString("name"), monmap);
        }
        for (PageData pageData : reimstat3) {
            String oneclass = pageData.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
            String name = pageData.getString("name");
            for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap3.entrySet()) {
                if (entry.getKey().equals(name)) {
                    BigDecimal add = hashMap3.get(name).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = hashMap3.get(name);
                    oneclassMap.put(oneclass, add);
                    hashMap3.put(name, oneclassMap);
                }
            }
        }

        HashMap<String, BigDecimal> nototal = new HashMap();
        for (PageData pageData : reimstat3) {
            String name = pageData.getString("name");
            nototal.put(name, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = hashMap3.get(name);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                nototal.put(name, Entry.getValue().add(nototal.get(name)));
            }
        }
        BigDecimal nosum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
            nosum=nosum.add(entry.getValue());
        }

        //根据分类求总和
        HashMap<String, BigDecimal> btotal = new HashMap();
        for (PageData aClass : oneClass) {
            String oneclass = aClass.getString("oneclass");
            btotal.put(oneclass, new BigDecimal(0));
            for (Map.Entry<String, HashMap<String, BigDecimal>> classMap : map.entrySet()) {
                btotal.put(oneclass, classMap.getValue().get(oneclass).add(btotal.get(oneclass)));
            }
        }
        //个人总和
        HashMap<String, BigDecimal> stotal = new HashMap();
        for (PageData pageData : reimstat) {
            String name = pageData.getString("name");
            stotal.put(name, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = map.get(name);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                stotal.put(name, Entry.getValue().add(stotal.get(name)));
            }

        }
        BigDecimal sum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> summap : btotal.entrySet()) {

            sum = sum.add(summap.getValue());
        }



        mv.addObject("stotal", stotal);
        mv.addObject("sum", sum);
        mv.addObject("alsum", alsum);
        mv.addObject("altotal", altotal);
        mv.addObject("nosum", nosum);
        mv.addObject("nototal", nototal);
        mv.addObject("btotal", btotal);
        mv.addObject("map", map);
        mv.addObject("getcsname", getcsname);
        mv.addObject("pd", pd);
        mv.addObject("oneClass", oneClass);
        mv.setViewName("reim/reimstat/reimstat_list");
        return mv;
    }

    /**
     * 导出用户信息到EXCEL
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/exportReimstat.do")
    public ModelAndView exportReimstat() throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导出合同信息到EXCEL");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        PageData pd2 = new PageData();
        PageData pd3 = new PageData();
        pd = this.getPageData();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
        try {
            if (Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
                //关键词检索条件
                URLDecoder urlDecoder = new URLDecoder();
                String csname = pd.getString("csname");
                String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
                if (null != csname && !"".equals(csname)) {
                    pd.put("csname", csname1);
                    pd2.put("csname", csname1);
                    pd3.put("csname", csname1);
                }else if (null == csname || "".equals(csname)){
                    pd.put("csname", "宇伦");
                    pd2.put("csname", "宇伦");
                    pd3.put("csname", "宇伦");
                }
                String time1 = pd.getString("time1");
                if (null != time1 && !"".equals(time1)) {
                    pd.put("time1", time1);
                    pd2.put("time1", time1);
                    pd3.put("time1", time1);
                }else if (null == time1 || "".equals(time1)){
                    pd.put("time1", dateFormat.format(date)+"-01");
                    pd2.put("time1", dateFormat.format(date)+"-01");
                    pd3.put("time1", dateFormat.format(date)+"-01");
                }
                String time2 = pd.getString("time2");
                if (null != time2 && !"".equals(time2)) {
                    pd.put("time2", time2);
                    pd2.put("time2", time2);
                    pd3.put("time2", time2);
                }else if (null != time2 && !"".equals(time2)){
                    pd.put("time2", dateFormat.format(date)+"-31");
                    pd2.put("time2", dateFormat.format(date)+"-31");
                    pd3.put("time2", dateFormat.format(date)+"-31");
                }
                pd.put("proce", '1');
                pd2.put("proce", '1');
                pd3.put("proce", '1');
                List<PageData> reimstat = reimdetService.getReimstat(pd);
                List<PageData> oneClass = reimdetService.getOneclass(pd);
                HashMap<String, HashMap<String, BigDecimal>> map = new HashMap();

                for (PageData pageData : reimstat) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    map.put(pageData.getString("name"), monmap);
                }

                for (PageData reimstatpd : reimstat) {
                    String oneclass = reimstatpd.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(reimstatpd.get("realmon").toString());
                    String name = reimstatpd.getString("name");

                    for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                        if (mapEntry.getKey().equals(name)) {
                            BigDecimal add = map.get(name).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = map.get(name);
                            oneclassMap.put(oneclass, add);
                            map.put(name, oneclassMap);
                        }
                    }

                }
                //已报销总和
                HashMap<String, HashMap<String, BigDecimal>> hashMap2 = new HashMap<>();

                pd2.put("isreim","0");
                List<PageData> reimstat2 = reimdetService.getReimstat(pd2);
                for (PageData pageData : reimstat) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    hashMap2.put(pageData.getString("name"), monmap);
                }

                for (PageData pageData : reimstat2) {
                    String oneclass = pageData.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
                    String name = pageData.getString("name");
                    for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap2.entrySet()) {
                        if (entry.getKey().equals(name)) {
                            BigDecimal add = hashMap2.get(name).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = hashMap2.get(name);
                            oneclassMap.put(oneclass, add);
                            hashMap2.put(name, oneclassMap);
                        }
                    }
                }

                HashMap<String, BigDecimal> altotal = new HashMap();
                for (PageData pageData : reimstat2) {
                    String name = pageData.getString("name");
                    altotal.put(name, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = hashMap2.get(name);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        altotal.put(name, Entry.getValue().add(altotal.get(name)));
                    }
                }
                BigDecimal alsum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
                    alsum=alsum.add(entry.getValue());
                }

                //未报销总和
                HashMap<String, HashMap<String, BigDecimal>> hashMap3 = new HashMap<>();
                pd3.put("isreim","1");
                List<PageData> reimstat3 = reimdetService.getReimstat(pd3);
                for (PageData pageData : reimstat) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    hashMap3.put(pageData.getString("name"), monmap);
                }
                for (PageData pageData : reimstat3) {
                    String oneclass = pageData.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
                    String name = pageData.getString("name");
                    for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap3.entrySet()) {
                        if (entry.getKey().equals(name)) {
                            BigDecimal add = hashMap3.get(name).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = hashMap3.get(name);
                            oneclassMap.put(oneclass, add);
                            hashMap3.put(name, oneclassMap);
                        }
                    }
                }

                HashMap<String, BigDecimal> nototal = new HashMap();
                for (PageData pageData : reimstat3) {
                    String name = pageData.getString("name");
                    nototal.put(name, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = hashMap3.get(name);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        nototal.put(name, Entry.getValue().add(nototal.get(name)));
                    }
                }
                BigDecimal nosum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
                    nosum=nosum.add(entry.getValue());
                }

                //根据分类求总和

                HashMap<String, BigDecimal> stotal = new HashMap();
                for (PageData pageData : reimstat) {
                    String name = pageData.getString("name");
                    stotal.put(name, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = map.get(name);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        stotal.put(name, Entry.getValue().add(stotal.get(name)));
                    }

                }

                HashMap<String, BigDecimal> btotal = new HashMap();
                for (PageData aClass : oneClass) {
                    String oneclass = aClass.getString("oneclass");
                    btotal.put(oneclass, new BigDecimal(0));
                    for (Map.Entry<String, HashMap<String, BigDecimal>> classMap : map.entrySet()) {
                        btotal.put(oneclass, classMap.getValue().get(oneclass).add(btotal.get(oneclass)));
                    }
                }
                BigDecimal sum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> summap : btotal.entrySet()) {

                    sum = sum.add(summap.getValue());
                }


                Map<String, Object> dataMap = new HashMap<String, Object>();
                List<String> titles = new ArrayList<String>();
                titles.add("姓名");        //1
                for (PageData aClass : oneClass) {
                    titles.add(aClass.getString("oneclass"));
                }

                titles.add("已报销");
                titles.add("未报销");
                titles.add("小计");
                dataMap.put("titles", titles);


                List<PageData> varList = new ArrayList<PageData>();

                for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                    PageData vpd = new PageData();
                    vpd.put("var1", mapEntry.getKey());
                    int count = 2;
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        BigDecimal realmon = mapEntry.getValue().get(oneclass);
                        vpd.put("var" + count++, realmon.toString());
                    }
                    vpd.put("var" + (count++), "0");
                    vpd.put("var" + (count++), "0");
//                    for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
//                        if (entry.getKey().equals(mapEntry.getKey())){
//                            vpd.put("var" + (count++), altotal.get(mapEntry.getKey()).toString());
//                        }else {
//                            vpd.put("var" + (count++), "0");
//                        }
//                    }
//                    for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
//                        if (entry.getKey().equals(mapEntry.getKey())){
//                            vpd.put("var" + (count++), nototal.get(mapEntry.getKey()).toString());
//                        }else {
//                            vpd.put("var" + (count++), "0");
//                        }
//                    }

                    vpd.put("var" + (count), stotal.get(mapEntry.getKey()).toString());
                    varList.add(vpd);
                }


                PageData vpd = new PageData();
                vpd.put("var1", "合计");
                int count = 2;
                for (PageData aClass : oneClass) {

                    String oneclass = aClass.getString("oneclass");
                    vpd.put("var" + count++, btotal.get(oneclass).toString());
                }

                vpd.put("var" + (count++), alsum.toString());
                vpd.put("var" + (count++), nosum.toString());
                vpd.put("var" + (count), sum.toString());
                varList.add(vpd);

                dataMap.put("varList", varList);
                ObjectExcelView erv = new ObjectExcelView();                    //执行excel操作
                mv = new ModelAndView(erv, dataMap);


            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

        return mv;
    }


    @RequestMapping(value = "/reimWarn.do", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject reimWarn(HttpServletResponse response) throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> sh2Warn = reimdetService.sh2Warn(pd);
        List<PageData> shWarn = reimdetService.shWarn(pd);
        List<PageData> bxWarn = reimdetService.bxWarn(pd);
        HashMap<String,String> map = new HashMap<String,String>();
        HashMap<String,String> map2 = new HashMap<String,String>();
        HashMap<String,String> map3 = new HashMap<String,String>();
        if (!sh2Warn.isEmpty()){
            for (PageData pageData : sh2Warn) {
                map.put(pageData.getString("time").substring(5,7),pageData.getString("csname"));
            }
        }
        if (!shWarn.isEmpty()){
            for (PageData pageData : shWarn) {
                map2.put(pageData.getString("time").substring(5,7),pageData.getString("csname"));
            }
        }
        if (!bxWarn.isEmpty()) {
            for (PageData pageData : bxWarn) {
                map3.put(pageData.getString("time").substring(5,7),pageData.getString("csname"));
            }
        }


        JSONObject json = new JSONObject();
        json.put("zwsh",map);
        json.put("cldb",map2);
        json.put("hqbx",map3);
        return json;
    }


    @RequestMapping(value = "/getCsname_reim.do")
    public ModelAndView getCsname_reim() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        PageData pd2 = new PageData();
        PageData pd3 = new PageData();
        pd = this.getPageData();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
//        URLDecoder urlDecoder = new URLDecoder();
//        String csname = pd.getString("csname");
//        String csname1 = csname == null ? "" : urlDecoder.decode(csname, "utf-8");
//        if (null != csname && !"".equals(csname)) {
//            pd.put("csname", csname1);
//            pd2.put("csname", csname1);
//            pd3.put("csname", csname1);
//        }else if (null == csname || "".equals(csname)){
//            pd.put("csname", "宇伦");
//            pd2.put("csname", "宇伦");
//            pd3.put("csname", "宇伦");
//        }
        String time1 = pd.getString("time1");
        if (null != time1 && !"".equals(time1)) {
            pd.put("time1", time1);
            pd2.put("time1", time1);
            pd3.put("time1", time1);
        }else if (null == time1 || "".equals(time1)){
            pd.put("time1", dateFormat.format(date)+"-01");
            pd2.put("time1", dateFormat.format(date)+"-01");
            pd3.put("time1", dateFormat.format(date)+"-01");
        }
        String time2 = pd.getString("time2");
        if (null != time2 && !"".equals(time2)) {
            pd.put("time2", time2);
            pd2.put("time2", time2);
            pd3.put("time2", time2);
        }else if (null == time2 || "".equals(time2)){
            pd.put("time2", dateFormat.format(date)+"-31");
            pd2.put("time2", dateFormat.format(date)+"-31");
            pd3.put("time2", dateFormat.format(date)+"-31");
        }
        pd.put("proce", '1');
        pd2.put("proce", '1');
        pd3.put("proce", '1');

        List<PageData> reimstat = reimdetService.getReimstat(pd);
        List<PageData> oneClass = reimdetService.getOneclass(pd);
        HashMap<String, HashMap<String, BigDecimal>> map = new HashMap();
        //填入分类名称
        for (PageData pageData : reimstat) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            map.put(pageData.getString("csname"), monmap);
        }
        System.out.println(map+"map");
        //填入中间数据
        for (PageData reimstatpd : reimstat) {
            String oneclass = reimstatpd.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(reimstatpd.get("realmon").toString());
            String csname = reimstatpd.getString("csname");
            System.out.println(oneclass+"oneclass");
            System.out.println(realmon+"realmon");
            System.out.println(csname+"csname");
            for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                if (mapEntry.getKey().equals(csname)) {
                    BigDecimal add = map.get(csname).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = map.get(csname);
                    oneclassMap.put(oneclass, add);
                    map.put(csname, oneclassMap);
                }
            }

        }
        //已报销总和
        HashMap<String, HashMap<String, BigDecimal>> hashMap2 = new HashMap<>();

        pd2.put("isreim","0");
        List<PageData> reimstat2 = reimdetService.getReimstat(pd2);
        for (PageData pageData : reimstat2) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            hashMap2.put(pageData.getString("csname"), monmap);
        }

        for (PageData pageData : reimstat2) {
            String oneclass = pageData.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
            String csname = pageData.getString("csname");
            for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap2.entrySet()) {
                if (entry.getKey().equals(csname)) {
                    BigDecimal add = hashMap2.get(csname).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = hashMap2.get(csname);
                    oneclassMap.put(oneclass, add);
                    hashMap2.put(csname, oneclassMap);
                }
            }
        }

        HashMap<String, BigDecimal> altotal = new HashMap();
        for (PageData pageData : reimstat2) {
            String csname = pageData.getString("csname");
            altotal.put(csname, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = hashMap2.get(csname);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                altotal.put(csname, Entry.getValue().add(altotal.get(csname)));
            }
        }
        BigDecimal alsum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
            alsum=alsum.add(entry.getValue());
        }

        //未报销总和
        HashMap<String, HashMap<String, BigDecimal>> hashMap3 = new HashMap<>();
        pd3.put("isreim","1");
        List<PageData> reimstat3 = reimdetService.getReimstat(pd3);
        for (PageData pageData : reimstat3) {
            HashMap<String, BigDecimal> monmap = new HashMap();
            for (PageData aClass : oneClass) {
                String oneclass = aClass.getString("oneclass");
                monmap.put(oneclass, new BigDecimal(0));
            }
            hashMap3.put(pageData.getString("csname"), monmap);
        }
        for (PageData pageData : reimstat3) {
            String oneclass = pageData.getString("oneclassname");
            BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
            String csname = pageData.getString("csname");
            for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap3.entrySet()) {
                if (entry.getKey().equals(csname)) {
                    BigDecimal add = hashMap3.get(csname).get(oneclass).add(realmon);
                    HashMap<String, BigDecimal> oneclassMap = hashMap3.get(csname);
                    oneclassMap.put(oneclass, add);
                    hashMap3.put(csname, oneclassMap);
                }
            }
        }

        HashMap<String, BigDecimal> nototal = new HashMap();
        for (PageData pageData : reimstat3) {
            String csname = pageData.getString("csname");
            nototal.put(csname, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = hashMap3.get(csname);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                nototal.put(csname, Entry.getValue().add(nototal.get(csname)));
            }
        }
        BigDecimal nosum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
            nosum=nosum.add(entry.getValue());
        }

        //根据分类求总和
        HashMap<String, BigDecimal> btotal = new HashMap();
        for (PageData aClass : oneClass) {
            String oneclass = aClass.getString("oneclass");
            btotal.put(oneclass, new BigDecimal(0));
            for (Map.Entry<String, HashMap<String, BigDecimal>> classMap : map.entrySet()) {
                btotal.put(oneclass, classMap.getValue().get(oneclass).add(btotal.get(oneclass)));
            }
        }
        //个人总和
        HashMap<String, BigDecimal> stotal = new HashMap();
        for (PageData pageData : reimstat) {
            String csname = pageData.getString("csname");
            stotal.put(csname, new BigDecimal(0));
            HashMap<String, BigDecimal> nameMap = map.get(csname);
            for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                stotal.put(csname, Entry.getValue().add(stotal.get(csname)));
            }

        }
        BigDecimal sum = new BigDecimal(0);
        for (Map.Entry<String, BigDecimal> summap : btotal.entrySet()) {

            sum = sum.add(summap.getValue());
        }




        mv.addObject("stotal", stotal);
        mv.addObject("sum", sum);
        mv.addObject("alsum", alsum);
        mv.addObject("altotal", altotal);
        mv.addObject("nosum", nosum);
        mv.addObject("nototal", nototal);
        mv.addObject("btotal", btotal);
        mv.addObject("map", map);
//        mv.addObject("getcsname", getcsname);
        mv.addObject("pd", pd);
        mv.addObject("oneClass", oneClass);
        mv.setViewName("reim/reimstat/reimstat_list2");

        return mv;
    }

    /**
     * 导出用户信息到EXCEL
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/exportCsnameReimstat.do")
    public ModelAndView exportCsnameReimstat() throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导出合同信息到EXCEL");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        PageData pd2 = new PageData();
        PageData pd3 = new PageData();
        pd = this.getPageData();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
        try {
            if (Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
                //关键词检索条件
                String time1 = pd.getString("time1");
                if (null != time1 && !"".equals(time1)) {
                    pd.put("time1", time1);
                    pd2.put("time1", time1);
                    pd3.put("time1", time1);
                }else if (null == time1 || "".equals(time1)){
                    pd.put("time1", dateFormat.format(date)+"-01");
                    pd2.put("time1", dateFormat.format(date)+"-01");
                    pd3.put("time1", dateFormat.format(date)+"-01");
                }
                String time2 = pd.getString("time2");
                if (null != time2 && !"".equals(time2)) {
                    pd.put("time2", time2);
                    pd2.put("time2", time2);
                    pd3.put("time2", time2);
                }else if (null == time2 || "".equals(time2)){
                    pd.put("time2", dateFormat.format(date)+"-31");
                    pd2.put("time2", dateFormat.format(date)+"-31");
                    pd3.put("time2", dateFormat.format(date)+"-31");
                }
                pd.put("proce", '1');
                pd2.put("proce", '1');
                pd3.put("proce", '1');

                List<PageData> reimstat = reimdetService.getReimstat(pd);
                List<PageData> oneClass = reimdetService.getOneclass(pd);
//        List<PageData> getcsname = reimdetService.getcsname(pd);
                HashMap<String, HashMap<String, BigDecimal>> map = new HashMap();
                //填入分类名称
                for (PageData pageData : reimstat) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    map.put(pageData.getString("csname"), monmap);
                }
                //填入中间数据
                for (PageData reimstatpd : reimstat) {
                    String oneclass = reimstatpd.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(reimstatpd.get("realmon").toString());
                    String csname = reimstatpd.getString("csname");

                    for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                        if (mapEntry.getKey().equals(csname)) {
                            BigDecimal add = map.get(csname).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = map.get(csname);
                            oneclassMap.put(oneclass, add);
                            map.put(csname, oneclassMap);
                        }
                    }

                }
                //已报销总和
                HashMap<String, HashMap<String, BigDecimal>> hashMap2 = new HashMap<>();

                pd2.put("isreim","0");
                List<PageData> reimstat2 = reimdetService.getReimstat(pd2);
                for (PageData pageData : reimstat2) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    hashMap2.put(pageData.getString("csname"), monmap);
                }

                for (PageData pageData : reimstat2) {
                    String oneclass = pageData.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
                    String csname = pageData.getString("csname");
                    for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap2.entrySet()) {
                        if (entry.getKey().equals(csname)) {
                            BigDecimal add = hashMap2.get(csname).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = hashMap2.get(csname);
                            oneclassMap.put(oneclass, add);
                            hashMap2.put(csname, oneclassMap);
                        }
                    }
                }

                HashMap<String, BigDecimal> altotal = new HashMap();
                for (PageData pageData : reimstat2) {
                    String csname = pageData.getString("csname");
                    altotal.put(csname, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = hashMap2.get(csname);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        altotal.put(csname, Entry.getValue().add(altotal.get(csname)));
                    }
                }
                BigDecimal alsum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
                    alsum=alsum.add(entry.getValue());
                }

                //未报销总和
                HashMap<String, HashMap<String, BigDecimal>> hashMap3 = new HashMap<>();
                pd3.put("isreim","1");
                List<PageData> reimstat3 = reimdetService.getReimstat(pd3);
                for (PageData pageData : reimstat3) {
                    HashMap<String, BigDecimal> monmap = new HashMap();
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        monmap.put(oneclass, new BigDecimal(0));
                    }
                    hashMap3.put(pageData.getString("csname"), monmap);
                }
                for (PageData pageData : reimstat3) {
                    String oneclass = pageData.getString("oneclassname");
                    BigDecimal realmon = new BigDecimal(pageData.get("realmon").toString());
                    String csname = pageData.getString("csname");
                    for (Map.Entry<String, HashMap<String, BigDecimal>> entry : hashMap3.entrySet()) {
                        if (entry.getKey().equals(csname)) {
                            BigDecimal add = hashMap3.get(csname).get(oneclass).add(realmon);
                            HashMap<String, BigDecimal> oneclassMap = hashMap3.get(csname);
                            oneclassMap.put(oneclass, add);
                            hashMap3.put(csname, oneclassMap);
                        }
                    }
                }

                HashMap<String, BigDecimal> nototal = new HashMap();
                for (PageData pageData : reimstat3) {
                    String csname = pageData.getString("csname");
                    nototal.put(csname, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = hashMap3.get(csname);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        nototal.put(csname, Entry.getValue().add(nototal.get(csname)));
                    }
                }
                BigDecimal nosum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
                    nosum=nosum.add(entry.getValue());
                }

                //根据分类求总和
                HashMap<String, BigDecimal> btotal = new HashMap();
                for (PageData aClass : oneClass) {
                    String oneclass = aClass.getString("oneclass");
                    btotal.put(oneclass, new BigDecimal(0));
                    for (Map.Entry<String, HashMap<String, BigDecimal>> classMap : map.entrySet()) {
                        btotal.put(oneclass, classMap.getValue().get(oneclass).add(btotal.get(oneclass)));
                    }
                }
                //个人总和
                HashMap<String, BigDecimal> stotal = new HashMap();
                for (PageData pageData : reimstat) {
                    String csname = pageData.getString("csname");
                    stotal.put(csname, new BigDecimal(0));
                    HashMap<String, BigDecimal> nameMap = map.get(csname);
                    for (Map.Entry<String, BigDecimal> Entry : nameMap.entrySet()) {
                        stotal.put(csname, Entry.getValue().add(stotal.get(csname)));
                    }

                }
                BigDecimal sum = new BigDecimal(0);
                for (Map.Entry<String, BigDecimal> summap : btotal.entrySet()) {

                    sum = sum.add(summap.getValue());
                }


                Map<String, Object> dataMap = new HashMap<String, Object>();
                List<String> titles = new ArrayList<String>();
                titles.add("姓名");        //1
                for (PageData aClass : oneClass) {
                    titles.add(aClass.getString("oneclass"));
                }

                titles.add("已报销");
                titles.add("未报销");
                titles.add("小计");
                dataMap.put("titles", titles);


                List<PageData> varList = new ArrayList<PageData>();

                for (Map.Entry<String, HashMap<String, BigDecimal>> mapEntry : map.entrySet()) {
                    PageData vpd = new PageData();
                    vpd.put("var1", mapEntry.getKey());
                    int count = 2;
                    for (PageData aClass : oneClass) {
                        String oneclass = aClass.getString("oneclass");
                        BigDecimal realmon = mapEntry.getValue().get(oneclass);
                        vpd.put("var" + count++, realmon.toString());
                    }
                    vpd.put("var" + (count++), "0");
                    vpd.put("var" + (count++), "0");
//                    for (Map.Entry<String, BigDecimal> entry : altotal.entrySet()) {
//                        if (entry.getKey().equals(mapEntry.getKey())){
//                            vpd.put("var" + (count++), altotal.get(mapEntry.getKey()).toString());
//                        }else {
//                            vpd.put("var" + (count++), "0");
//                        }
//                    }
//                    for (Map.Entry<String, BigDecimal> entry : nototal.entrySet()) {
//                        if (entry.getKey().equals(mapEntry.getKey())){
//                            vpd.put("var" + (count++), nototal.get(mapEntry.getKey()).toString());
//                        }else {
//                            vpd.put("var" + (count++), "0");
//                        }
//                    }

                    vpd.put("var" + (count), stotal.get(mapEntry.getKey()).toString());
                    varList.add(vpd);
                }


                PageData vpd = new PageData();
                vpd.put("var1", "合计");
                int count = 2;
                for (PageData aClass : oneClass) {

                    String oneclass = aClass.getString("oneclass");
                    vpd.put("var" + count++, btotal.get(oneclass).toString());
                }

                vpd.put("var" + (count++), alsum.toString());
                vpd.put("var" + (count++), nosum.toString());
                vpd.put("var" + (count), sum.toString());
                varList.add(vpd);

                dataMap.put("varList", varList);
                ObjectExcelView erv = new ObjectExcelView();                    //执行excel操作
                mv = new ModelAndView(erv, dataMap);


            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

        return mv;
    }

    @RequestMapping(value = "/updateIsreim.do")
    @ResponseBody
    public ModelAndView updateIsreim() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();

        String isreim = pd.getString("isreim");
        String checkboxArray = pd.getString("checkboxArray");
        String[] split = checkboxArray.split(",");
        for (String s : split) {
            PageData pageData = new PageData();
            pageData.put("isreim",isreim);
            pageData.put("reimdetid",s);
            reimdetService.updateIsreim(pageData);
        }
        mv.addObject("msg", "success");
        return mv;
    }

    @RequestMapping(value = "/changefourclass.do", method = RequestMethod.POST)
    @ResponseBody
    public List<PageData> changefourclass() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        List<PageData> changefourclass = reimdetService.getclassname(pd);
        return changefourclass;
    }

    public void sendText(String content, String Touser) {
        //1.创建文本消息对象
        TextMessage message = new TextMessage();
        //1.1非必需
        message.setTouser(Touser);  //不区分大小写
        //1.2必需
        message.setMsgtype("text");
        message.setAgentid(WeiXinParamesUtil.agentId);

        Text text = new Text();
        text.setContent(content);
        message.setText(text);

        //2.获取access_token:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accessToken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:" + accessToken);

        //3.发送消息：调用业务类，发送消息
        SendMessageService sms = new SendMessageService();
        sms.sendMessage(accessToken, message);
    }

    public void sendTextCard(String title, String description, String url, String Touser) {

        //1.创建文本卡片消息对象
        TextcardMessage message = new TextcardMessage();
        //1.1非必需
        message.setTouser(Touser);  //不区分大小写
//                message.setTouser(senduserid);  //不区分大小写
        //message.setToparty("1");
        //message.setTotag(totag);
        //message.setSafe(0);

        //1.2必需
        message.setMsgtype("textcard");
        message.setAgentid(WeiXinParamesUtil.agentId);

        Textcard textcard = new Textcard();
        textcard.setTitle(title);
        textcard.setDescription(description);
        textcard.setUrl(url);
        message.setTextcard(textcard);

        //2.获取access_token:根据企业id和通讯录密钥获取access_token,并拼接请求url
        refreshToken refreshToken = new refreshToken();
        String accessToken = refreshToken.IsExistAccess_Token();
        System.out.println("accessToken:" + accessToken);

        //3.发送消息：调用业务类，发送消息
        SendMessageService sms = new SendMessageService();
        sms.sendMessage(accessToken, message);
    }

    public String getTime() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(date);
    }


}
