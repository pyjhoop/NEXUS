package com.team.nexus.repository.model.vo;

import com.fasterxml.jackson.databind.JsonNode;

import lombok.AllArgsConstructor;
import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@AllArgsConstructor
public class Content implements Comparable<Content>{
	
	private String name;
	private String download_url;
	private String type;
	
	
	@Override
	public int compareTo(Content o) {
		return this.type.compareTo(o.type);
	}
}
