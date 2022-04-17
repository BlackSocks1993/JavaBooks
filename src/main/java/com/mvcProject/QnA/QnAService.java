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
}
