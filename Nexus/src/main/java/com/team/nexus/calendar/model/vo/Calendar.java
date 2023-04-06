package com.team.nexus.calendar.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor      // 기본생성자
@AllArgsConstructor     // 매개변수 생성자
@Setter                 // setter 메소드
@Getter                 // getter 메소드
@ToString
public class Calendar {

	private int _id;
	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private String description;
	private String type;
	private String textColor;
	private boolean allDay;
}
