package vo.accom;

public class ReservationVO {

	private int reservation_seq;
	private int m_seq;
	private String reservation_name;
	private String reservation_tel;
	private String reservation_mail;
	private String stay_last_name;
	private String stay_first_name;
	private int stay_sex;
	private String stay_birth;
	
	public ReservationVO() {
		
	}
	
	public ReservationVO(int reservation_seq, int m_seq, String reservation_name, String reservation_tel,
			String reservation_mail, String stay_last_name, String stay_first_name, int stay_sex, String stay_birth) {
		
		this.reservation_seq = reservation_seq;
		this.m_seq = m_seq;
		this.reservation_name = reservation_name;
		this.reservation_tel = reservation_tel;
		this.reservation_mail = reservation_mail;
		this.stay_last_name = stay_last_name;
		this.stay_first_name = stay_first_name;
		this.stay_sex = stay_sex;
		this.stay_birth= stay_birth;
	}

	public int getReservation_seq() {
		return reservation_seq;
	}

	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getReservation_name() {
		return reservation_name;
	}

	public void setReservation_name(String reservation_name) {
		this.reservation_name = reservation_name;
	}

	public String getReservation_tel() {
		return reservation_tel;
	}

	public void setReservation_tel(String reservation_tel) {
		this.reservation_tel = reservation_tel;
	}

	public String getReservation_mail() {
		return reservation_mail;
	}

	public void setReservation_mail(String reservation_mail) {
		this.reservation_mail = reservation_mail;
	}

	public String getStay_last_name() {
		return stay_last_name;
	}

	public void setStay_last_name(String stay_last_name) {
		this.stay_last_name = stay_last_name;
	}

	public String getStay_first_name() {
		return stay_first_name;
	}

	public void setStay_first_name(String stay_first_name) {
		this.stay_first_name = stay_first_name;
	}

	public int getStay_sex() {
		return stay_sex;
	}

	public void setStay_sex(int stay_sex) {
		this.stay_sex = stay_sex;
	}

	public String getStay_birth() {
		return stay_birth;
	}

	public void setStay_birth(String stay_birth) {
		this.stay_birth = stay_birth;
	}
	
	
}
