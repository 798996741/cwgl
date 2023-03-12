package com.fh.controller.finance.purchase;

import com.fh.controller.base.BaseController;
import com.fh.service.finance.sell.DownUpLoadService;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/pfile")
public class PurchaseFileUploadController extends BaseController {

    @Resource
    private DownUpLoadService fileOperateService;

    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam("files") MultipartFile[] files, MultipartHttpServletRequest request) throws Exception, IOException {
        //获取文件夹的名字
        List<String[]> filess = new ArrayList<String[]>();
        String path = request.getSession().getServletContext().getRealPath("/uploadFiles/sell");

        StringBuffer stringbuffer = new StringBuffer();
        //对传进来的文件数组，进行 循环复制
        for (MultipartFile multipartFile : files) {
            //判断文件是否为空
            if (!multipartFile.isEmpty()) {
                //将多个文件名拼接在一个字符串中，用;分隔
                stringbuffer.append(multipartFile.getOriginalFilename());
                stringbuffer.append(";");
                File dir = new File(path, multipartFile.getOriginalFilename());
                //将文件名和对应的路径存放在数组中
                String[] files1 = {multipartFile.getOriginalFilename(), dir.toPath().toString()};
                //将一个文件的标识信息存入集合中
                filess.add(files1);
                //System.out.println(dir.toPath());
                //文件不存则在创建
                if (!dir.exists() && !dir.isDirectory()) {
                    dir.mkdirs();
                }
                //文件进行复制
                multipartFile.transferTo(dir);
            }
        }
        String s = stringbuffer.substring(0, stringbuffer.length() - 1);
        //将文件信息集合存入数据库中
        PageData pd = new PageData();
        pd = this.getPageData();
        URLDecoder urlDecoder = new URLDecoder();
        String remark = pd.getString("remark");
        String  remark1 = remark==null?"":urlDecoder.decode(remark,"utf-8");
        pd.put("remark",remark1);
        System.out.println(pd);
        for (String[] strings : filess) {
            for (int i = 0; i < strings.length; i++) {
                pd.put("fname", strings[0]);
                pd.put("furl", strings[1]);
                pd.put("times", System.currentTimeMillis());
            }
            fileOperateService.insertfile(pd);
        }
        //跳转到调用文件显示的界面redirect:/sell/findContract.do
        return "redirect:/purchase/findContract.do";
    }
    @RequestMapping(value = "/deleteFile.do", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView deleteFile() throws Exception {
//        String path = request.getSession().getServletContext().getRealPath("/uploadFiles/sell");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
//        File file = new File(path,pd.getString("fname"));
//        if (file.exists()){
//            System.out.println(pd.getString("fname"));
//            file.delete();
//        }
        fileOperateService.deleteFile(pd);
        mv.addObject("msg", "success");
        return mv;
    }
    @RequestMapping(value = "/getFile.do")
    public ModelAndView getFile() throws Exception {

        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        List<PageData> getfile = fileOperateService.getfile(pd);
        for (PageData pageData : getfile) {
            System.out.println(pageData);
        }
        mv.addObject("pd", pd);
        mv.addObject("getfile", getfile);
        mv.setViewName("finance/purchase/purchase_down_upload");

        return mv;
    }

    @RequestMapping("/download.do")

    public void Down(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String times = request.getParameter("times");
        PageData pd = new PageData();
        pd.put("times",times);
        PageData times1 = fileOperateService.getTimes(pd);
        String fileName = times1.getString("fname");
        System.out.println("执行了------------");
        if (fileName != null) {
            String realPath = request.getSession().getServletContext().getRealPath("/uploadFiles/sell");//tomcat的WebRoot下的路径
            File file = new File(realPath, fileName);
            if (file.exists()) {
                response.setContentType("multipart/form-data;application/octet-stream;charset=utf-8");// 设置强制下载不打开
                fileName = fileName.replaceAll("\\+", "%20");
                response.addHeader("Content-Type", "text/html; charset=utf-8");
                try {
                    response.addHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
                } catch (UnsupportedEncodingException e1) {
                    e1.printStackTrace();
                }
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                    }
                }
            }
        }
    }

}
