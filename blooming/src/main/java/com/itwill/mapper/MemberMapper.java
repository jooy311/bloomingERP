
package com.itwill.mapper;

import java.util.List;

import com.itwill.dto.Member;

public interface MemberMapper {
	
	//��ü�˻�
	List<Member> selectMemberList();
	
	//��������
	List<Member> selectDynamicMemberList(Member member);
	
}
