package com.fh.controller.finance.purchase;

import com.fh.controller.base.BaseController;
import com.fh.pojo.tbbusimon;
import com.fh.pojo.tbcontmon;
import com.fh.pojo.tbcontract;
import com.fh.pojo.tbinvmon;
import com.fh.service.finance.reim.ReimdetService;
import com.fh.service.finance.sell.DownUpLoadService;
import com.fh.service.finance.sell.SellService;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/purchase")
public class PurchaseController extends BaseController{
    @Resource
    private SellService sellService;
    @Resource(name = "fhlogService")
    private FHlogManager FHLOG;
    @Resource(name = "reimdetServiceImpl")
    private ReimdetService reimdetService;

    @Resource
    private DownUpLoadService fileOperateService;
    String redirect="redirect:/purchase/findContract.do";


    @RequestMapping(value = "/findContract.do")
    public ModelAndView findContract() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        URLDecoder urlDecoder = new URLDecoder();
        String keywords = pd.getString("keywords");				//关键词检索条件
        String keywords1 = keywords == null ? "" : urlDecoder.decode(keywords, "utf-8");

        if(null != keywords && !"".equals(keywords)){
            pd.put("keywords", keywords1.trim());
        }
        String clino1 = pd.getString("clino1");
        if(null != clino1 && !"".equals(clino1)){
            pd.put("clino", clino1);
//            System.out.println("执行了");
        }

        String cno1 = pd.getString("cno1");
        if(null != cno1 && !"".equals(cno1)){
            pd.put("cno", cno1);
//            System.out.println("执行了"+cno1);
        }
        String signtime1 = pd.getString("signtime1");
        if(null != signtime1 && !"".equals(signtime1)){
            pd.put("signtime1", signtime1);
//            System.out.println("执行了"+signtime1);
        }
        String signtime2 = pd.getString("signtime2");
        if(null != signtime2 && !"".equals(signtime2)){
            pd.put("signtime2", signtime2);
//            System.out.println("执行了"+signtime2);
        }
        String connmon = pd.getString("connmon");
        if(null != connmon && !"".equals(connmon)){
            pd.put("connmon", connmon);
//            System.out.println("执行了"+connmon);
        }
        String invnmon = pd.getString("invnmon");
        if(null != invnmon && !"".equals(invnmon)){
            pd.put("invnmon", invnmon);
        }
        String state = pd.getString("state");
        if (null != state && !"".equals(state)) {
            pd.put("state", state);
        }
        String isarc = pd.getString("isarc");
        if (null != isarc && !"".equals(isarc)) {
            pd.put("isarc", isarc);
        }
        String isaudit = pd.getString("isaudit");
        if (null != isaudit && !"".equals(isaudit)) {
            pd.put("isaudit", isaudit);
        }
        List<PageData> clist = sellService.findPurContract(pd);
        List<PageData> clino = sellService.getSupno(pd);
        List<PageData> cno = sellService.getCno(pd);
        pd.put("username",Jurisdiction.getUsername());
        PageData user = reimdetService.getUser(pd);
        mv.addObject("user", user);
        mv.addObject("clist",clist);
        mv.addObject("clino",clino);
        mv.addObject("cno",cno);
        mv.addObject("pd",pd);
        mv.addObject("QX", Jurisdiction.getHC());
        mv.setViewName("finance/purchase/purchase_list");
        return mv;
    }

    @RequestMapping(value = "/findContractById.do")
    public ModelAndView findContractById() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        tbcontract sign = sellService.findContractById(pd);
        List<PageData> cno = sellService.getCno(pd);
        List<PageData> pno = sellService.getPno(pd);
