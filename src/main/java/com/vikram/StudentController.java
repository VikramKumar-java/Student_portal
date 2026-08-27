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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String showStudents(
            HttpSession session,
            Model model) {

        StudentMode loggedInStudent =
                (StudentMode) session.getAttribute("loggedInStudent");

        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        if (!"ADMIN".equalsIgnoreCase(loggedInStudent.getRole())) {
            return "redirect:/profile";
        }

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
    public String updateStudent(
            @ModelAttribute StudentMode student,
            HttpSession session) {

        studentDAO.updateStudent(student);

        StudentMode loggedInStudent =
                (StudentMode) session.getAttribute("loggedInStudent");

        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        if ("ADMIN".equalsIgnoreCase(loggedInStudent.getRole())) {
            return "redirect:/students";
        }

        session.setAttribute("loggedInStudent", student);

        return "redirect:/profile";
    }
    @GetMapping("/deleteStudent")
    public String deleteStudent(
            @RequestParam("id") int id,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        StudentMode loggedInStudent =
                (StudentMode) session.getAttribute("loggedInStudent");

        if (loggedInStudent == null) {
            return "redirect:/login";
        }

        // Admin cannot delete himself
        if (loggedInStudent.getId() == id) {

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    "You cannot delete your own Admin account!"
            );

            return "redirect:/students";
        }

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
            HttpSession session,
            Model model) {

        StudentMode student = studentDAO.loginStudent(email, password);

        if (student == null) {
            model.addAttribute("error", "Invalid email or password");
            return "login";
        }

        session.setAttribute("loggedInStudent", student);

        if ("ADMIN".equalsIgnoreCase(student.getRole())) {
            return "redirect:/students";
        }

        return "redirect:/profile";
    }
    @GetMapping("/profile")
    public String showProfile(
            HttpSession session,
            Model model) {

        StudentMode student =
                (StudentMode) session.getAttribute("loggedInStudent");

        if (student == null) {
            return "redirect:/login";
        }

        model.addAttribute("student", student);

        return "profile";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/login";
    }

}

