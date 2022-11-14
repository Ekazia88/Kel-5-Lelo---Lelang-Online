<?php
require '../../config.php';
session_start();
if($_SESSION['level'] != "admin"){
    echo "<script>alert('Anda Bukan Admin!!!');
    document.location.href ='../index.php?pesan=gagal';</script>";
}
$sql = mysqli_query($conn, "SELECT * FROM produk");
$sql1 = mysqli_query($conn,"SELECT * FROM Kategori");
$produk = [];
while($row = mysqli_fetch_assoc($sql)){
  $produk[] =$row;
}
$kategori = [];
while($row = mysqli_fetch_assoc($sql1)){
  $kategori[] =$row;
}
if(isset($_POST['add'])){
  $nama = $_POST['produk'];
  $kategori = $_POST['id_kat'];
  $dimulai = $_POST['dtstart'];
  $berakhir = $_POST['dtend'];
       $cek = mysqli_query($conn,"SET FOREIGN_KEY_CHECKS=0;");
      $sql = "INSERT INTO bid values ('','$kategori','$dimulai','$berakhir','','ditutup','$nama','')";
      $result = mysqli_query($conn, $sql);
      if($cek){
        if($result){
            echo"<script>
                    alert('Data Berhasil Ditambahkan');
                    document.location.href ='read.php';
                    </script>";
        }else{
            echo"<script>
            alert('Data Gagal Ditambahkan');
            document.location.href ='add.php';
            </script>";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./../css/style.css">
    <link rel="stylesheet" href="./../css/crud.css">
    <!-- Font Icons -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../css/fontawesome-free-6.2.0-web/css/all.css">
    <link rel="stylesheet" href="../css/fontawesome-free-6.2.0-web/css/all.min.css">

    
</head>
<body>
<nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="./../img/admin-profile.png" alt="">
                </span>

                <div class="text logo-text">
                    <span class="name">Admin</span>
                    <span class="text-2">Admin Page</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="../index.php">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Home</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="user.php">
                            <i class='bx bxs-user-rectangle icon' ></i>
                            <span class="text nav-text">User</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="../kategori/read.php">
                            <i class='bx bxs-category icon' ></i>
                            <span class="text nav-text">Category</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="../produk/read.php">
                            <i class='bx bxs-cart icon'></i>
                            <span class="text nav-text">Product</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="../lelang/read.php">
                            <i class='bx bxs-briefcase-alt-2 icon'></i>
                            <span class="text nav-text">Lelang</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="../bid/read.php">
                            <i class='bx bx-book icon'></i>
                            <span class="text nav-text">Bid Status</span>
                        </a>
                    </li>

                </ul>
            </div>
            <div class="bottom-content">
                <li class="nav-link">
                    <a href="../../Auth/logout.php">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>
            </div>
        </div>
    </nav>
    <section class="main">
        <div class="text">Lelang / Add Lelang</div>
        <div class="content">
            <h1>Tambah Data</h1>
            <form action="" method="post">
                <div class="container">          
                    <label for="produk"><b>Product</b></label>
                    <?php $i = 1; foreach($produk as $prk):?>
                    <select id="produk" class="form-control"name="produk">
                    <option value disabled selected>Pilih Produk</option>
                        <?php $i;?>
                      <option value="<?php echo $prk['id_produk'];?>"><?php echo $prk['nama'];?></option>
                     
                    </select>
                    <?php $i++; endforeach; ?>
                    <label for="Kategori"><b>Kategori</b></label>

                    <select id="produk" class="form-control" name="id_kat">
                    <option value disabled selected>Pilih Kategori</option>
                    <?php $a = 1; foreach($kategori as $kat) :?>
                        <?php $a;?>
                      <option value="<?php echo $kat['id_kat'];?>"><?php echo $kat['name_kat']?></option>
                      <?php $a++; endforeach; ?>
                    </select>

                  <label for="dtstart"><b>Tanggal Dimulai</b></label>
                  <input type="datetime-local" id="" class="form-control"name="dtstart">

                  <label for="dtend"><b>Tanggal Berakhir</b></label>
                  <input type="datetime-local"  id="" class="form-control"name="dtend">
                  <hr>
                  <button type="submit" class="registerbtn" name="add">Tambah Data</button>
                </div>
              </form>
            </div>
        </div>
    </section>
</body>
<script>
const body = document.querySelector('body'),
  sidebar = body.querySelector('nav'),
  toggle = body.querySelector(".toggle"),
  modeText = body.querySelector(".mode-text");


toggle.addEventListener("click" , () =>{
sidebar.classList.toggle("close");
})

</script>
</html>
