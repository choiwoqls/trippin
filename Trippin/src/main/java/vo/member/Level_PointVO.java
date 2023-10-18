package vo.member;


public class Level_PointVO {

	private int level_point_seq;
	private int level_no;
	private int point;
	
	public Level_PointVO() {
		
	}

	public Level_PointVO(int level_point_seq, int level_no, int point) {
		super();
		this.level_point_seq = level_point_seq;
		this.level_no = level_no;
		this.point = point;
	}

	public int getLevel_point_seq() {
		return level_point_seq;
	}

	public void setLevel_point_seq(int level_point_seq) {
		this.level_point_seq = level_point_seq;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
