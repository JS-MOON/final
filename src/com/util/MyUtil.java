package com.util;

//페이징 처리
public class MyUtil {

	//전체 페이지수 구하기
	//필요한변수 numPerPage = 한 화면에 표시할 데이터갯수
	//dataCount = 전체데이터 갯수
	public int getPageCount(int numPerPage,int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0){
			pageCount++;
			
		}
		
		return pageCount;
	}
	
	//페이징 처리 메소드
	//필요한 변수
	//currenPage : 현재 표시할 페이지
	//totalPage : 전체 페이지수
	//listUrl : 링크를 설정할 페이지
	
	public String pageIndexList(int currenPage,int totalPage,String listUrl){
		
		int numPerBlack = 5; //◀6 7 8 9 10▶ 의 갯수
		int currentPageSetup;//표시할 블럭의 첫페이지 -1 한값
		int page;
		
		StringBuffer sb = new StringBuffer();//문자를 누적할려고 입력함
		
		if(currenPage==0 || totalPage==0)
			return "";
		
		//list.jsp 가 넘어온다
		if(listUrl.indexOf("?")!=-1)
			listUrl = listUrl +"&";
		else
			listUrl = listUrl +"?";
		
		//표시할 첫페이지에서 -1한 값
		//5◀6 7 8 9 10▶
		//10◀11 12 13 14 15▶
		//                     15          5         5
		currentPageSetup = (currenPage/numPerBlack)*numPerBlack;
		
		if(currenPage%numPerBlack==0)
			currentPageSetup = currentPageSetup-numPerBlack;
		
		//◀이전
		if(totalPage>numPerBlack && currentPageSetup>0){
			sb.append("<a href=\""+listUrl+"pageNum="
					+ currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?/pageNum=5">◀이전</a>
			
		}
		//바로가기페이지(6 7 8 9 10)
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
		
		//다음▶
		if(totalPage - currentPageSetup > numPerBlack){
			sb.append("<a href=\""+ listUrl + "pageNum=" +page+ 
					"\">다음▶</a>&nbsp;");
			//<a href = "list.jsp?/pageNum=11">11</a>
		}
		
		return sb.toString();
		
		
	}
}


























