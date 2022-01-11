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

	
	//관리자 페이지 - 상품 등록시 상품 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="pd_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\Asus\\git\\Farming\\farming\\src\\main\\webapp\\resources\\userImg";
	
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1; //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //상품 등록시 이미지 업로드
	
}