//        List<PageData> clino = sellService.getClino(pd);
        List<PageData> clino = sellService.getSupno(pd);
        tbcontmon lastContmon = sellService.lastContmon(pd);
        tbinvmon lastInvmon = sellService.lastInvmon(pd);
        tbbusimon lastBusimon = sellService.lastBusimon(pd);
        pd.put("username", Jurisdiction.getUsername());
        PageData user = reimdetService.getUser(pd);
        mv.addObject("user", user);
        mv.addObject("cno",cno);
        mv.addObject("pno",pno);
        mv.addObject("clino",clino);
        mv.addObject("sign",sign);
        mv.addObject("lastContmon",lastContmon);
        mv.addObject("lastInvmon",lastInvmon);
        mv.addObject("lastBusimon",lastBusimon);
        mv.addObject("msg", "updateContractById");
        mv.setViewName("finance/purchase/purchase_edit");
        return mv;
    }


    @RequestMapping(value = "/goAddC.do")
    public ModelAndView goAddC() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> cno = sellService.getCno(pd);
        List<PageData> pno = sellService.getPno(pd);
        List<PageData> clino = sellService.getSupno(pd);
        PageData maxConid = sellService.maxConid(pd);
        if (maxConid==null){
            mv.addObject("maxConid",0);
        }else {
            mv.addObject("maxConid",maxConid.get("max(conid)"));
        }
        pd.put("username", Jurisdiction.getUsername());
        PageData user = reimdetService.getUser(pd);
        mv.addObject("user", user);
        mv.addObject("cno",cno);
        mv.addObject("pno",pno);
        mv.addObject("clino",clino);
        mv.setViewName("finance/purchase/purchase_edit");
        mv.addObject("msg", "insertContract");
        return mv;
    }
    /**
     * 1.1 修改合同总金额能正常更新已回款未回款等金额
     *
     *
     * */
    @RequestMapping(value = "/updateContractById.do")
    public String updateContractById(tbcontract tbcontract) throws Exception {
        PageData pd = getPageData();
        pd.put("conid",tbcontract.getConid());

        tbbusimon tbbusimon = sellService.lastBusimon(pd);
        if (tbbusimon!=null){
            tbbusimon.setBusinmon(tbcontract.getBusismon().subtract(tbbusimon.getBusiamon()));
            sellService.updateBusimonById(tbbusimon);
        }

        tbcontmon tbcontmon = sellService.lastContmon(pd);
        if (tbcontmon!=null){
            tbcontmon.setConnmon(tbcontract.getConsmon().subtract(tbcontmon.getConamon()));
            sellService.updateContmonById(tbcontmon);
        }

        tbinvmon tbinvmon = sellService.lastInvmon(pd);
        if (tbinvmon!=null){
            tbinvmon.setInvnmon(tbcontract.getConsmon().subtract(tbinvmon.getInvamon()));
            sellService.updateInvmonById(tbinvmon);
        }

        sellService.updateContractById(tbcontract);
        return redirect;
    }

    @RequestMapping(value = "/goload.do")
    public ModelAndView goload() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("finance/purchase/purchase_export");
        return mv;
    }

    @RequestMapping(value = "/findContmon.do")
    public ModelAndView findContmon() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<tbcontmon> clist = sellService.findContmon(pd);
        mv.setViewName("finance/purchase/purchase_editc");
        mv.addObject("clist",clist);
        mv.addObject("pd",pd);
        return mv;
    }

    @RequestMapping(value = "/findInvmon.do")
    public ModelAndView findInvmon() throws Exception {
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<tbinvmon> ilist = sellService.findInvmon(pd);
        mv.setViewName("finance/purchase/purchase_editi");
        mv.addObject("ilist",ilist);
        mv.addObject("pd",pd);
        return mv;
    }

    @RequestMapping(value = "/findBusimon.do")
    public ModelAndView findBusimon() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<tbbusimon> blist = sellService.findBusimon(pd);
        mv.setViewName("finance/purchase/purchase_editb");
        mv.addObject("blist",blist);
        mv.addObject("pd",pd);
        return mv;
    }
    @RequestMapping(value = "/deleteContract.do")
    @ResponseBody
    public String deleteContract() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        sellService.deleteContract(pd);
        return "success";
    }
    @RequestMapping(value = "/deleteContmon.do")
    @ResponseBody
    public String deleteContmon() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
