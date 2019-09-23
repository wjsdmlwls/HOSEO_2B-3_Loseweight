package ch13;

import java.sql.Timestamp;

public class QnAboardDTO {

		private int num; 
	    private String writer;
	    private String subject;
	    private String email;
	    private String content;
	    private String passwd;
	    private Timestamp reg_date;
	    private int readcount;
	    private int ref;
	    private int re_step;	
	    private int re_level;
	    
	    // QnA re 댓글 부분
		private int glenum;
	    private String lw_id;
	    private String reContent ;
	    
	    
	    
	    private String img0 ;
	    private String filename0 ;
	    public String getImg0() {
			return img0;
		}
		public void setImg0(String img0) {
			this.img0 = img0;
		}
		public String getFilename0() {
			return filename0;
		}
		public void setFilename0(String filename0) {
			this.filename0 = filename0;
		}
		public String getFilename1() {
			return filename1;
		}
		public void setFilename1(String filename1) {
			this.filename1 = filename1;
		}
		public String getFilepath0() {
			return filepath0;
		}
		public void setFilepath0(String filepath0) {
			this.filepath0 = filepath0;
		}
		public String getFilepath1() {
			return filepath1;
		}
		public void setFilepath1(String filepath1) {
			this.filepath1 = filepath1;
		}
		private String filename1 ;
	    private String filepath0 ;
	    private String filepath1 ;
	    
	    
	 
	    
	    
	
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getPasswd() {
			return passwd;
		}
		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getRe_step() {
			return re_step;
		}
		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}
		public int getRe_level() {
			return re_level;
		}
		public void setRe_level(int re_level) {
			this.re_level = re_level;
		} 
		
		 // QnA re 댓글 부분
		   public int getGlenum() {
				return glenum;
			}
			public String getLw_id() {
				return lw_id;
			}
			public String getReContent() {
				return reContent;
			}
			public void setGlenum(int glenum) {
				this.glenum = glenum;
			}
			public void setLw_id(String lw_id) {
				this.lw_id = lw_id;
			}
			public void setReContent(String reContent) {
				this.reContent = reContent;
			}


}
