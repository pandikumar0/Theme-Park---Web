let roles = { Pandi: "Pandi@123", Admin: "Admin_role", Aagash: "alfero123" };

function validateAdmin() {
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let res = document.getElementById("result");
  if (username in roles) {
    if (roles[username] !== password) {
      res.innerHTML = "For Username, Password is not correct!!";
    } else {
      window.location.href = "./Admin.html";
    }
  } else {
    res.innerHTML = "Admin Role not exists!!";
  }
}

function createAdmin() {
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let res = document.getElementById("result");

  if (username in roles) {
    res.innerHTML = "Admin Role already exists.....";
  } else {
    roles[username] = password;
    res.innerHTML =
      "Admin Created Successfully....\nRedirecting to Admin Login Portal";
    setTimeout(() => {
      window.location.href = "./AdminLogin.html";
    }, 1000);
  }
}

function deleteAdmin(username) {
  delete roles[username];
  window.location.reload();
}

function changeAdminPassword(username) {
  let new_pwd = window.prompt("Enter New Password for: " + username);
  if (new_pwd) {
    // Check if the user entered a new password
    roles[username] = new_pwd;
    alert("Password changed successfully!");
    window.location.reload();
  }
}

function redirectPage(url) {
  window.location.href = url;
}
