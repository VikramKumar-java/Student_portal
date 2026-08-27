package com.vikram;
import com.vikram.StudentDAO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private StudentDAO studentDAO;

    @GetMapping("/test")
    public String test() {

        studentDAO.testConnection();

        return "test";
    }
    @GetMapping("/addStudent")
    public String showAddStudentForm() {

        return "addStudent";
    }


    @PostMapping("/addStudent")
    public String saveStudent(@ModelAttribute StudentMode student) {

        studentDAO.saveStudent(student);

        return "redirect:/login";
    }
    @GetMapping("/students")
    public String showStudents(Model model) {

        List<StudentMode> students = studentDAO.getAllStudents();

        model.addAttribute("students", students);

        return "student";
    }
    @GetMapping("/editStudent")
    public String showEditForm(
            @RequestParam("id") int id,
            Model model) {

        StudentMode student = studentDAO.getStudentById(id);

        model.addAttribute("student", student);

        return "editStudent";
    }
    @PostMapping("/updateStudent")
    public String updateStudent(@ModelAttribute StudentMode student) {

        studentDAO.updateStudent(student);

        return "redirect:/students";
    }
    @GetMapping("/deleteStudent")
    public String deleteStudent(@RequestParam("id") int id) {

        studentDAO.deleteStudent(id);

        return "redirect:/students";
    }
    @GetMapping("/login")
    public String showLoginPage1() {

        return "login";
    }
    @PostMapping("/login")
    public String loginStudent(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model,
            HttpSession session) {

        StudentMode student =
                studentDAO.loginStudent(email, password);

        if (student != null) {

            session.setAttribute("loggedInStudent", student);

            return "redirect:/students";

        } else {

            model.addAttribute(
                    "error",
                    "Invalid email or password"
            );

            return "login";
        }
    }

}

