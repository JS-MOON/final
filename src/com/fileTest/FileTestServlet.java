package com.fileTest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

public class FileTestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBConn.getConnection();
		FileTestDAO dao = new FileTestDAO(conn);

		String uri = req.getRequestURI();

		String url;
		try {
			//������ ������ ���
			String root = getServletContext().getRealPath("/"); //������� study
			String path = root + File.separator + "pbs" +
					File.separator + "saveFile";

			File dir = new File(path);
			if(!dir.exists()){
				dir.mkdirs();
			}

			if(uri.contains("write.do")){

				url = "/filetest/write.jsp";
				forward(req, resp, url);


			}else if(uri.contains("write_ok.do")){

				String encType = "UTF-8";
				int maxSize = 5*1024*1024;

				MultipartRequest mr =
						new MultipartRequest(req, path, maxSize, encType,
								new DefaultFileRenamePolicy());

				//���ε��� ������ �����ϸ�
				if(mr.getFile("upload")!=null){

					FileTestDTO dto = new FileTestDTO();

					int maxNum = dao.getMaxNum();

					dto.setNum(maxNum + 1);
					dto.setSubject(mr.getParameter("subject"));
					dto.setSaveFileName(mr.getFilesystemName("upload"));
					dto.setOriginalFileName(mr.getOriginalFileName("upload"));

					dao.insertData(dto);
				}

				url = cp + "/file/list.do";
				resp.sendRedirect(url);

			}else if(uri.contains("list.do")){

				List<FileTestDTO> lists = dao.getLists();

				String downloadPath = cp + "/file/download.do";
				String deletePath = cp + "/file/delete.do";

				String imagePath = cp + "/pbs/saveFile";
				req.setAttribute("imagePath", imagePath);


				req.setAttribute("lists", lists);
				req.setAttribute("downloadPath", downloadPath);
				req.setAttribute("deletePath", deletePath);


				url = "/filetest/list.jsp";
				forward(req, resp, url);

			}else if(uri.contains("download.do")){

				int num = Integer.parseInt(req.getParameter("num"));

				FileTestDTO dto = dao.getReadData(num);

				if(dto==null)
					return;
				//�ٿ�ε�
				boolean flag =
						FileManager.doFileDownload(resp,
								dto.getSaveFileName(),
								dto.getOriginalFileName(), path);

				if(!flag){

					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out = resp.getWriter();

					out.print("<script type='text/javascript'>");
					out.print("alert('�ٿ�ε� ����!');");
					out.print("</script>");
				}

			}else if(uri.contains("delete.do")){

				int num = Integer.parseInt(req.getParameter("num"));

				FileTestDTO dto = dao.getReadData(num);

				//���ϻ���
				FileManager.doFileDelete(dto.getSaveFileName(), path);

				//db����
				dao.deleteData(num);

				url = cp + "/file/list.do";
				resp.sendRedirect(url);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
