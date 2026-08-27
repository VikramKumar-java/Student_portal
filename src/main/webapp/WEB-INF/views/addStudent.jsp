<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="Student Portal Registration">

    <title>Student Portal | Registration</title>

    <!-- Bootstrap 5 -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-dark bg-primary shadow-sm">

    <div class="container">

        <a class="navbar-brand fw-bold"
           href="#">
            🎓 Student Portal
        </a>

    </div>

</nav>


<!-- ================= MAIN SECTION ================= -->

<main>

    <div class="container py-5">

        <div class="row justify-content-center">


            <!-- FORM CARD -->

            <div class="col-12 col-md-8 col-lg-6">

                <div class="card border-0 shadow-lg">


                    <!-- CARD HEADER -->

                    <div class="card-header bg-primary text-white text-center py-4">

                        <h2 class="fw-bold mb-1">
                            Student Registration
                        </h2>

                        <p class="mb-0">
                            Create your Student Portal account
                        </p>

                    </div>


                    <!-- CARD BODY -->

                    <div class="card-body p-4 p-md-5">


                        <form action="addStudent"
                              method="post">


                            <!-- NAME -->

                            <div class="mb-4">

                                <label for="name"
                                       class="form-label fw-semibold">

                                    Full Name

                                </label>

                                <input type="text"
                                       id="name"
                                       name="name"
                                       class="form-control form-control-lg"
                                       placeholder="Enter your full name"
                                       autocomplete="name"
                                       required>

                            </div>


                            <!-- EMAIL -->

                            <div class="mb-4">

                                <label for="email"
                                       class="form-label fw-semibold">

                                    Email Address

                                </label>

                                <input type="email"
                                       id="email"
                                       name="email"
                                       class="form-control form-control-lg"
                                       placeholder="example@gmail.com"
                                       autocomplete="email"
                                       required>

                            </div>


                            <!-- MOBILE -->

                            <div class="mb-4">

                                <label for="mobile"
                                       class="form-label fw-semibold">

                                    Mobile Number

                                </label>

                                <input type="tel"
                                       id="mobile"
                                       name="mobile"
                                       class="form-control form-control-lg"
                                       placeholder="Enter your mobile number"
                                       autocomplete="tel"
                                       pattern="[0-9]{10}"
                                       maxlength="10">

                                <div class="form-text">
                                    Enter a 10-digit mobile number.
                                </div>

                            </div>


                            <!-- COURSE -->

                            <div class="mb-4">

                                <label for="course"
                                       class="form-label fw-semibold">

                                    Course

                                </label>

                                <select id="course"
                                        name="course"
                                        class="form-select form-select-lg"
                                        required>

                                    <option value=""
                                            selected
                                            disabled>

                                        Select your course

                                    </option>

                                    <option value="Java Full Stack">
                                        Java Full Stack
                                    </option>

                                    <option value="Python Full Stack">
                                        Python Full Stack
                                    </option>

                                    <option value="Data Science">
                                        Data Science
                                    </option>

                                    <option value="Artificial Intelligence">
                                        Artificial Intelligence
                                    </option>

                                    <option value="Web Development">
                                        Web Development
                                    </option>

                                </select>

                            </div>


                            <!-- PASSWORD -->

                            <div class="mb-4">

                                <label for="password"
                                       class="form-label fw-semibold">

                                    Password

                                </label>

                                <input type="password"
                                       id="password"
                                       name="password"
                                       class="form-control form-control-lg"
                                       placeholder="Create a password"
                                       autocomplete="new-password"
                                       minlength="6"
                                       required>

                                <div class="form-text">
                                    Password must contain at least 6 characters.
                                </div>

                            </div>


                            <!-- TERMS -->

                            <div class="form-check mb-4">

                                <input class="form-check-input"
                                       type="checkbox"
                                       id="terms"
                                       required>

                                <label class="form-check-label"
                                       for="terms">

                                    I agree to the terms and conditions.

                                </label>

                            </div>


                            <!-- SUBMIT -->

                            <div class="d-grid">

                                <button type="submit"
                                        class="btn btn-primary btn-lg fw-semibold">

                                    Register Student

                                </button>

                            </div>


                        </form>

                    </div>


                    <!-- CARD FOOTER -->

                    <div class="card-footer bg-white text-center py-3">

                        <small class="text-muted">

                            Already registered?

                            <a href="${pageContext.request.contextPath}/login"
                               class="text-decoration-none fw-semibold">

                                Login here

                            </a>

                        </small>

                    </div>


                </div>

            </div>

        </div>

    </div>

</main>


<!-- ================= FOOTER ================= -->

<footer class="bg-dark text-white text-center py-3">

    <div class="container">

        <small>
            © 2026 Student Portal. All rights reserved.
        </small>

    </div>

</footer>


<!-- Bootstrap JavaScript -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>