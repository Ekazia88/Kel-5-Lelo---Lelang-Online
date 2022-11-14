<?php
include '../config.php';
session_start();
if($_SESSION['level'] != "user"){
    echo "<script>alert('Anda harus login!!!');
    document.location.href ='../index.php?pesan=gagal';</script>";
}
$result = mysqli_query($conn,"SELECT * FROM Kategori");
  $kategori = [];
  while($row = mysqli_fetch_assoc($result)){
  $kategori[] = $row;
   }
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="./css/contact.css">
        <link rel="stylesheet" href="./css/fontawesome-free-6.2.0-web/css/all.min.css">
        <script src="./js/script.js"></script>
        <title>Document</title>
      </head>
      <body>
          <div class="wrapper">
              <header>
                  <div class="container">   
                      <div class="logo">
                          <a href="">Lelo</a>
                      </div>
                      <div class="search-cat-section">
                          <div class="searchdrop">
                              <input type="text" placeholder="Search" />
                              <div class="cat">
                                  <a href="#">
                                      <span>Category
                                      <i class="fa-sharp fa-solid fa-chevron-down"></i>
                                  </span>
                                  </a>
                                  <div class="cat-menu">
                                      <span class="subject">Select Category</span>
                                      <?php $i=1; foreach($kategori as $kat):?>
                                <a href="Cats.php?id=<?php echo $kat['id_kat']?>" class="menu-item-cat"><?php echo $kat['name_kat']?></a>
                                <?php $i++; endforeach;?>
                                  </div>
                              </div>
                              <input title="Search" value="" type="button" />
                          </div>
                      </div>
                      <nav id="navbar">
                              <ul>
                                  <li>
                                      <div class="profile" onclick="menuToggle();">
                                          <i class="fa-solid fa-user"></i>
                                          <div class="card hidden">
                                              <ul class="dropdown-profile">
                                                <li><a class="text-profile" href="#">Profile</li></a>
                                                <li><a class="text-profile" href="#">Log Out</li></a>
                                              </ul>
                                      </div>
                                  </li>
                                  <li><a href="#">Contact</a></li>
                                  <li><a href="#" >Login / Register</a></li>
                              </ul>
                      </nav>
                  </div>
              </header>
              <section class="contact-section">
                <div class="contact-info">
                    <div><i class="fa-solid fa-location-dot"></i>Address, City, Country</div>
                    <div><i class="fa-solid fa-envelope"></i>contact@email.com</div>
                    <div><i class="fa-solid fa-phone"></i>+00 0000 000 000</div>
                    <div><i class="fa-solid fa-clock"></i>Mon - Fri 8:00 AM to 5:00 PM</div>  
                </div>
                <div class="contact-form">
                    <h2>Contact Us</h2>
                    <form class="contact" action="" method="post">
                        <input type="text" name="name" class="text-box" placeholder="Your Name" required>
                        <input type="email" name="email" class="text-box" placeholder="Your Email" required>
                        <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
                        <!-- <textarea name="message" rows="1" placeholder="Your Message" required></textarea> -->
                        <input type="submit" name="submit" class="send-btn" value="Send">
                    </form>
                </div>
            </section>
        </div>
    </body>
</html>