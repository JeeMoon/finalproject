package com.gr.farming.common;

public interface ConstUtil {
	//페이징 처리에 필요한 상수
	int RECORD_COUNT=5;  //한페이지에 보여줄 레코드 개수
	int BLOCK_SIZE=10;
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="test";
	//String FILE_UPLOAD_TYPE="deploy";
	
	//이용후기 게시판 - 파일 저장 경로
	String FILE_UPLOAD_PATH="review_upload";
	String FILE_UPLOAD_PATH_TEST="/userImg";

	
	//전문가 페이지 - 전문가 홍보이미지 등록시 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="exp_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\DELL\\git\\Farming-re\\farming\\src\\main\\webapp\\resources\\userImg";
	
	//견적보내기 페이지 - 견적작성 완료시 첨부파일 이미지 저장 경로
	String REQUSET_UPLOAD_PATH="request_images";
	String REQUSET_UPLOAD_PATH_TEST="/requestImg";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1; //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //전문가 홍보이미지 이미지 업로드
	int UPLOAD_REQUSET_FLAG=3; //견적작성시 이미지 업로드
	
}
