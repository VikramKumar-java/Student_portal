
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="Student Profile Page">

    <title>Student Portal | My Profile</title>

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


        <a href="${pageContext.request.contextPath}/logout"
           class="btn btn-light btn-sm fw-semibold">

            Logout

        </a>

    </div>

</nav>


<!-- ================= MAIN CONTENT ================= -->

<main>

    <div class="container py-5">


        <div class="row justify-content-center">


            <div class="col-12 col-md-8 col-lg-6">


                <!-- PROFILE CARD -->

                <div class="card border-0 shadow-lg">


                    <!-- CARD HEADER -->

                    <div class="card-header bg-primary text-white text-center py-4">

                        <h2 class="fw-bold mb-1">

                            My Profile

                        </h2>

                        <p class="mb-0">

                            Welcome, ${student.name}

                        </p>

                    </div>


                    <!-- CARD BODY -->

                    <div class="card-body p-4 p-md-5">


                        <!-- ID -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Student ID
                            </label>

                            <div class="form-control bg-light">

                                ${student.id}

                            </div>

                        </div>


                        <!-- NAME -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Full Name
                            </label>

                            <div class="form-control bg-light">

                                ${student.name}

                            </div>

                        </div>


                        <!-- EMAIL -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Email Address
                            </label>

                            <div class="form-control bg-light">

                                ${student.email}

                            </div>

                        </div>


                        <!-- MOBILE -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Mobile Number
                            </label>

                            <div class="form-control bg-light">

                                ${student.mobile}

                            </div>

                        </div>


                        <!-- COURSE -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Course
                            </label>

                            <div class="form-control bg-light">

                                ${student.course}

                            </div>

                        </div>


                        <!-- ROLE -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">
                                Role
                            </label>

                            <div class="form-control bg-light">

                                ${student.role}

                            </div>

                        </div>


                        <!-- BUTTONS -->

                        <div class="d-grid gap-2 mt-4">

                            <a href="${pageContext.request.contextPath}/editStudent?id=${student.id}"
                               class="btn btn-primary btn-lg">

                                Edit Profile

                            </a>


                            <a href="${pageContext.request.contextPath}/logout"
                               class="btn btn-outline-danger">

                                Logout

                            </a>

                        </div>


                    </div>


                </div>


            </div>


        </div>


    </div>

</main>


<!-- Bootstrap JS -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>
```
