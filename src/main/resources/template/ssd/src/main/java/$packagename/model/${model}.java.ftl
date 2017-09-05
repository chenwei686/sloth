package ${packageName}.model;


import javax.annotation.Generated;
import javax.persistence.*;

@Generated(
	value = {
		"https://github.com/coolcooldee/sloth",
		"sloth version:1.0"
	},
	comments = "This class is generated by sloth"
)
@Entity
@Table(name="${name}")
public class ${upperFirstLetterName} {

	<#list columns as column>
	/**
     * ${column.remark}
	 */
	<#if primaryKey=column.name>
	@Id
	</#if>
	<#if column.autoIncrement>
    @GeneratedValue(strategy = GenerationType.AUTO)
	</#if>
    @Column(name="${column.name}")
	private ${column.type} ${column.lowerFirstLetterName};
	
	</#list>
		

	<#list columns as column>

	public ${column.type} get${column.upperFirstLetterName}() {
		return ${column.lowerFirstLetterName};
	}

	public void set${column.upperFirstLetterName}(${column.type} ${column.lowerFirstLetterName}) {
		this.${column.lowerFirstLetterName} = ${column.lowerFirstLetterName};
	} 
	</#list>
}
