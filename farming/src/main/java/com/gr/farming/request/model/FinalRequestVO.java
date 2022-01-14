package com.gr.farming.request.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FinalRequestVO {

	private int finalRequestNo; /* 견적서 번호 */
	private int categoryNo; /* 카테고리 번호 */
	private int memberNo; /* 회원 번호 */
	private int expertNo; /* 담당 개발자 번호 */
	private int requestNo; /* 견적요청 번호 */
    private int cost; /* 견적비용 */
    private String type; /* 비용 타입 */
    private String explain; /* 견적설명 */
	private Timestamp sendTime;/* 발송일자 */
	
	//자료실 
    private String filename; /* 첨부파일 저장된 이름 */
    private String originalFilename; /* 첨부파일 원래이름 */
    private long filesize; /* 첨부파일 사이즈 */
    
	@Override
	public String toString() {
		return "FinalRequestVO [finalRequestNo=" + finalRequestNo + ", categoryNo=" + categoryNo + ", memberNo="
				+ memberNo + ", expertNo=" + expertNo + ", requestNo=" + requestNo + ", cost=" + cost + ", type=" + type
				+ ", explain=" + explain + ", sendTime=" + sendTime + ", filename=" + filename + ", originalFilename="
				+ originalFilename + ", filesize=" + filesize + "]";
	}
    
	
    
    
}
