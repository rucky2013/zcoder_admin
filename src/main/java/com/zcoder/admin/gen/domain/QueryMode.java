package com.zcoder.admin.gen.domain;


/**
 * 查询方式
 * @author lin
 *
 */
public enum QueryMode {

	EQUAL("=","="),NOT_EQUAL("!=","!="),GREATER_THAN(">",">"),

	EQUAL_OR_GREATER_THAN(">=",">="),LESS_THAN("<","<"),

	EQUAL_OR_LESS_THAN("<=","<="),BETWEEN("between","between"),

	LIKE("like","like"),LEFT_LIKE("left_like","left_like"),

	RIGHT_LIKE("right_like","right_like");



	private String label;

	private String value;


	QueryMode(String label,String value){
		this.label = label;
		this.value = value;
	}

	public String getValue(){
		return value;
	}

	public String getLabel(){
		return label;
	}
	
}
