<%@ page language="java" import="java.util.*,java.sql.*,com.jspsmart.upload.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="nd" beanName="org.jbit.news.dao.impl.NewsDaoImpl" type="org.jbit.news.dao.NewsDao" />
<jsp:useBean id="nbl" beanName="org.jbit.news.biz.impl.NewsBizImpl" type="org.jbit.news.biz.NewsBiz" />
<jsp:setProperty property="nd" name="nbl" value="<%=nd %>"/>
<%
	SmartUpload su = new SmartUpload();
	//��ʼ��SmartUpload����
	su.initialize(pageContext);
	com.jspsmart.upload.File file = null;
	//�����ϴ�����
	String allowed = "gif,jpg,doc,rar";
	//�����ϴ�����
	String denied = "jsp,asp,php,aspx,html,htm,exe,bat";
	com.jspsmart.upload.Request req  = null;
	//�����ϴ��ļ���С
	int file_size = 2*1024*1024;
	String exceptionMsg = null;
	int i = 0;
	try {
			//���������ϴ��ļ�����   
			su.setAllowedFilesList(allowed);
			//�������ϴ��ļ�����   
			su.setDeniedFilesList(denied);		
			//�����ļ��������   
			su.setMaxFileSize(file_size);						
			su.setCharset("GBK");
			//ִ���ϴ�
			su.upload();
			//�õ������ϴ��ļ�����Ϣ
			file = su.getFiles().getFile(0);
			String filepath = null;
			if(!file.isMissing()){
				//�����ļ��ڷ������ı���λ��
				filepath = "upload\\";
				filepath += file.getFileName();
				//�ļ����Ϊ   
				file.setCharset("gbk");
				file.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);
			}
			//��ȡsmartupload��װ��request
			req = su.getRequest();
			//��ȡ�������ҳ�洫�ݹ����Ĳ���	
			String nid = req.getParameter("nid");
			String ntid = req.getParameter("ntid");
			String ntitle = req.getParameter("ntitle");
			String nauthor = req.getParameter("nauthor");
			String nsummary = req.getParameter("nsummary");
			String ncontent = req.getParameter("ncontent");
			String filePath = req.getParameter("file");
			Map news = new HashMap();
			news.put("nid",nid);
			news.put("ntid",ntid);
			news.put("ntitle",ntitle);
			news.put("nauthor",nauthor);
			news.put("filePath",filepath);
			news.put("ncontent",ncontent);
			news.put("nsummary",nsummary);
			i = nbl.updateNews(news);
		} catch (Exception e) {
			exceptionMsg = e.getMessage();
			e.printStackTrace();
		}	
	if(i > 0){	
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ��������ţ����ȷ�Ϸ��������б�");
	open("../newspages/admin.jsp","_self");	
</script>
<%}else{
%>
<script type="text/javascript">
	alert("��������ʧ�ܣ����ȷ�Ϸ��������б�");
	open("../newspages/admin.jsp","_self");	
</script>
<%
}
%>
