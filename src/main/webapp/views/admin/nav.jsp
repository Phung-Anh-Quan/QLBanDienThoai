<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="/admin">EShop</a>
    <!-- Sidebar Toggle-->
    <button
            class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
            id="sidebarToggle"
            href="#!"
    >
        <i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search-->
    <form
            class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
    ></form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-auto float-right me-lg-4">
        <li class="nav-item dropdown" style="display: flex">
            <p class="nav-link">ADMIN</p>
            <a
                    class="nav-link dropdown-toggle"
                    id="navbarDropdown"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
            ><i class="fas fa-user fa-fw"></i
            ></a>
            <ul
                    class="dropdown-menu dropdown-menu-end"
                    aria-labelledby="navbarDropdown"
            >
                <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
            </ul>
        </li>
    </ul>
</nav>

<script>
    window.addEventListener('DOMContentLoaded', event => {
        const sidebarToggle = document.body.querySelector('#sidebarToggle');
        if (sidebarToggle) {
            sidebarToggle.addEventListener('click', event => {
                event.preventDefault();
                document.body.classList.toggle('sb-sidenav-toggled');
                localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
            });
        }
    });
</script>