package dto;

public class QFileDTO {
	private int qFileSeq;
	private String qFileOriname;
	private String qFileSysname;
	private int qFileParentSeq;
	public QFileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QFileDTO(int qFileSeq, String qFileOriname, String qFileSysname, int qFileParentSeq) {
		super();
		this.qFileSeq = qFileSeq;
		this.qFileOriname = qFileOriname;
		this.qFileSysname = qFileSysname;
		this.qFileParentSeq = qFileParentSeq;
	}
	public int getqFileSeq() {
		return qFileSeq;
	}
	public void setqFileSeq(int qFileSeq) {
		this.qFileSeq = qFileSeq;
	}
	public String getqFileOriname() {
		return qFileOriname;
	}
	public void setqFileOriname(String qFileOriname) {
		this.qFileOriname = qFileOriname;
	}
	public String getqFileSysname() {
		return qFileSysname;
	}
	public void setqFileSysname(String qFileSysname) {
		this.qFileSysname = qFileSysname;
	}
	public int getqFileParentSeq() {
		return qFileParentSeq;
	}
	public void setqFileParentSeq(int qFileParentSeq) {
		this.qFileParentSeq = qFileParentSeq;
	}
	
	

}
