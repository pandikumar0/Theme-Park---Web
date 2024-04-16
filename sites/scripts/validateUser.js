let roles = { Pandi: "Pandi@123", Admin: "Admin_role", Aagash: "alfero123" };

function validateAdmin() {
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let res = document.getElementById("result");
  if (username in roles) {
    if (roles[username] !== password) {
      res.innerHTML = "For Username, Password is not correct!!";
    } else {
      window.location.href = "/Astralland/admin";
    }
  } else {
    res.innerHTML = "Admin Role not exists!!";
  }
}

function createAdmin() {
    
}
