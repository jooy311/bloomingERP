package com.itwill.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//���� �ٿ�ε� ����� �����ϴ� Ŭ����
// => Bean Configuration File�� bean ������Ʈ �Ǵ� @Component ������̼��� �̿��Ͽ� Spring Bean���� ���
//BeanNameViewResolver�� ���� ����Ǵ� Spring Bean�� Ŭ������ �ݵ�� AbstractView Ŭ������ ��ӹ޾� �ۼ�
// => renderMergedOutputModel() �޼ҵ� �������̵� ����
public class FileDownload extends AbstractView {
	//Ŭ���̾�Ʈ�� ������ ��������(MimeType) ���� - ���� �ٿ�ε� ����
	public FileDownload() {
		//AbstractView.setContentType(String mimeType) : ���� ���������� �����ϴ� �޼ҵ� 
		setContentType("application/download; UTF-8");
	}
	
	//BeanNameViewResolver�� ���� �ڵ� ȣ��Ǵ� �޼ҵ�
	// => model �Ű�����(Map ��ü)���� ��û ó�� �޼ҵ忡�� Model�� ���� �����Ǵ� ���� ����
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//��û ó�� �޼ҵ忡�� ������ �ٿ�ε� ���������� ��ȯ�޾� ����
		@SuppressWarnings("unchecked")
		Map<String, String> fileInfo=(Map<String, String>)model.get("downloadFile");
		
		//�ٿ�ε� ���������� ��ȯ�޾� ����
		String uploadDir=fileInfo.get("uploadDir");
		String uploadFilename=fileInfo.get("uploadFilename");
		String originFilename=fileInfo.get("originFilename");
		
		//�ٿ�ε� ���������� �̿��Ͽ� File ��ü ����
		File downloadFile=new File(uploadDir, uploadFilename);
		
		//Ŭ���̾�Ʈ�� ������ �����ϱ� ���� �������� ����
		response.setContentType(getContentType());
		response.setContentLength((int)downloadFile.length());
		
		originFilename = URLEncoder.encode(originFilename, "UTF-8");

		//Ŭ���̾�Ʈ���� �ٿ�ε� ���ϸ� ����
		response.setHeader("Content-Disposition", "attachment; filename=\""+originFilename+"\";");
		
		//Ŭ���̾�Ʈ���� ���õ���Ÿ�� �����ϱ� ���� ��½�Ʈ���� ��ȯ�޾� ����
		OutputStream out=response.getOutputStream();
		
		FileInputStream in=null;
		try {
			//�ٿ�ε� ������ ���õ���Ÿ�� �б� ���� �Է½�Ʈ�� �����Ͽ� ����
			in=new FileInputStream(downloadFile);
			
			/*
			//�Է½�Ʈ������ ���õ���Ÿ�� �о� ��½�Ʈ������ ���� - �ٿ�ε�
			while(true) {
				int readByte=in.read();
				if(readByte==-1) break;
				out.write(readByte);
			}
			*/
			
			//Spring���� �����ϴ� FileCopyUtils Ŭ������ copy() �޼ҵ带 ȣ���Ͽ� ���� ���� - �ٿ�ε�
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (Exception e) {}
		}
	}
}