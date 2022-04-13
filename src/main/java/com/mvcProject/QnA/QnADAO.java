package com.mvcProject.QnA;

import java.util.List;

public interface QnADAO {
	/**
	 * QnA게시판 전체 게시물을 리스트로 가져옴
	 * @return List<QnADTO>
	 */
	public List<QnADTO> QnAlist();

	/**
	 * 작성한 게시물을 DB에 등록함
	 * @param dto
	 */
	public void addQnA(QnADTO dto);
	
	/**
	 * 게시물을 수정함
	 * @param dto
	 */
	public void modQnA(QnADTO dto);

	/**
	 * 게시물을 삭제함
	 * @param dto
	 */
	public void delQnA(QnADTO dto);

	/**
	 * 검색창에서 조회된 게시물을 리스트로 가져옴
	 * @param dto
	 * @return List<QnADTO>
	 */
	public List<QnADTO> searchQnA(QnADTO dto);

	/**
	 * 하나의 게시물을 조회하여 가져옴 (상세페이지)
	 * @param dto
	 * @return
	 */
	public QnADTO selectOneQna(QnADTO dto);
}
