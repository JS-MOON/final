package com.exe.util;

//����¡ ó��
public class MyUtil {

	//��ü �������� ���ϱ�
	//�ʿ��Ѻ��� numPerPage = �� ȭ�鿡 ǥ���� �����Ͱ���
	//dataCount = ��ü������ ����
	public int getPageCount(int numPerPage,int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0){
			pageCount++;
			
		}
		
		return pageCount;
	}
	
	//����¡ ó�� �޼ҵ�
	//�ʿ��� ����
	//currenPage : ���� ǥ���� ������
	//totalPage : ��ü ��������
	//listUrl : ��ũ�� ������ ������
	
	public String pageIndexList(int currenPage,int totalPage,String listUrl){
		
		int numPerBlack = 5; //��6 7 8 9 10�� �� ����
		int currentPageSetup;//ǥ���� ���� ù������ -1 �Ѱ�
		int page;
		
		StringBuffer sb = new StringBuffer();//���ڸ� �����ҷ��� �Է���
		
		if(currenPage==0 || totalPage==0)
			return "";
		
		//list.jsp �� �Ѿ�´�
		if(listUrl.indexOf("?")!=-1)
			listUrl = listUrl +"&";
		else
			listUrl = listUrl +"?";
		
		//ǥ���� ù���������� -1�� ��
		//5��6 7 8 9 10��
		//10��11 12 13 14 15��
		//                     15          5         5
		currentPageSetup = (currenPage/numPerBlack)*numPerBlack;
		
		if(currenPage%numPerBlack==0)
			currentPageSetup = currentPageSetup-numPerBlack;
		
		//������
		if(totalPage>numPerBlack && currentPageSetup>0){
			sb.append("<a href=\""+listUrl+"pageNum="
					+ currentPageSetup + "\">이전</a>&nbsp;");
			//<a href="list.jsp?/pageNum=5">������</a>
			
		}
		//�ٷΰ���������(6 7 8 9 10)
		page = currentPageSetup +1 ;
		
		while (page<=totalPage && page <= (currentPageSetup + numPerBlack)) {

			if(page == currenPage){
				
				sb.append("<font color=\"Fuchsia\">" + page +
						"</font>&nbsp;");
				//<font color="Fcuhsia>6</font>
			}else{
				sb.append("<a href=\"" + listUrl + "pageNum="+page+"\">" +
						page + "</a>&nbsp;");
				//<a href ="list.jsp?pageNum=6>6</a>
				
			}
			page++;
			
		}//end while
		
		//������
		if(totalPage - currentPageSetup > numPerBlack){
			sb.append("<a href=\""+ listUrl + "pageNum=" +page+ 
					"\">다음</a>&nbsp;");
			//<a href = "list.jsp?/pageNum=11">11</a>
		}
		
		return sb.toString();
		
		
	}
}


























