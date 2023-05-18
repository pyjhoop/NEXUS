package com.team.nexus.issue.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;




@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Milestone {

   
   private String id;
   private String title;
   private String number;
   private String state;
   
   
}
