package com.schmanagement.service.impl;

import com.schmanagement.entity.Student;
import com.schmanagement.mapper.StudentMapper;
import com.schmanagement.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 学生表 服务实现类
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

}
