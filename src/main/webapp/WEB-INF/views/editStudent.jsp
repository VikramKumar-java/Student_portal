<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Student</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <span class="navbar-brand fw-bold">
            🎓 Student Portal
        </span>

        <a href="students"
           class="btn btn-light">

            Student List

        </a>

    </div>

</nav>


<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-md-7 col-lg-6">

            <div class="card border-0 shadow-lg">

                <div class="card-header bg-warning text-center">

                    <h3 class="mb-0">
                        Edit Student
                    </h3>

                </div>


                <div class="card-body p-4">


                    <form action="updateStudent"
                          method="post">


                        <!-- ID -->

                        <input type="hidden"
                               name="id"
                               value="${student.id}">


                        <!-- NAME -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Full Name
                            </label>

                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   value="${student.name}"
                                   required>

                        </div>


                        <!-- EMAIL -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Email
                            </label>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   value="${student.email}"
                                   required>

                        </div>


                        <!-- MOBILE -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Mobile
                            </label>

                            <input type="tel"
                                   name="mobile"
                                   class="form-control"
                                   value="${student.mobile}">

                        </div>


                        <!-- COURSE -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">
                                Course
                            </label>

                            <input type="text"
                                   name="course"
                                   class="form-control"
                                   value="${student.course}">

                        </div>


                        <!-- PASSWORD -->

                        <div class="mb-4">

                            <label class="form-label fw-semibold">
                                Password
                            </label>

                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   value="${student.password}"
                                   required>

                        </div>


                        <div class="d-grid">

                            <button type="submit"
                                    class="btn btn-warning btn-lg">

                                Update Student

                            </button>

                        </div>


                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>