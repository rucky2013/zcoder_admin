package com.zcoder.admin.sys.dao;

import com.zcoder.admin.sys.domain.SysDict;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by lin on 2016-06-14.
 */
public interface SysDictDao extends JpaRepository<SysDict, Long> {
}
