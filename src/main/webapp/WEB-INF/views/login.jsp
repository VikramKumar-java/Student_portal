<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="Student Portal Login">

    <title>Student Portal | Login</title>

    <!-- Bootstrap 5 CSS -->
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

            <div class="col-12 col-md-7 col-lg-5">


                <!-- LOGIN CARD -->

                <div class="card border-0 shadow-lg">


                    <!-- CARD HEADER -->

                    <div class="card-header bg-primary text-white text-center py-4">

                        <h2 class="fw-bold mb-1">
                            Student Login
                        </h2>

                        <p class="mb-0">
                            Login to your Student Portal account
                        </p>

                    </div>


                    <!-- CARD BODY -->

                    <div class="card-body p-4 p-md-5">


                        <!-- LOGIN FORM -->

                        <form action="${pageContext.request.contextPath}/login"
                              method="post">


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
                                       placeholder="Enter your password"
                                       autocomplete="current-password"
                                       required>

                            </div>


                            <!-- REMEMBER ME -->

                            <div class="form-check mb-4">

                                <input class="form-check-input"
                                       type="checkbox"
                                       id="rememberMe"
                                       name="rememberMe">

                                <label class="form-check-label"
                                       for="rememberMe">

                                    Remember me

                                </label>

                            </div>


                            <!-- LOGIN BUTTON -->

                            <div class="d-grid">

                                <button type="submit"
                                        class="btn btn-primary btn-lg fw-semibold">

                                    Login

                                </button>

                            </div>


                        </form>

                    </div>


                    <!-- CARD FOOTER -->

                    <div class="card-footer bg-white text-center py-3">

                        <small class="text-muted">

                            Don't have an account?

                            <a href="${pageContext.request.contextPath}/addStudent"
                               class="text-decoration-none fw-semibold">

                                Register here

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


<!-- Bootstrap 5 JavaScript -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>