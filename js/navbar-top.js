document.write(`
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid navbar-dropdown ">
  <a href="index">
    <img src="assets/logo.png" class="mobile-logo"  width="500" height="600" alt="MR Photography Logo">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarTogglerDemo01">
      <ul class="navbar-nav">
        <li class="nav-item">
					<a class="nav-link active nav-a" aria-current="page" href="../pages/catalogue.html">animals</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active nav-a" aria-current="page" href="../pages/sky">astro</a>
        </li>
        <li class="nav-item brand">
            <a class="navbar-brand mx-auto" href="../index">
              <img src="../assets/logo.svg" alt="MR Photography Logo">
            </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active nav-a" aria-current="page" href="../pages/about">about</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active nav-a" aria-current="page" href="../pages/sky">contact</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
`);
