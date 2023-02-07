package com.milk.notice.model.vo;

public class Faq {

	private int faqNo;
	private String question;
	private String answer;
	private String bestFaq;
	private int faqWriter;
	private String categoryName;
	
	public Faq() {}
	public Faq(int faqNo, String question, String answer, String bestFaq, int faqWriter, String categoryName) {
		super();
		this.faqNo = faqNo;
		this.question = question;
		this.answer = answer;
		this.bestFaq = bestFaq;
		this.faqWriter = faqWriter;
		this.categoryName = categoryName;
	}
	
	
	
	public Faq(int faqNo, String question, String answer, String categoryName) {
		super();
		this.faqNo = faqNo;
		this.question = question;
		this.answer = answer;
		this.categoryName = categoryName;
	}
	public Faq(int faqNo, String question, String answer, int faqWriter, String categoryName) {
		super();
		this.faqNo = faqNo;
		this.question = question;
		this.answer = answer;
		this.faqWriter = faqWriter;
		this.categoryName = categoryName;
	}
	
	public Faq(int faqNo, String question, String categoryName) {
		super();
		this.faqNo = faqNo;
		this.question = question;
		this.categoryName = categoryName;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getBestFaq() {
		return bestFaq;
	}
	public void setBestFaq(String bestFaq) {
		this.bestFaq = bestFaq;
	}
	public int getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(int faqWriter) {
		this.faqWriter = faqWriter;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", question=" + question + ", answer=" + answer + ", bestFaq=" + bestFaq
				+ ", faqWriter=" + faqWriter + ", categoryName=" + categoryName + "]";
	}
	
	
	

}
