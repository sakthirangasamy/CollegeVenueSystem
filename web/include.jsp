<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/@codingnepal -->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sidebar Menu | CodingNepal</title>
  <link rel="stylesheet" href="style.css">
  <!-- Linking Google fonts for icons -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0">
</head>
<body>
  <aside class="sidebar">
    <!-- Sidebar header -->
    <header class="sidebar-header">
      <a href="#" class="header-logo">
       
      </a>
      <button class="toggler sidebar-toggler">
        <span class="material-symbols-rounded">chevron_left</span>
      </button>
      <button class="toggler menu-toggler">
        <span class="material-symbols-rounded">menu</span>
      </button>
    </header>

    <nav class="sidebar-nav">
      <!-- Primary top nav -->
      <ul class="nav-list primary-nav">
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">dashboard</span>
            <span class="nav-label">Dashboard</span>
          </a>
          <span class="nav-tooltip">Dashboard</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">calendar_today</span>
            <span class="nav-label">Calendar</span>
          </a>
          <span class="nav-tooltip">Calendar</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">notifications</span>
            <span class="nav-label">Notifications</span>
          </a>
          <span class="nav-tooltip">Notifications</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">group</span>
            <span class="nav-label">Team</span>
          </a>
          <span class="nav-tooltip">Team</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">insert_chart</span>
            <span class="nav-label">Analytics</span>
          </a>
          <span class="nav-tooltip">Analytics</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">star</span>
            <span class="nav-label">Bookmarks</span>
          </a>
          <span class="nav-tooltip">Bookmarks</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">settings</span>
            <span class="nav-label">Settings</span>
          </a>
          <span class="nav-tooltip">Settings</span>
        </li>
      </ul>

      <!-- Secondary bottom nav -->
      <ul class="nav-list secondary-nav">
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">account_circle</span>
            <span class="nav-label">Profile</span>
          </a>
          <span class="nav-tooltip">Profile</span>
        </li>
        <li class="nav-item">
          <a href="#" class="nav-link">
            <span class="nav-icon material-symbols-rounded">logout</span>
            <span class="nav-label">Logout</span>
          </a>
          <span class="nav-tooltip">Logout</span>
        </li>
      </ul>
    </nav>
  </aside>

  <!-- Script -->
  <script>
      const sidebar = document.querySelector(".sidebar");
const sidebarToggler = document.querySelector(".sidebar-toggler");
const menuToggler = document.querySelector(".menu-toggler");

// Ensure these heights match the CSS sidebar height values
let collapsedSidebarHeight = "56px"; // Height in mobile view (collapsed)
let fullSidebarHeight = "calc(100vh - 32px)"; // Height in larger screen

// Toggle sidebar's collapsed state
sidebarToggler.addEventListener("click", () => {
  sidebar.classList.toggle("collapsed");
});

// Update sidebar height and menu toggle text
const toggleMenu = (isMenuActive) => {
  sidebar.style.height = isMenuActive ? `${sidebar.scrollHeight}px` : collapsedSidebarHeight;
  menuToggler.querySelector("span").innerText = isMenuActive ? "close" : "menu";
}

// Toggle menu-active class and adjust height
menuToggler.addEventListener("click", () => {
  toggleMenu(sidebar.classList.toggle("menu-active"));
});

// (Optional code): Adjust sidebar height on window resize
window.addEventListener("resize", () => {
  if (window.innerWidth >= 1024) {
    sidebar.style.height = fullSidebarHeight;
  } else {
    sidebar.classList.remove("collapsed");
    sidebar.style.height = "auto";
    toggleMenu(sidebar.classList.contains("menu-active"));
  }
});
  </script>
</body>
</html>