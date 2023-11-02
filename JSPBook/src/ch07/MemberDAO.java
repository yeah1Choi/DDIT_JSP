package ch07;

import java.util.ArrayList;

public class MemberDAO{
	
	private ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public ArrayList<MemberVO> getMemberList() {
		return memberList;
	}

	public void insertMember(MemberVO member) {
		memberList.add(member);
	}

}
