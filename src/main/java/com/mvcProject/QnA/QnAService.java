package com.mvcProject.QnA;

import java.util.List;

public class QnAService {
	QnADAO qnaDAO;

	public QnAService() {
		qnaDAO = new QnADAO();
	}

	public List<QnADTO> selectQnAList() {
		List<QnADTO> qnaList = null;

		qnaList = qnaDAO.selectQnAlist();

		return qnaList;
	}

	public QnADTO selectOneQna(int qnaId) {
		return qnaDAO.selectOneQna(qnaId);
	}

	public void addQnA(QnADTO dto) {
		qnaDAO.addQnA(dto);
	}

	public void delQnA(int qna_no) {
		qnaDAO.delQnA(qna_no);
	}

	public void modQnA(QnADTO dto) {
		qnaDAO.modQnA(dto);
	}
}
