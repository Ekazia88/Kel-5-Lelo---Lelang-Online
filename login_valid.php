<?php 

session_start();

include '../config.php';
 
$useremail =$_POST['user-email'];

$password = $_POST['pass'];

$login = mysqli_query($conn,"SELECT * from users where email='$useremail' or username ='$useremail'");
$cek = mysqli_num_rows($login);
 
if($cek > 0){
	$data = mysqli_fetch_assoc($login);
	if(password_verify($password, $data['password'])) {
		if($data['level']=="admin"){	
			$_SESSION['email'] = $useremail;
			$_SESSION['username'] = $username;
			$_SESSION['level'] = "admin";
			header("location:../admin/index.php");
		}else if($data['level']=="user"){
			$_SESSION['email'] = $useremail;
			$_SESSION['level'] = "user";
   			header("Location: ../user/index.php");
		}
	}else{
		echo "<script>alert('22');</script>";
		header("location:login.php?pesan=wrongpas");
	}	
}else{
	header("location:login.php?pesan=gagal2");
} 
?>