<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Portal | Students</title>

    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <span class="navbar-brand fw-bold">
            🎓 Student Portal
        </span>

        <a href="${pageContext.request.contextPath}/addStudent"
           class="btn btn-light">

            + Add Student

        </a>

    </div>

</nav>


<!-- ================= ERROR ALERT ================= -->

<c:if test="${not empty errorMessage}">

    <div class="container mt-3">

        <div class="alert alert-danger alert-dismissible fade show"
             role="alert">

            <strong>Warning!</strong>

                ${errorMessage}

            <button type="button"
                    class="btn-close"
                    data-bs-dismiss="alert"
                    aria-label="Close">
            </button>

        </div>

    </div>

</c:if>


<!-- ================= STUDENT LIST ================= -->

<div class="container mt-5">

    <div class="card shadow border-0">

        <div class="card-header bg-white">

            <h3 class="mb-0">
                Student List
            </h3>

        </div>


        <div class="card-body">


            <div class="table-responsive">

                <table class="table table-hover align-middle">

                    <thead class="table-primary">

                    <tr>

                        <th>ID</th>

                        <th>Name</th>

                        <th>Email</th>

                        <th>Mobile</th>

                        <th>Course</th>

                        <th>Actions</th>

                    </tr>

                    </thead>


                    <tbody>

                    <c:forEach var="student"
                               items="${students}">

                        <tr>

                            <td>
                                    ${student.id}
                            </td>

                            <td>
                                    ${student.name}
                            </td>

                            <td>
                                    ${student.email}
                            </td>

                            <td>
                                    ${student.mobile}
                            </td>

                            <td>
                                    ${student.course}
                            </td>

                            <td>

                                <!-- EDIT BUTTON -->

                                <a href="${pageContext.request.contextPath}/editStudent?id=${student.id}"
                                   class="btn btn-sm btn-warning">

                                    Edit

                                </a>


                                <!-- DELETE BUTTON -->

                                <a href="${pageContext.request.contextPath}/deleteStudent?id=${student.id}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this student?');">

                                    Delete

                                </a>

                            </td>

                        </tr>

                    </c:forEach>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>


<!-- Bootstrap JS -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>