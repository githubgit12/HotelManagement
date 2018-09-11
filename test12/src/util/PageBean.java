package util;

public class PageBean {
	private int ye;
	private int maxYe;
	private int beginYe;
	private int endYe;
	private int begin;

	public PageBean(int ye, int count, int numInPage, int numOfPage) {
		this.ye = ye;
		if (this.ye < 1) {
			this.ye = 1;
		}

		begin = (this.ye - 1) * numInPage;
		maxYe = 0;

		if (count % numInPage == 0) {
			maxYe = count / numInPage;
		} else {
			maxYe = count / numInPage + 1;
		}
		if (this.ye > maxYe) {
			this.ye = maxYe;
		}
		beginYe = this.ye - numOfPage / 2;
		if (beginYe <= 1) {
			beginYe = 1;
		}
		endYe = beginYe + numOfPage - 1;
		if (endYe >= maxYe) {
			endYe = maxYe;
			beginYe = endYe - numOfPage + 1;
		}
		if (beginYe <= 1) {
			beginYe = 1;
		}
	}

	public int getBegin() {
		return begin;
	}

	public int getYe() {
		return ye;
	}

	public void setYe(int ye) {
		this.ye = ye;
	}

	public int getMaxYe() {
		return maxYe;
	}

	public void setMaxYe(int maxYe) {
		this.maxYe = maxYe;
	}

	public int getBeginYe() {
		return beginYe;
	}

	public void setBeginYe(int beginYe) {
		this.beginYe = beginYe;
	}

	public int getEndYe() {
		return endYe;
	}

	public void setEndYe(int endYe) {
		this.endYe = endYe;
	}

}
