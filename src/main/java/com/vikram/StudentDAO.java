package com.vikram;

import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class StudentDAO {
    private JdbcTemplate jdbcTemplate;
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate=jdbcTemplate;
    }
    public void testConnection() {
        System.out.println("JdbcTemplate injected successfully!");
    }
    public List<StudentMode> getAllStudents() {

        String sql = "SELECT * FROM student70";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            StudentMode student = new StudentMode();

            student.setId(rs.getInt("id"));
            student.setName(rs.getString("name"));
            student.setEmail(rs.getString("email"));
            student.setMobile(rs.getString("mobile"));
            student.setCourse(rs.getString("course"));
            student.setPassword(rs.getString("password"));

            return student;
        });
    }
    public int saveStudent(StudentMode student) {

        String sql = "INSERT INTO student70 " +
                "(name, email, mobile, course, password) " +
                "VALUES (?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                student.getName(),
                student.getEmail(),
                student.getMobile(),
                student.getCourse(),
                student.getPassword()
        );
    }
    public StudentMode getStudentById(int id) {

        String sql = "SELECT * FROM student70 WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {

                    StudentMode student = new StudentMode();

                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setMobile(rs.getString("mobile"));
                    student.setCourse(rs.getString("course"));
                    student.setPassword(rs.getString("password"));

                    return student;
                },
                id
        );
    }
    public int updateStudent(StudentMode student) {

        String sql = "UPDATE student70 SET " +
                "name = ?, " +
                "email = ?, " +
                "mobile = ?, " +
                "course = ?, " +
                "password = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                student.getName(),
                student.getEmail(),
                student.getMobile(),
                student.getCourse(),
                student.getPassword(),
                student.getId()
        );
    }
    public int deleteStudent(int id) {

        String sql = "DELETE FROM student70 WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }
    public StudentMode loginStudent(String email, String password) {

        String sql =
                "SELECT * FROM student70 WHERE email = ? AND password = ?";

        List<StudentMode> students = jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    StudentMode student = new StudentMode(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("mobile"),
                            rs.getString("course"),
                            rs.getString("password"),
                            rs.getString("role")
                    );

                    return student;
                },
                email,
                password
        );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }

}
