/**
 * Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved. <br/>
 * 描述: TODO <br/>
 *
 * @author framework generator
 * @date 2017年09月25日
 * @version 2.0
 */
package com.icinfo.cs.sccheck.mapper;

import java.util.List;
import java.util.Map;

import com.icinfo.cs.sccheck.dto.CodeExpertTypeDto;
import com.icinfo.cs.sccheck.model.CodeExpertType;
import com.icinfo.framework.mybatis.mapper.common.Mapper;

/**
 * 描述:    cs_code_expert_type 对应的Mapper接口.<br>
 *
 * @author framework generator
 * @date 2017年09月25日
 */
public interface CodeExpertTypeMapper extends Mapper<CodeExpertType> {
	
	/**
	 * 描述：根据职能部门查询专家组长类别列表
	 * 
	 * @author chenxin
	 * @date 2017-09-15
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<CodeExpertType> selectListByParams(Map<String,Object> params);

	/**
	 * 描述：根据职能部门查询专家组长类别列表
	 * 
	 * @author chenxin
	 * @date 2017-09-15
	 * @param params
	 * @return
	 */
	List<CodeExpertTypeDto> selectByParams(Map<String, Object> params);

	/**
	 * 查询最大编码
	 * @param dutyCode
	 * @return
	 * @throws Exception
	 */
	public String selectMaxCode(String dutyDeptCode)throws Exception;
	
	/**
	 * 描述: 查询树状结构展示
	 * @auther baifangfang
	 * @date 2017年4月26日 
	 * @return
	 */
	public List<Map<String, Object>> selectTreeMap(Map<String, Object> param);
}