//        System.out.println(pd+"++++++++++++++");
        sellService.deleteContmon(pd);
        return "success";
    }
    @RequestMapping(value = "/deleteInvmon.do")
    @ResponseBody
    public String deleteInvmon() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        sellService.deleteInvmon(pd);
        return "success";
    }
    @RequestMapping(value = "/deleteBusimon.do")
    @ResponseBody
    public String deleteBusimon() throws Exception {
        PageData pd = new PageData();
        pd = this.getPageData();
        sellService.deleteBusimon(pd);
        return redirect;
    }
    @RequestMapping(value = "/insertContract.do")
    public String insertContract(tbcontract contract) throws Exception {
        System.out.println(contract);
        sellService.insertContract(contract);
        return redirect;
    }
    @RequestMapping(value = "/insertContmon.do", method= RequestMethod.POST)
    @ResponseBody
    public String insertContmon(tbcontmon tbcontmon) throws Exception {
        System.out.println(tbcontmon);
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        tbcontmon last = sellService.lastContmon(pd);
        if (last != null){
            tbcontract consmon = sellService.findContractById(pd);
            //本次已回款金额=上次已回款金额+本次付款金额
            BigDecimal conamon = last.getConamon().add(tbcontmon.getPaymon());
            tbcontmon.setConamon(conamon);

            //本次未回款金额=总金额-本次已回款金额
            BigDecimal connmon = consmon.getConsmon().subtract(tbcontmon.getConamon());
            tbcontmon.setConnmon(connmon);

            tbcontmon.setUsername(Jurisdiction.getUsername());
            tbcontmon.setCztime(getTime());

            sellService.insertContmon(tbcontmon);
        }else if (last == null){
            tbcontmon.setConamon(tbcontmon.getPaymon());
            tbcontract consmon = sellService.findContractById(pd);
            BigDecimal connmon = consmon.getConsmon().subtract(tbcontmon.getPaymon());
            tbcontmon.setConnmon(connmon);

            tbcontmon.setUsername(Jurisdiction.getUsername());
            tbcontmon.setCztime(getTime());
            sellService.insertContmon(tbcontmon);
        }
        return "success";
    }
    @RequestMapping(value = "/insertInvmon.do", method= RequestMethod.POST)
    @ResponseBody
    public String insertInvmon(tbinvmon invmon) throws Exception {
        System.out.println(invmon);
        PageData pd = new PageData();
        pd = this.getPageData();
        System.out.println(pd);
        tbinvmon last = sellService.lastInvmon(pd);
        if (last !=null){
            tbcontract consmon = sellService.findContractById(pd);
            //  本次开票金额=上次开票金额+本次金额
            BigDecimal invamon = last.getInvamon().add(invmon.getPaymon());
            invmon.setInvamon(invamon);

            //   未开票金额=总开票金额-本次开票金额

            BigDecimal invnmon = consmon.getConsmon().subtract(invmon.getInvamon());
            invmon.setInvnmon(invnmon);

            invmon.setUsername(Jurisdiction.getUsername());
            invmon.setCztime(getTime());
            sellService.insertInvmon(invmon);
        }else if (last == null){
            invmon.setInvamon(invmon.getPaymon());
            tbcontract consmon = sellService.findContractById(pd);
            BigDecimal invnmon = consmon.getConsmon().subtract(invmon.getPaymon());
            invmon.setInvnmon(invnmon);

            invmon.setUsername(Jurisdiction.getUsername());
            invmon.setCztime(getTime());
            sellService.insertInvmon(invmon);
        }
        return "success";
    }
    @RequestMapping(value = "/insertBusimon.do", method= RequestMethod.POST)
    @ResponseBody
    public String insertBusimon(tbbusimon busimon) throws Exception {
//        System.out.println(busimon);
        PageData pd = new PageData();
        pd = this.getPageData();
//        System.out.println(pd);
        tbbusimon last = sellService.lastBusimon(pd);
        if (last !=null){
            tbcontract busismon = sellService.findContractById(pd);
            //  本次已支付的商务金额=上次已支付的商务金额+本次支付金额
            BigDecimal busiamon = last.getBusiamon().add(busimon.getPaymon());
            busimon.setBusiamon(busiamon);


            //   未支付的商务金额=总商务金额-本次已支付的商务金额
            BigDecimal businmon = busismon.getBusismon().subtract(busimon.getBusiamon());
            busimon.setBusinmon(businmon);



            busimon.setUsername(Jurisdiction.getUsername());
            busimon.setCztime(getTime());
            sellService.insertBusimon(busimon);
        }else if (last == null){
            busimon.setBusiamon(busimon.getPaymon());
            tbcontract busismon = sellService.findContractById(pd);
            BigDecimal businmon = busismon.getBusismon().subtract(busimon.getPaymon());
            busimon.setBusinmon(businmon);

            busimon.setUsername(Jurisdiction.getUsername());
            busimon.setCztime(getTime());
            sellService.insertBusimon(busimon);
        }
        return "success";
    }

    public String getTime(){
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return dateFormat.format(date);
    }
    @RequestMapping(value = "/isContmon.do")
    @ResponseBody
    public Object isContmon(BigDecimal paymon){
//        System.out.println(paymon);
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            tbcontract consmon = sellService.findContractById(pd);
            List<tbcontmon> contmon = sellService.findContmon(pd);
            BigDecimal sum=BigDecimal.ZERO;
            for (tbcontmon tbcontmon : contmon) {
                sum=sum.add(tbcontmon.getPaymon());
            }
            int i = sum.add(paymon).compareTo(consmon.getConsmon());
            if (i==1) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }
    @RequestMapping(value = "/isInvmon.do")
    @ResponseBody
    public Object isInvmon(BigDecimal paymon){
//        System.out.println(paymon);
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            tbcontract consmon = sellService.findContractById(pd);
            List<tbinvmon> invmon = sellService.findInvmon(pd);
            BigDecimal sum=BigDecimal.ZERO;
            for (tbinvmon tbinvmon : invmon) {
                sum=sum.add(tbinvmon.getPaymon());
            }

            int i = sum.add(paymon).compareTo(consmon.getConsmon());
            if (i==1) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }
    @RequestMapping(value = "/isBusimon.do")
    @ResponseBody
    public Object isBusimon(BigDecimal paymon){
//        System.out.println(paymon);
        Map<String, String> map = new HashMap<String, String>();
        String errInfo = "success";
        PageData pd = new PageData();
        try {
            pd = this.getPageData();
            tbcontract consmon = sellService.findContractById(pd);
            List<tbbusimon> busimon = sellService.findBusimon(pd);
            BigDecimal sum=BigDecimal.ZERO;
            for (tbbusimon tbbusimon : busimon) {
                sum=sum.add(tbbusimon.getPaymon());
            }

            int i = sum.add(paymon).compareTo(consmon.getBusismon());
            if (i==1) {
                errInfo = "error";
            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        map.put("result", errInfo);                //返回结果
        return AppUtil.returnObject(new PageData(), map);
    }

    @RequestMapping(value = "/comboConno.do")
    @ResponseBody
    public String comboConno(){

//        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        PageData pd2 = new PageData();

        System.out.println(pd);
        try {
            List<PageData> purContract = sellService.findPurContract(pd2);
            System.out.println(purContract);
            List nolist = new ArrayList();
            if (!purContract.isEmpty()){

            for (PageData pageData : purContract) {

                String cno = pageData.getString("cno");
                String pno = pageData.getString("pno");
                String type = pageData.getString("type");
                String signtime = pageData.getString("signtime").substring(0,3);
                String conno = pageData.getString("conno");
                pd = this.getPageData();

                String cno1 = pd.getString("cno");
                String pno1 = pd.getString("pno");
                String type1 = pd.getString("type");
                String signtime1 = pd.getString("signtime").substring(0,3);


                boolean iscno = cno.equals(cno1);
                boolean ispno = pno.equals(pno1);
                boolean istype = type.equals(type1);
                boolean issigntime = signtime.equals(signtime1);

                if (iscno&&ispno&&istype&&issigntime){
                    String[] split = conno.split("-");
                    int i = Integer.parseInt(split[split.length - 1]);
                    nolist.add(i);
                }
            }
            }
            System.out.println(nolist);
            if (!nolist.isEmpty()){
                int i = Integer.parseInt(nolist.get(nolist.size() - 1).toString()) + 1;
                System.out.println(i);
                return i+"";
            }else {
                return "1";
            }


        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return "";


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
        PageData pd1 = new PageData();
        PageData pd2 = new PageData();
        PageData pd3 = new PageData();
        PageData pd4 = new PageData();
//        if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;                                //文件上传路径
            String fileName = FileUpload.fileUp(file, filePath, "sellexcel");                            //执行上传
            List<PageData> listPd = (List) ObjectExcelRead.readExcel(filePath, fileName, 3, 0, 0);        //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
            /*存入数据库操作======================================*/
            /**

             */
            for (int i = 0; i < listPd.size(); i++) {
                pd1.put("signtime", listPd.get(i).getString("var0"));
                pd1.put("type", listPd.get(i).getString("var1"));
//                //销售甲方
//                List<PageData> cno = sellService.getCno(pd);
//                for (PageData pageData : cno) {
//                    boolean iscno = pageData.getString("csname").equals(listPd.get(i).getString("var2"));
//                    if (iscno) {
//                        pd1.put("cno", pageData.getString("cno"));
//                    }
//                }
                //采购甲方
                List<PageData> supno = sellService.getSupno(pd);
                for (PageData pageData : supno) {
                    boolean issupno = pageData.getString("supno").equals(listPd.get(i).getString("var2"));
                    if (issupno){
                        pd1.put("cno",pageData.getString("supno"));
                    }
                }
//                //销售乙方
//                List<PageData> clino = sellService.getClino(pd);
//                for (PageData pageData : clino) {
//                    boolean isclino = pageData.getString("clisname").equals(listPd.get(i).getString("var3"));
//                    if (isclino) {
//                        pd1.put("clino", pageData.getString("clino"));
//                    }
//                }
                //采购乙方
                List<PageData> cno = sellService.getCno(pd);
                for (PageData pageData : cno) {
                    boolean iscno = pageData.getString("csname").equals(listPd.get(i).getString("var3"));
                    if (iscno){
                        pd1.put("clino",pageData.getString("cno"));
                    }
                }
                //项目编号
                List<PageData> pno = sellService.getPno(pd);
                for (PageData pageData : pno) {
                    boolean ispno = pageData.getString("pdesc").equals(listPd.get(i).getString("var4"));
                    System.out.println(ispno);
                    if (ispno) {
                        pd1.put("pno", pageData.getString("pno"));
                    }
                }
                if ("是".equals(listPd.get(i).getString("var5"))) {
                    pd1.put("asign", "0");
                } else if ("否".equals(listPd.get(i).getString("var5"))) {
                    pd1.put("asign", "1");
                }
                if ("是".equals(listPd.get(i).getString("var6"))) {
                    pd1.put("bsign", "0");
                } else if ("否".equals(listPd.get(i).getString("var6"))) {
                    pd1.put("bsign", "1");
                }
                pd1.put("purno", listPd.get(i).getString("var7"));
                if ("是".equals(listPd.get(i).getString("var8"))) {
                    pd1.put("isarc", "0");
                } else if ("否".equals(listPd.get(i).getString("var8"))) {
                    pd1.put("isarc", "1");
                }

                pd1.put("consmon", listPd.get(i).getString("var9"));
                pd1.put("busismon", listPd.get(i).getString("var20"));
                pd1.put("busiexp", listPd.get(i).getString("var18"));
                pd1.put("paymet", listPd.get(i).getString("var25"));
                pd1.put("conno", listPd.get(i).getString("var26"));
                pd1.put("state", "0");
                if ("是".equals(listPd.get(i).getString("var27"))) {
                    pd1.put("isarc", "0");
                } else if ("否".equals(listPd.get(i).getString("var27"))) {
                    pd1.put("isarc", "1");
                }
                pd1.put("place", listPd.get(i).getString("var28"));
                sellService.insertContract(pd1);

                PageData pageData = sellService.maxConid(pd);
                String conid = pageData.get("conid") + "";

                pd2.put("conid", conid);
                pd2.put("paytime", listPd.get(i).getString("var12"));
                pd2.put("paymon", listPd.get(i).getString("var10"));
                pd2.put("conamon", listPd.get(i).getString("var10"));

                pd2.put("connmon", listPd.get(i).getString("var11"));
                pd2.put("cztime", getTime());
                String username = Jurisdiction.getUsername();
                pd2.put("username", username);
                sellService.insertContmon(pd2);

                pd3.put("conid", conid);
                pd3.put("invtime", listPd.get(i).getString("var13"));
                pd3.put("paymon", listPd.get(i).getString("var14"));
                pd3.put("invcontent", listPd.get(i).getString("var16"));
                pd3.put("tax", listPd.get(i).getString("var17"));
                pd3.put("invamon", listPd.get(i).getString("var14"));
                pd3.put("invnmon", listPd.get(i).getString("var15"));
                pd3.put("cztime", getTime());
                pd3.put("username", username);
                sellService.insertInvmon(pd3);

                pd4.put("conid", conid);
                pd4.put("busitime", listPd.get(i).getString("var19"));
                pd4.put("paymon", listPd.get(i).getString("var21"));
                pd4.put("busiamon", listPd.get(i).getString("var21"));
                pd4.put("businmon", listPd.get(i).getString("var22"));
                pd4.put("payee", listPd.get(i).getString("var19"));
                pd4.put("remark", listPd.get(i).getString("var20"));
                pd4.put("cztime", getTime());
                pd4.put("username", username);
                sellService.insertBusimon(pd4);

            }
            /*存入数据库操作======================================*/
            mv.addObject("msg", "success");
        }
        mv.setViewName("redirect:/purchase/findContract.do");
        return mv;
    }


    /**
     * 导出用户信息到EXCEL
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/excel")
    public ModelAndView exportExcel() throws Exception {
        FHLOG.save(Jurisdiction.getUsername(), "导出合同信息到EXCEL");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
//            if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
            //关键词检索条件
            String clino1 = pd.getString("clino1");
            if (null != clino1 && !"".equals(clino1)) {
                pd.put("clino", clino1);
            }

            String cno1 = pd.getString("cno1");
            if (null != cno1 && !"".equals(cno1)) {
                pd.put("cno", cno1);
            }
            String signtime1 = pd.getString("signtime1");
            if (null != signtime1 && !"".equals(signtime1)) {
                pd.put("signtime1", signtime1);
            }
            String signtime2 = pd.getString("signtime2");
            if (null != signtime2 && !"".equals(signtime2)) {
                pd.put("signtime2", signtime2);
            }
            String connmon = pd.getString("connmon");
            if (null != connmon && !"".equals(connmon)) {
                pd.put("connmon", connmon);
            }
            String invnmon = pd.getString("invnmon");
            if (null != invnmon && !"".equals(invnmon)) {
                pd.put("invnmon", invnmon);
            }
            String state = pd.getString("state");
            if (null != state && !"".equals(state)) {
                pd.put("state", state);
            }
            String isarc1 = pd.getString("isarc");
            if (null != isarc1 && !"".equals(isarc1)) {
                pd.put("isarc", isarc1);
            }
            String isaudit = pd.getString("isaudit");
            if (null != isaudit && !"".equals(isaudit)) {
                pd.put("isaudit", isaudit);
            }
            Map<String, Object> dataMap = new HashMap<String, Object>();
            List<String> titles = new ArrayList<String>();
            titles.add("签订年月");        //1
            titles.add("合同类型");        //2
            titles.add("甲方-客户/公司名称");            //3
            titles.add("乙方-供应商/公司名称");            //4
            titles.add("项目/产品类型");            //5
            titles.add("甲方签章");            //6
            titles.add("乙方签章");        //7
            titles.add("采购/销售合同编号");

            titles.add("归档情况");
            titles.add("合同总金额");
            titles.add("已付款/回款金额");
            titles.add("未付款/回款金额");
            titles.add("已付款/回款时间");
            titles.add("开票/收票时间");
            titles.add("开票/收票金额");//15
            titles.add("未开票/未收票金额");
            titles.add("开票/收票内容");
            titles.add("税率");
            titles.add("商务费用说明");
            titles.add("付款时间");//22
            titles.add("总金额");
            titles.add("付款金额");
            titles.add("未付款金额");
            titles.add("收款人");
            titles.add("备注");
            titles.add("合同付款方式");
            titles.add("合同编号");
            dataMap.put("titles", titles);

            List<PageData> PurList = sellService.findPurContract(pd);
//            System.out.println(sellList);
            PageData conidpd = new PageData();
            List<PageData> varList = new ArrayList<PageData>();
            for (int i = 0; i < PurList.size(); i++) {
                PageData vpd = new PageData();
                vpd.put("var1", PurList.get(i).getString("signtime"));        //1
                vpd.put("var2", PurList.get(i).getString("type"));
                List<PageData> cno = sellService.getCno(pd);
                for (PageData pageData : cno) {
                    boolean iscno = pageData.getString("cno").equals(PurList.get(i).getString("cno"));

                    if (iscno) {
                        vpd.put("var4", pageData.getString("csname"));
                    }
                }
                List<PageData> clino = sellService.getSupno(pd);
                for (PageData pageData : clino) {
                    boolean equals = pageData.getString("supno").equals(PurList.get(i).getString("clino"));

                    if (equals) {
                        vpd.put("var3", pageData.getString("supsname"));
                    }
                }


                List<PageData> pno = sellService.getPno(pd);
                for (PageData pageData : pno) {
                    boolean ispno = pageData.getString("pno").equals(PurList.get(i).getString("pno"));

                    if (ispno) {
                        vpd.put("var5", pageData.getString("pdesc"));
                    }
                }
                String asign = PurList.get(i).getString("asign");
                if ("0".equals(asign)) {
                    vpd.put("var6", "是");
                } else if ("1".equals(asign)) {
                    vpd.put("var6", "否");
                }
                String bsign = PurList.get(i).getString("bsign");
                if ("0".equals(bsign)) {
                    vpd.put("var7", "是");
                } else if ("1".equals(bsign)) {
                    vpd.put("var7", "否");
                }

                vpd.put("var8", PurList.get(i).getString("purno"));
                String isarc = PurList.get(i).getString("isarc");
                if ("0".equals(isarc)) {
                    vpd.put("var9", "是");
                } else if ("1".equals(isarc)) {
                    vpd.put("var9", "否");
                }
                String consmon = PurList.get(i).get("consmon").toString();
                if (null==consmon || "".equals(consmon)){
                    vpd.put("var10", "0");
                }
                vpd.put("var10", consmon);
                String busismon = PurList.get(i).get("busismon").toString();
                if (null==busismon || "".equals(busismon)){
                    vpd.put("var21", "0");//!
                }
                vpd.put("var21", busismon);//!
                vpd.put("var19", PurList.get(i).getString("busiexp"));//!
                vpd.put("var26", PurList.get(i).getString("paymet") + "");
                vpd.put("var27", PurList.get(i).getString("conno"));
                Long conid = (Long) PurList.get(i).get("conid");
                conidpd.put("conid", conid);

                tbcontmon tbcontmon = sellService.lastContmon(conidpd);
                if (tbcontmon != null) {
                    vpd.put("var11", tbcontmon.getConamon() + "");
                    vpd.put("var12", tbcontmon.getConnmon() + "");
                    vpd.put("var13", tbcontmon.getPaytime());
                }else {
                    vpd.put("var11", "0");
                    vpd.put("var12", "0");
                }
                tbinvmon tbinvmon = sellService.lastInvmon(conidpd);
                if (tbinvmon != null) {
                    vpd.put("var14", tbinvmon.getInvtime() + "");
                    vpd.put("var15", tbinvmon.getInvamon() + "");
                    vpd.put("var16", tbinvmon.getInvnmon() + "");
                    vpd.put("var17", tbinvmon.getInvcontent());
                    vpd.put("var18", tbinvmon.getTax());
                }else {
                    vpd.put("var15","0");
                    vpd.put("var16","0");
                }
                tbbusimon tbbusimon = sellService.lastBusimon(conidpd);
                if (tbbusimon != null) {
                    vpd.put("var20", tbbusimon.getBusitime());
                    vpd.put("var22", tbbusimon.getBusiamon() + "");

                    vpd.put("var23", tbbusimon.getBusinmon() + "");
                    vpd.put("var24", tbbusimon.getPayee());
                    vpd.put("var25", tbbusimon.getRemark());
                }else {
                    vpd.put("var22", "0");

                    vpd.put("var23", "0");
                }
                varList.add(vpd);
                System.out.println(vpd + "vpd");
            }
            dataMap.put("varList", varList);
            ObjectExcelView erv = new ObjectExcelView();                    //执行excel操作
            mv = new ModelAndView(erv, dataMap);
//            System.out.println(varList+"varList");


//            }
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
//        mv.setViewName("redirect:/sell/findContract.do");
        return mv;
    }
}


